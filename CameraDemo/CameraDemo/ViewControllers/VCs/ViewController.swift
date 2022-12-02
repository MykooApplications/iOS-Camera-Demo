//
//  ViewController.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 8/26/22.
//

//<a target="_blank" href="https://icons8.com/icon/110730/flash-on">Flash On</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>

//<a target="_blank" href="https://icons8.com/icon/110822/flash-off">Flash Off</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var cameraSwitch: UISwitch!
    @IBOutlet weak var flashButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var captureButton: UIButton! // mainToPicture
    @IBOutlet weak var photoVideoLabel: UILabel!
    
    let captureSession = AVCaptureSession()
    var previewLayer: CALayer!
    var captureDevice: AVCaptureDevice!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    
    func setUpUI() {
        
        view.backgroundColor = UIColor.black
        
        cameraSwitch.isOn = false
        photoVideoLabel.text = "Photo"
        captureButton.layer.cornerRadius = 0.5 * captureButton.bounds.size.width
        captureButton.clipsToBounds = true
        captureButton.setImage(UIImage(named:"thumbsUp.png"), for: .normal)
       // pictureSegueButton.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        
    }
    
    
    @IBAction func captureButtonTap(_ sender: UIButton) {
        
    }
    
    
    @IBAction func galleryButtonClick(_ sender: UIButton) {
        
    }
    
    @IBAction func cameraSwitchToggle(_ sender: UISwitch) {
        if sender.isOn {
            print("[ViewController] video on")
            photoVideoLabel.text = "Video"
        } else {
            print("[ViewController] camera on")
            photoVideoLabel.text = "Photo"

        }
        
    }
    
    @IBAction func flashButtonTap(_ sender: UIButton) {
        
    }
}

