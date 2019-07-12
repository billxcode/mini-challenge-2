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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startPhaseTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "goToStartPhase", sender: self)
    }
}

