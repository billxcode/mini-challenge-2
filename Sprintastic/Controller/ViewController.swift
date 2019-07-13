//
//  ViewController.swift
//  Sprintastic
//
//  Created by Idris on 12/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startImageView: UIImageView!
    @IBOutlet weak var accelerationImageView: UIImageView!
    @IBOutlet weak var constanImageView: UIImageView!
    @IBOutlet weak var finishImageView: UIImageView!
    @IBOutlet weak var exerciseImageView: UIImageView!
    
    var phaseData = Phase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startPhaseTapped(_ sender: UITapGestureRecognizer) {
        checkPhase(sender: sender.view!.tag)
        performSegue(withIdentifier: "goToPhase", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PhaseDetailViewController
        vc.phaseData = phaseData
    }
    
    func checkPhase(sender:Int){
        phaseData.titleRules = "Rules"
        phaseData.titleSupporting = "Supporting"
        phaseData.descriptionSupporting = "ini deskripsi supporting"
        switch sender {
        case 0:
            phaseData.titlePhase = "Starting Block"
            phaseData.descriptionPhase = "Deskripsi judul fase"
            phaseData.descriptionRules = "ini deskripsi rules"
        case 1:
            phaseData.titlePhase = "Acceleration"
            phaseData.descriptionPhase = "Deskripsi judul fase"
            phaseData.descriptionRules = "ini deskripsi rules"
        case 2:
            phaseData.titlePhase = "Constant"
            phaseData.descriptionPhase = "Deskripsi judul fase"
            phaseData.descriptionRules = "ini deskripsi rules"
        case 3:
            phaseData.titlePhase = "finish"
            phaseData.descriptionPhase = "Deskripsi judul fase"
            phaseData.descriptionRules = "ini deskripsi rules"
        default:
            phaseData.titlePhase = "Starting Block"
            phaseData.descriptionPhase = "Deskripsi judul fase"
            phaseData.descriptionRules = "ini deskripsi rules"
        }
    }
}

