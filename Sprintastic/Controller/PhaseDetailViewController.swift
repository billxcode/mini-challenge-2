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
        switch phaseData.titlePhase {
        case "Starting Block":
            tutorialVideoView.load(withVideoId: "B1nO5bC_v4Q")
        case "Acceleration":
            tutorialVideoView.load(withVideoId: "bIsKXTp3nA0")
        case "Constant Speed":
            tutorialVideoView.load(withVideoId: "5cnVAgk3G7o")
        case "Deceleration":
            tutorialVideoView.load(withVideoId: "deps-IrQkqs")
        default:
            tutorialVideoView.load(withVideoId: "B1nO5bC_v4Q")
        }
        titlePhaseLabel.text = phaseData.titlePhase
        descriptionPhaseLabel.text = phaseData.descriptionPhase
        titleRulesLabel.text = phaseData.titleRules
        descriptionRulesLabel.text = phaseData.descriptionRules
        titleSupportingLabel.text = phaseData.titleSupporting
        descriptionSupportingLabel.text = phaseData.descriptionSupporting
    }
}
