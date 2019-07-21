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
    
    let uiClose: UIButton = {
        let button = UIButton()
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closing), for: .touchDown)
        return button
    }()
    
    @objc func closing(_ sender: UIButton!)
    {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openCamera()
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
//        view.addSubview(uiResult)
        view.addSubview(uiClose)
        
        uiClose.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        uiClose.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        let rotation = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(rotation, forKey: "orientation")
//
//        uiResult.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
//        uiResult.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        uiResult.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        uiResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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

extension AVAsset {
    
}
