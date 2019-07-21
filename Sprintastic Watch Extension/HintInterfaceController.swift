//
//  HintInterfaceController.swift
//  Sprintastic Watch Extension
//
//  Created by Idris on 21/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import WatchKit
import Foundation


class HintInterfaceController: WKInterfaceController {
    @IBOutlet weak var hintLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.pushController(withName: "goToHintImage", context: nil)
        })
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
