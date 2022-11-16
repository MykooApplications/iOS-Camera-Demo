//
//  ViewController.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 8/26/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var pictureSegueButton: UIButton! // mainToPicture
    @IBOutlet weak var videoSegueButton: UIButton! // mainToVideo
    @IBOutlet weak var qrSequeButton: UIButton! // mainToQR
    
    let captureSession = AVCaptureSession()
    var previewLayer: CALayer!
    var captureDevice: AVCaptureDevice!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
    }
    

    func setUpUI() {
        pictureSegueButton.layer.cornerRadius = 5
        videoSegueButton.layer.cornerRadius = 5
        qrSequeButton.layer.cornerRadius = 5
        
        view.backgroundColor = UIColor.black
    }
    
 
    @IBAction func pictureButtonCLick(_ sender: Any) {
        performSegue(withIdentifier: "mainToPicture", sender: self)
    }
    
    @IBAction func videoButtonClick(_ sender: Any) {
        performSegue(withIdentifier: "mainToVideo", sender: self)
    }
    
    @IBAction func qrButtonClick(_ sender: Any) {
        performSegue(withIdentifier: "mainToQR", sender: self)
    }
    
}

