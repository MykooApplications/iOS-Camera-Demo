//
//  RequestDeviceAuthView.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 12/7/22.
//

import UIKit

protocol RequestDeviceAuthViewDelegate : AnyObject {
    func requestCameraAuthTapped()
    func requestMicrophoneAuthTapped()
    func requestPhotoLibraryAuthTapped()
}

class RequestDeviceAuthView: UIView {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var deviceTitleLabel: UILabel!
    @IBOutlet weak var authDescriptionLabel: UILabel!
    @IBOutlet weak var allowButton: UIButton!
    
    
    
    @IBAction func AllowButtonTapped(_ sender: UIButton) {
        
    }
}
