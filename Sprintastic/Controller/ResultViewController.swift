//
//  ResultViewController.swift
//  Sprintastic
//
//  Created by Bill Tanthowi Jauhari on 22/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rotation = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(rotation, forKey: "orientation")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func retry(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectActivity(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
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
