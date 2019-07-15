//
//  StartPhaseViewController.swift
//  Sprintastic
//
//  Created by Idris on 12/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit

class StartPhaseViewController: UIViewController {
    @IBOutlet weak var phaseTitle: UILabel!
    var phaseData = Phase()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        phaseTitle.text = phaseData.titlePhase
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
