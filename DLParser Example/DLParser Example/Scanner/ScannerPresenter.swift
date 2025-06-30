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
import MLKitBarcodeScanning
import MLKitVision
import DLParser

/// The delegate for presenting results from the `ScannerPresenter`.
protocol ScannerPresenterDelegate: AnyObject {
    
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

    private lazy var barcodeScanner: BarcodeScanner = BarcodeScanner.barcodeScanner(
        options: BarcodeScannerOptions(formats: .PDF417)
    )
    

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
        DispatchQueue.global().async { [weak self] in
            isStarting ? self?.videoSession.startRunning() : self?.videoSession.stopRunning()
        }
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
}


// MARK: - Sample Buffer Delegate

extension ScannerPresenter: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from connection: AVCaptureConnection) {
        let visionImage = VisionImage(buffer: sampleBuffer)
        barcodeScanner.process(visionImage) { [weak self] barcodes, error in
            guard error == nil, let barcodes = barcodes, !barcodes.isEmpty else {
                return
            }

            for barcode in barcodes {
                guard let rawValue = barcode.rawValue else {
                    continue
                }
                let license = AAMVAParser(data: rawValue).parse()
                if license.isAcceptable {
                    self?.delegate?.didFindDriverLicense(license)
                    break
                }
            }
        }
    }
}
