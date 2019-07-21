//
//  FirstDirectionBeforeCameraViewController.swift
//  Sprintastic
//
//  Created by Bill Tanthowi Jauhari on 22/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit

class FirstDirectionBeforeCameraViewController: UIViewController {
    @IBOutlet var superView: UIView!
    
    let direction: UILabel = {
        let label = UILabel()
        label.text = "Put Your Phone to Capture Your Full Body"
        label.textAlignment = .center
        label.font = UIFont(name: label.font.fontName, size: 25)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        superView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        
        // Do any additional setup after loading the view.
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
