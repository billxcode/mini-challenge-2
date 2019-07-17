//
//  BaseViewController.swift
//  Sprintastic
//
//  Created by Bill Tanthowi Jauhari on 17/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changesLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        changesLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        changesLayout()
    }
    
    public func changesLayout()
    {
        let width = view.frame.width
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 25, width: width, height: 100)
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
