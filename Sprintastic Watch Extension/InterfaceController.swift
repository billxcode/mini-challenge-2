//
//  InterfaceController.swift
//  Sprintastic Watch Extension
//
//  Created by Idris on 18/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController,WCSessionDelegate {
    private var session = WCSession.default
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if isSupported(){
            session.delegate = self
            session.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    private func isSupported()->Bool{
        return WCSession.isSupported()
    }
    
    private func isReachable()->Bool{
        return session.isReachable
    }
    
//    delegate function watch connectivity
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
    }
    
    
    @IBAction func readyButtonTapped() {
        pushController(withName: "goToCountDown", context:nil)
    }
}