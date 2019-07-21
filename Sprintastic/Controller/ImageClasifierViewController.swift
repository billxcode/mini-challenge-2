//
//  ImageClasifierViewController.swift
//  Sprintastic
//
//  Created by Bill Tanthowi Jauhari on 18/07/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit
import Vision
import CoreML
import AVKit

class ImageClasifierViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    @IBOutlet var superView: UIView!
    
    let uiDirection: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        uiview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width)
        return uiview
    }()
    
    let uiFirstDirectionLabel: UILabel = {
       let uilabel = UILabel()
        uilabel.text = "Put Your Phone to Capture Your Body"
        uilabel.font = UIFont(name: uilabel.font.fontName, size: 40)
        uilabel.textColor = .white
        uilabel.font = UIFont.boldSystemFont(ofSize: 20)
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textAlignment = .center
        uilabel.numberOfLines = 0
        return uilabel
    }()
    
    let uiResult: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var uiLabelDirection: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.font = UIFont(name: label.font.fontName, size: 35)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.frame = CGRect(x: 70, y: 10, width: 100, height:300)
        label.text = "Show your body"
        return label
    }()
    
    var uiLabelSuggestion: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.font = UIFont(name: label.font.fontName, size: 35)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.frame = CGRect(x: 600, y: 10, width: 100, height:300)
        label.text = "Adjust your arm"
        return label
    }()
    
    let uiClose: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("X", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closing), for: .touchDown)
        return button
    }()
    
    let uiLeftSide: UIView = {
       let uiview = UIView()
        uiview.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        uiview.alpha = 0.5
        uiview.frame = CGRect(x: 0, y: 0, width: 250, height: 500)
        return uiview
    }()
    
    let uiRightSide: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        uiview.alpha = 0.5
        uiview.frame = CGRect(x: 550, y: 0, width: 300, height: 500)
        return uiview
    }()
    
    var timer: Timer!
    
    var currentCount = 1
    
    @objc func closing(_ sender: UIButton!)
    {
        self.dismiss(animated: false, completion: nil)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openCamera()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideFirstViewDirection), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func hideFirstViewDirection()
    {
        currentCount += 1
        if currentCount > 5 {
            timer.invalidate()
            self.uiDirection.isHidden = true
            self.uiFirstDirectionLabel.isHidden = true
        }
    }
    
    private func openCamera()
    {
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo

        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = CGRect(x: 0, y: 0, width: view.frame.height, height: view.frame.width)
        previewLayer.connection?.videoOrientation = .landscapeRight
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
        setupResult()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let rotation = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(rotation, forKey: "orientation")
    }
    
    fileprivate func setupResult()
    {
        view.addSubview(uiLeftSide)
        view.addSubview(uiRightSide)
        view.addSubview(uiLabelDirection)
        view.addSubview(uiLabelSuggestion)
        view.addSubview(uiClose)
        view.addSubview(uiDirection)
        view.addSubview(uiFirstDirectionLabel)
        
        let x = NSLayoutConstraint(item: uiFirstDirectionLabel, attribute: .centerX, relatedBy: .equal, toItem: uiDirection, attribute: .centerX, multiplier: 1.0, constant: 0)
        let y = NSLayoutConstraint(item: uiFirstDirectionLabel, attribute: .centerY, relatedBy: .equal, toItem: uiDirection, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        NSLayoutConstraint.activate([x,y])
        
        uiClose.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        uiClose.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        let rotation = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(rotation, forKey: "orientation")
        
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        connection.videoOrientation = AVCaptureVideoOrientation.landscapeLeft
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        guard let model = try? VNCoreMLModel(for: SprintModel().model) else { return }
        let request = VNCoreMLRequest(model: model) {
            (request, error) in
            
            guard let results = request.results as? [VNClassificationObservation] else { return }
            guard let firstObserver = results.first else { return }
            
            DispatchQueue.main.async {
                self.uiResult.text = "\(firstObserver.identifier) = \(firstObserver.confidence * 100)"
            }
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }

}
