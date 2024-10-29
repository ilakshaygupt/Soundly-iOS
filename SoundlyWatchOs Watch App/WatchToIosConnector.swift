//
//  WatchToIosConnector.swift
//  SoundlyWatchOs Watch App
//
//  Created by Lakshay Gupta on 22/10/24.
//

import Foundation


import WatchConnectivity

class WatchToIosConnector : NSObject, WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {

    }

    func sendMacrosToIos(){
        
    }


    var session:WCSession
    init (session:WCSession = .default){
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }

}
