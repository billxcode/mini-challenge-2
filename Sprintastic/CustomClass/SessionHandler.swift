//
//  SessionHandler.swift
//  Sprintastic
//
//  Created by Idris on 19/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import WatchKit
import WatchConnectivity

class SessionHandler: NSObject,WCSessionDelegate {
    static let shared = SessionHandler()
    var session = WCSession.default
    
    override init() {
        super.init()
        if isSupported(){
            session.delegate = self
            session.activate()
        }
    }
    
    func isSupported()->Bool{
        return WCSession.isSupported()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        self.session.activate()
    }
}
