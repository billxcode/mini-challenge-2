//
//  ViewController.swift
//  Sprintastic
//
//  Created by Idris on 12/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typeOfExcersise.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = collectionView.dequeueReusableCell(withReuseIdentifier: "excersiseCell", for: indexPath) as? ExerciseCollectionViewCell
        data?.rangeTrack.text = typeOfExcersise[indexPath.row]
        data?.backgroundImage.image = UIImage(named: background[indexPath.row])
        return data!
    }
    

    @IBOutlet weak var startImageView: UIImageView!
    @IBOutlet weak var accelerationImageView: UIImageView!
    @IBOutlet weak var constanImageView: UIImageView!
    @IBOutlet weak var finishImageView: UIImageView!
    
    var phaseData = Phase()
    
    let typeOfExcersise = ["100M", "200M", "400M"]
    let background = ["100M", "200M", "100M"]
    
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
        phaseData.descriptionSupporting = "If you have Apple watch, you could control our apps by your watch"
        switch sender {
        case 0:
            phaseData.titlePhase = "Starting Block"
            phaseData.descriptionPhase = "Starting block consist of 3 phases, there are ready, set and go. in this activity you need to position your body to all that phases, and let this apps lead your phases until its clearly correct."
            phaseData.descriptionRules = """
            * put your phone in enjoyable place
            * make sure your camera could capture your entire body
            * you could control our apps using apple watch
            """
        case 1:
            phaseData.titlePhase = "Acceleration"
            phaseData.descriptionPhase = "Being able to accelerate quickly and powerfully is probably the most important skill that needs to be improved in all athletes. Athletes in every sport need to be able to run as fast as possible as quickly as possible. in this activity our apps will lead you to learn how to do the right acceleration"
            phaseData.descriptionRules = """
            * put your phone in enjoyable place
            * make sure your camera could capture your entire body
            * you could control our apps using apple watch
            """
        case 2:
            phaseData.titlePhase = "Constant Speed"
            phaseData.descriptionPhase = "The constant speed phase can be submaximal, maximal or supramaximal and is characterized by both the stride length and stride frequency remaining the same over a period of time. we will validate your body when doing constant speed to make sure your position is correct"
            phaseData.descriptionRules = """
            * put your phone in enjoyable place
            * make sure your camera could capture your entire body
            * you could control our apps using apple watch
            """
        case 3:
            phaseData.titlePhase = "Deceleration"
            phaseData.descriptionPhase = "The last phase is categorized by a decrease in sprinting speed, usually occurring between the 80 and 100-meter mark in top sprinters. Velocity begins to decrease on a scale of .5 to 1.5 meters per second and is caused by central and peripheral fatigue."
            phaseData.descriptionRules = """
            * put your phone in enjoyable place
            * make sure your camera could capture your entire body
            * you could control our apps using apple watch
            """
        default:
            phaseData.titlePhase = "Starting Block"
            phaseData.descriptionPhase = "Starting block consist of 3 phases, there are ready, set and go. in this activity you need to position your body to all that phases, and let this apps lead your phases until its clearly correct."
            phaseData.descriptionRules = """
            * put your phone in enjoyable place
            * make sure your camera could capture your entire body
            * you could control our apps using apple watch
            """
        }
    }
}

