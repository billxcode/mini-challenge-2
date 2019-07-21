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
    
    let uiResult: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let uiClose: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Close"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openCamera()
        self.navigationController?.navigationBar.isHidden = false
        // Do any additional setup after loading the view.
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
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
        setupResult()
    }
    
    fileprivate func setupResult()
    {
        view.addSubview(uiResult)
//        view.addSubview(uiClose)
//        let centerX = NSLayoutConstraint(item: uiResult, attribute: .centerX, relatedBy: .equal, toItem: superView , attribute: .centerX, multiplier: 1, constant: 0)
//        let centerY = NSLayoutConstraint(item: uiResult, attribute: .centerY, relatedBy: .equal, toItem: superView , attribute: .centerY, multiplier: 1, constant: 0)
//
//        uiClose.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
//        uiClose.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//
//        NSLayoutConstraint.activate([centerY, centerX])
//
//        let rotation = UIInterfaceOrientation.landscapeRight.rawValue
//        UIDevice.current.setValue(rotation, forKey: "orientation")
        
        uiResult.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        uiResult.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        uiResult.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        uiResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        guard let model = try? VNCoreMLModel(for: SprintModel().model) else { return }
        let request = VNCoreMLRequest(model: model) {
            (request, error) in
            
            guard let results = request.results as? [VNClassificationObservation] else { return }
            guard let firstObserver = results.first else { return }
            
            print(firstObserver.identifier, (firstObserver.confidence * 100))
            
            DispatchQueue.main.async {
                self.uiResult.text = "\(firstObserver.identifier) = \(firstObserver.confidence * 100)"
            }
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
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
