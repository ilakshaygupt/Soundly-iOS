//
//  WatchToIosConnector.swift
//  SoundlyWatchOs Watch App
//
//  Created by Lakshay Gupta on 22/10/24.
//

import Foundation


import WatchConnectivity
class WatchToIosConnector: NSObject, WCSessionDelegate {
    static let shared = WatchToIosConnector()
    
    @Published var currentSong: WatchSongData?
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("WCSession activation failed with error: \(error.localizedDescription)")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async { [weak self] in
            let songData = WatchSongData(
                title: message["title"] as? String ?? "",
                artist: message["artist"] as? String ?? "",
                duration: message["duration"] as? Double ?? 0.0,
                currentTime: message["currentTime"] as? Double ?? 0.0,
                isPlaying: message["isPlaying"] as? Bool ?? false
            )
            self?.currentSong = songData
        }
    }
    
    func sendPlayPauseCommand() {
        guard session.isReachable else { return }
        let message = ["command": "playPause"]
        session.sendMessage(message, replyHandler: nil) { error in
            print("Error sending command to iOS: \(error.localizedDescription)")
        }
    }
}

struct WatchSongData {
    let title: String
    let artist: String
    let duration: Double
    let currentTime: Double
    let isPlaying: Bool
}
