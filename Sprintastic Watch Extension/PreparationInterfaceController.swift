//
//  PreparationInterfaceController.swift
//  Sprintastic Watch Extension
//
//  Created by Idris on 20/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import WatchKit
import Foundation


class PreparationInterfaceController: WKInterfaceController {

    @IBOutlet weak var loadingLabel: WKInterfaceLabel!
    var loadingValue = "."
    @IBOutlet weak var labelHint: WKInterfaceLabel!
    var timer = Timer()
    var bool = false
    var timerCount = Timer()
    var temp = 0
    var interval:TimeInterval = 5
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        countTimer()
        runTimer()
        
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    func countTimer(){
        timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateLoadingValue), userInfo: nil, repeats: true)
    }
    
    @objc func updateLoadingValue(){
        loadingValue += "."
        if loadingValue == "......" {
            loadingValue = "."
        }
        loadingLabel.setText(loadingValue)
    }
    
    @objc func updateTimer(){
        temp += 1
        switch temp {
        case 1:
            labelHint.setText("FIT FULL YOUR BODY")
        case 2:
            labelHint.setText("SHOW YOUR BODY'S SIDE")
        case 3:
            labelHint.setText("STARTING BLOCK READY")
            timer.invalidate()
            temp = 1
            goToCountDown()
        default:
            labelHint.setText("FIT FULL YOUR BODY")
        }
//        labelHint.setText("FIT FULL YOUR BODY")
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5) {
//            self.labelHint.setText("SHOW YOUR BODY'S SIDE")
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5, execute: {
//                self.labelHint.setText("STARTING BLOCK READY")
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5) {
//                    self.goToCountDown()
//                }
//            })
//        }
    }
    
    @objc func goToCountDown(){
        pushController(withName: "goToCountDown", context: nil)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
