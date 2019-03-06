//
//  ScannerPresenter.swift
//  DLParser Example
//
//  Created by Andrew Johnson on 3/6/19.
//  Copyright © 2019 Andrew Johnson. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import GoogleMobileVision
import DLParser

/// The delegate for presenting results from the `ScannerPresenter`.
protocol ScannerPresenterDelegate: class {
    
    /// Called when a valid driver license barcode is detected in the video camera.
    ///
    /// - Parameter license: The processed license detected in the video camera.
    func didFindDriverLicense(_ license: DriverLicense)
}

/// The presenter for the `ScannerViewController` that is responsible for processing logic.
final class ScannerPresenter: NSObject {
    
    // MARK: - Properties
    
    weak var delegate: ScannerPresenterDelegate?
    
    /// The handle on the video camera.
    let videoSession = AVCaptureSession()
    
    private lazy var barCodeDetector = GMVDetector(ofType: GMVDetectorTypeBarcode,
                                                   options: nil)
    

    // MARK: - Lifecycle
    
    override init() {
        super.init()
        configureVideoSession()
        configureVideoOutput()
    }
    
    
    // MARK: - Public Functions
    
    /// Toggles the video camera on or off.
    ///
    /// - Parameter isStarting: True, if the video camera should be active.
    func startVideo(_ isStarting: Bool) {
        isStarting ? videoSession.startRunning() : videoSession.stopRunning()
    }
    
    
    // MARK: - Helper Functions
    
    private func configureVideoSession() {
        // Start the configuration
        defer { videoSession.commitConfiguration() }
        videoSession.beginConfiguration()
        
        // Set the camera quality
        videoSession.sessionPreset = .high
        
        // Set the rear camera as the input
        let position = AVCaptureDevice.Position.back
        guard let deviceInput = getDeviceInput(forPosition: position) else {
            return
        }
        videoSession.addInput(deviceInput)
    }
    
    private func configureVideoOutput() {
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
    
    private func getDeviceInput(forPosition position: AVCaptureDevice.Position) -> AVCaptureDeviceInput? {
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
        
        let barcodes = features.compactMap { $0 as? GMVBarcodeFeature }
        let licenses = barcodes.map { AAMVAParser(data: $0.rawValue).parse() }
        guard let license = licenses.first(where: { $0.isAcceptable }) else {
            return
        }
        delegate?.didFindDriverLicense(license)
    }
}


// MARK: - Sample Buffer Delegate

extension ScannerPresenter: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from connection: AVCaptureConnection) {
        guard let image = GMVUtility.sampleBufferTo32RGBA(sampleBuffer) else {
            return
        }
        findDriverLicense(inImage: image)
    }
}
