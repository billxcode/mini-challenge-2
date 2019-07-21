//
//  CounDownInterfaceController.swift
//  Sprintastic Watch Extension
//
//  Created by Idris on 20/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import WatchKit
import Foundation


class CountDownInterfaceController: WKInterfaceController {
    @IBOutlet weak var numberLabel: WKInterfaceLabel!
    var timer = Timer()
    var seconds = 3
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        runTimer()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        seconds -= 1
        if seconds == 1 {
            timer.invalidate()
            pushController(withName: "goToHint", context: nil)
        }
        
        numberLabel.setText("\(seconds)")
    }

}
