//
//  PhaseDetailViewController.swift
//  Sprintastic
//
//  Created by Idris on 13/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class PhaseDetailViewController: UIViewController {

   
    @IBOutlet weak var tutorialVideoView: WKYTPlayerView!
    @IBOutlet weak var titlePhaseLabel: UILabel!
    @IBOutlet weak var descriptionPhaseLabel: UILabel!
    @IBOutlet weak var titleRulesLabel: UILabel!
    @IBOutlet weak var descriptionRulesLabel: UILabel!
    @IBOutlet weak var titleSupportingLabel: UILabel!
    @IBOutlet weak var descriptionSupportingLabel: UILabel!
    
    var phaseData = Phase()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tutorialVideoView.load(withVideoId: "rJ0BRPgUxb8")
        titlePhaseLabel.text = phaseData.titlePhase
        descriptionPhaseLabel.text = phaseData.descriptionPhase
        titleRulesLabel.text = phaseData.titleRules
        descriptionRulesLabel.text = phaseData.descriptionRules
        titleSupportingLabel.text = phaseData.titleSupporting
        descriptionSupportingLabel.text = phaseData.descriptionSupporting
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
