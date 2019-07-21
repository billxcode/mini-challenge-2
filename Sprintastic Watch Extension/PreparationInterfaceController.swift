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
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        countTimer()
        runTimer()
        
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: false)
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
        bool = true
        if bool{
            timer.invalidate()
            labelHint.setText("SHOW YOUR BODY'S SIDE")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                self.goToCountDown()
            }
        }
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
