//
//  Connector.swift
//  Soundly
//
//  Created by Lakshay Gupta on 22/10/24.
//

import Foundation

import WatchConnectivity
class WatchConnection: NSObject, WCSessionDelegate {
    static let shared = WatchConnection()
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
        DispatchQueue.main.async {
            guard let command = message["command"] as? String else { return }
            
            switch command {
            case "playPause":
                if CurrentSongViewModel.shared.isPlaying {
                    CurrentSongViewModel.shared.pause()
                } else {
                    CurrentSongViewModel.shared.play()
                }
            case "seek":
                if let time = message["time"] as? Double {
                    CurrentSongViewModel.shared.seek(to: time)
                }
            default:
                break
            }
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate() 
    }
    
    // Send current song data to Watch
    func sendCurrentSongToWatch() {
        guard session.isReachable else { return }
        
        let currentSong = CurrentSongViewModel.shared.currentSong
        let songData: [String: Any] = [
            "title": currentSong?.name ?? "",
            "artist": currentSong?.name ?? "",
            "duration": currentSong?.durationInSeconds ?? 0.0,
            "currentTime": CurrentSongViewModel.shared.currentTime,
            "isPlaying": CurrentSongViewModel.shared.isPlaying
        ]
        
        session.sendMessage(songData, replyHandler: nil) { error in
            print("Error sending song data to watch: \(error.localizedDescription)")
        }
    }
}

extension CurrentSongViewModel {
    func updateWatchApp() {
        WatchConnection.shared.sendCurrentSongToWatch()
    }

}
