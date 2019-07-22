//
//  BaseViewController.swift
//  Sprintastic
//
//  Created by Bill Tanthowi Jauhari on 17/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIApplicationDelegate {

    let orientation = UIInterfaceOrientationMask.all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
