//
//  ViewController.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 8/26/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pictureSegueButton: UIButton!
    @IBOutlet weak var videoSegueButton: UIButton!
    @IBOutlet weak var qrSequeButton: UIButton!
    
    // mainToPicture
    // mainToVideo
    // mainToQR
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pictureSegueButton.layer.cornerRadius = 5
        videoSegueButton.layer.cornerRadius = 5
        qrSequeButton.layer.cornerRadius = 5
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

