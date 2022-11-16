//
//  PictureViewController.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 8/26/22.
//

import UIKit
import AVFoundation


class PictureViewController: UIViewController {
    
    // Capture Session
    var session: AVCaptureSession?
    // Photo Output
    var output = AVCapturePhotoOutput()
    // Video Preview
    var previewLayer = AVCaptureVideoPreviewLayer()
    
    @IBOutlet weak var imageView: UIImageView!
    // Shutter Button
    @IBOutlet weak var captureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //setUpUI()
        view.backgroundColor = .black
        view.layer.addSublayer(previewLayer)
        checkCameraPermissions()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.bounds
    }
    
    func setUpUI() {
        captureButton.layer.cornerRadius = 50
        captureButton.layer.borderWidth = 10
        captureButton.layer.borderColor = UIColor.white.cgColor
        
        view.backgroundColor = .black
        view.layer.addSublayer(previewLayer)
    }
    
    private func checkCameraPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            // Request
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else {
                    return
                }
                DispatchQueue.main.async {
                    self?.setUpCamera()
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setUpCamera()
        @unknown default:
            break
        }
    }
    
    private func setUpCamera() {
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                
                session.startRunning()
                self.session = session
            }
            catch {
                print(error)
            }
        }
    }

 
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shutterButtonClick(_ sender: Any) {
        
        didTapTakePhoto()
        
    }
    
    private func didTapTakePhoto() {
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }
  

    
}

extension PictureViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?){
        guard let data = photo.fileDataRepresentation() else {
            return
        }
        let image = UIImage(data: data)
        session?.stopRunning()
        let imageView = UIImageView(image: image)
        imageView.frame = self.view.bounds
//        self.imageView?.image = image
        view.addSubview(imageView)
    }
}
