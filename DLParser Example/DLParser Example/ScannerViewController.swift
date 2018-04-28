//
//  ScannerViewController.swift
//  DLParser Example
//
//  Created by Andrew Johnson on 4/28/18.
//  Copyright © 2018 Andrew Johnson. All rights reserved.
//

import UIKit
import GoogleMobileVision
import AVFoundation
import DLParser

class ScannerViewController: UIViewController {
    
    // MARK: - Properties
    
    private let videoSession = AVCaptureSession()
    private lazy var barCodeDetector = GMVDetector(ofType: GMVDetectorTypeBarcode,
                                                   options: nil)
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let layer = AVCaptureVideoPreviewLayer(session: self.videoSession)
        layer.backgroundColor = UIColor.black.cgColor
        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        return layer
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVideoSession()
        configureVideoOutput()
        layoutPreviewLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        videoSession.startRunning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        videoSession.stopRunning()
    }
    
    func layoutPreviewLayer() {
        view.layer.masksToBounds = true
        previewLayer.frame = view.bounds
        previewLayer.position = CGPoint(x: previewLayer.frame.midX,
                                        y: previewLayer.frame.midY)
        view.layer.addSublayer(previewLayer)
    }
    
    
    func configureVideoSession() {
        defer { videoSession.commitConfiguration() }
        videoSession.beginConfiguration()
        
        // Set the camera quality
        videoSession.sessionPreset = .high
        
        let position = AVCaptureDevice.Position.back
        guard let deviceInput = getDeviceInput(forPosition: position) else {
            return
        }
        videoSession.addInput(deviceInput)
    }
    
    func configureVideoOutput() {
        // Create the desired video output settings
        let videoDataOutput = AVCaptureVideoDataOutput()
        videoDataOutput.alwaysDiscardsLateVideoFrames = true
        videoDataOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global(qos: .background))
        videoDataOutput.videoSettings = [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA
        ]
        
        // Check if the device can support the settings and add it
        if videoSession.canAddOutput(videoDataOutput) {
            videoSession.addOutput(videoDataOutput)
        }
    }
    
    func getDeviceInput(forPosition position: AVCaptureDevice.Position) -> AVCaptureDeviceInput? {
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera],
                                                                mediaType: AVMediaType.video,
                                                                position: position)
        for device in discoverySession.devices {
            guard device.position == position else {
                continue
            }
            
            do {
                let input = try AVCaptureDeviceInput(device: device)
                return videoSession.canAddInput(input) ? input : nil
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
    
    private func findDriverLicense(inImage image: UIImage) {
        let orientation = GMVUtility.imageOrientation(from: UIDevice.current.orientation,
                                                      with: AVCaptureDevice.Position.back,
                                                      defaultDeviceOrientation: UIDevice.current.orientation)
        let barcodeOptions = [NSNumber(value: 6): orientation]
        let features = barCodeDetector?.features(in: image, options: barcodeOptions) ?? []
        
        guard features.count > 0 else {
            return
        }
        
        let barcodes = features.flatMap { $0 as? GMVBarcodeFeature }
        let licenses = barcodes.map { AAMVAParser(data: $0.rawValue).parse() }
        guard let license = licenses.first(where: { $0.isAcceptable }) else {
            return
        }
        let output = String(describing: license).replacingOccurrences(of: ", ", with: "\n")
        playFeedback()
        print(output)
    }
    
    func playFeedback() {
        DispatchQueue.main.async {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
    }
}


// MARK: - Sample Buffer Delegate

extension ScannerViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from connection: AVCaptureConnection) {
        guard let image = GMVUtility.sampleBufferTo32RGBA(sampleBuffer) else {
            return
        }
        findDriverLicense(inImage: image)
    }
}


