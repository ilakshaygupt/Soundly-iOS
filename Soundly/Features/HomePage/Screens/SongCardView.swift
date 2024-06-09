import SwiftUI
import AVKit
import Combine

struct SongCardView: View {
    @State private var showingSheet = false
    let song: Song
    @State private var isLoading = true
    @State private var player: AVPlayer?
    @State private var songData: SongData?
    @ObservedObject var currentSongViewModel = CurrentSongViewModel.shared
    var body: some View {
        VStack {
            if isLoading {
                ShimmerView()
            } else {
                AsyncImage(url: URL(string: song.thumbnail_url)) { image in
                    image
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 180, height: 180)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .controlSize(.large)
                }
                Text(song.artist)
                    .font(.title2)
            }
        }
        .onTapGesture {
            fetchSongDetails()
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            if let player = player, let songData = songData {


                SongSheetView(player: player, song: songData)
            }
        }
        .onAppear {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
        .frame(width: 200, height: 200)
        .padding()
    }

    func fetchSongDetails() {
        if currentSongViewModel.currentSong != nil && currentSongViewModel.currentSong!.id == self.song.id {
            DispatchQueue.main.async {
                self.songData = CurrentSongViewModel.shared.currentSong
                self.showingSheet = true
            }

        }

        else{


            guard let url = URL(string: "https://soundly.weblakshay.tech/music/api/getsong/\(song.id)/") else { return }

            var request = URLRequest(url: url)
            request.addValue("Bearer \(Auth.shared.getAccessToken() ?? "")", forHTTPHeaderField: "Authorization")

            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                do {

                    let decodedResponse = try JSONDecoder().decode(SongDetailsResponse.self, from: data)

                    if let songData = decodedResponse.data {
                        DispatchQueue.main.async {
                            self.player = AVPlayer(url: URL(string: songData.song_url)!)
                            self.songData = songData
                            self.player?.play()
                            self.showingSheet = true
                        }
                    }
                } catch {
                    print(1)
                    print("Error decoding response: \(error.localizedDescription)")
                }
            }.resume()}
    }
}

struct SongCardView_Previews: PreviewProvider {
    static var previews: some View {
        SongCardView(song: Song(id: 59, name: "Brown Rang", uploader: "admin", language: "punjabi", song_duration: "02:59", mood: "upbeat", genre: "Hip-Hop", thumbnail_url: "http://res.cloudinary.com/ds9i3o1hj/image/upload/v1699643612/euzlwq1tmtwbxlnr1vzr.jpg", artist: "Honey Singh", is_private: false, is_liked: false))
    }
}
