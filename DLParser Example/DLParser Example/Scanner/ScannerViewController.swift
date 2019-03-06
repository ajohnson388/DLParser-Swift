//
//  ScannerViewController.swift
//  DLParser Example
//
//  Created by Andrew Johnson on 4/28/18.
//  Copyright © 2018 Andrew Johnson. All rights reserved.
//

import UIKit
import AVFoundation
import DLParser

/// A view controller responsible for presenting a video camera and converting detected driver
/// license bar codes into a parsed license object.
final class ScannerViewController: UIViewController {
    
    // MARK: - Properties
    
    private let presenter: ScannerPresenter
    private let videoSession = AVCaptureSession()
    

    // MARK: - Lifecycle
    
    init(presenter: ScannerPresenter = ScannerPresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutPreviewLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.startVideo(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.startVideo(false)
    }
    
    
    // MARK: - Helper Functions
    
    private func layoutPreviewLayer() {
        let previewLayer = AVCaptureVideoPreviewLayer(session: presenter.videoSession)
        previewLayer.backgroundColor = UIColor.black.cgColor
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        view.layer.masksToBounds = true
        previewLayer.frame = view.bounds
        previewLayer.position = CGPoint(x: previewLayer.frame.midX,
                                        y: previewLayer.frame.midY)
        view.layer.addSublayer(previewLayer)
    }
    
    private func playFeedback() {
        DispatchQueue.main.async {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
    }
}


// MARK: - Sample Buffer Delegate

extension ScannerViewController: ScannerPresenterDelegate {
    
    func didFindDriverLicense(_ license: DriverLicense) {
        let output = String(describing: license).replacingOccurrences(of: ", ", with: "\n")
        playFeedback()
        print(output)
    }
}
