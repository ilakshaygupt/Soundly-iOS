//
//  PlayerControlLogic.swift
//  Soundly
//
//  Created by Lakshay Gupta on 16/11/24.
//


import AVKit
import Combine
import AVKit
import Combine

class PlayerControlsLogic: ObservableObject {
    static let shared = PlayerControlsLogic()
    private var cancellables = Set<AnyCancellable>()

    @Published var currentSong: SongData? = SongData.defaulty
    @Published var isPlaying: Bool = false
    @Published var currentTime: Double = 0.0
    @Published var isDragging: Bool = false

    private var player: AVPlayer?

    private init() {
        player = AVPlayer()

    }

    /// Main method to load song details, fetch its URL, and play the song
    func loadAndPlaySong(by id: Int) {
        guard let url = URL(string: "https://soundly.weblakshay.tech/music/api/getsong/\(id)/") else { return }

        var request = URLRequest(url: url)
        request.addValue("Bearer \(Auth.shared.getAccessToken() ?? "")", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data else {
                print("Error fetching song details: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(SongDetailsResponse.self, from: data)
                if let fetchedSongData = decodedResponse.data {
                    DispatchQueue.main.async {
                        // Store the song details
                        self?.currentSong = fetchedSongData

                        // Use the song_url from fetchedSongData directly to play the song
                        guard let songURL = URL(string: fetchedSongData.song_url) else {
                            print("Invalid song URL")
                            return
                        }
                        self?.playSong(using: songURL, songData: fetchedSongData)
                    }
                }
            } catch {
                print("Error decoding song details: \(error.localizedDescription)")
            }
        }.resume()
    }


    /// Fetch the song URL from the server
    private func fetchSongURL(for song: SongData, completion: @escaping (URL?) -> Void) {
        guard let url = URL(string: "https://soundly.weblakshay.tech/music/api/getsong/") else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(Auth.shared.getAccessToken() ?? "")", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(["song_id": song.id])

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("Error fetching song URL: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            do {
                let response = try JSONDecoder().decode(SongURLResponse.self, from: data)
                guard let songURL = response.songURL else {
                    completion(nil)
                    return
                }
                completion(URL(string: songURL))
            } catch {
                print("Error decoding song URL response: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }

    /// Play the song using its URL
    private func playSong(using url: URL, songData: SongData) {
        DispatchQueue.main.async {
            if let currentPlayer = self.player {
                currentPlayer.replaceCurrentItem(with: AVPlayerItem(url: url))
                currentPlayer.play()
                print("Playing song: \(songData.name)")
            }
            self.currentSong = songData
            self.isPlaying = true
        }
    }

    /// Toggle play/pause functionality
    func togglePlayPause() {
        guard let player = player else { return }
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }

    /// Seek to a specific time
    func seek(to time: Double) {
        player?.seek(to: CMTime(seconds: time, preferredTimescale: 1))
    }
}

// Helper structs for decoding responses
struct SongURLResponse: Decodable {
    let songURL: String?
}
