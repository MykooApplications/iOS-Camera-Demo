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

enum DeviceType {
    case camera, microphone, library
}

class RequestDeviceAuthView: UIView {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var deviceTitleLabel: UILabel!
    @IBOutlet weak var authDescriptionLabel: UILabel!
    @IBOutlet weak var allowButton: UIButton!
    
    weak var delegate: RequestDeviceAuthViewDelegate?
    
    var deviceType: DeviceType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let bundle = Bundle.main
        let nibName = String(describing: Self.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    @IBAction func AllowButtonTapped(_ sender: UIButton) {
        
    }
    
    func animateInViews() {
        
    }
    
    func animateOutViews() {
        
    }
    
    func configureForErrorState(_ deviceType: DeviceType) {
    switch deviceType {
    case .camera:
        deviceTitleLabel.text = "Camera Authorization Denied"
        allowButton.setTitle("Open Settings", for: .normal)
    case .library:
        deviceTitleLabel.text = "Photo Library Authorization Denied"
        allowButton.setTitle("Open Settings", for: .normal)
    case .microphone:
        deviceTitleLabel.text = "Microphone Authorization Denied"
        allowButton.setTitle("Open Settings", for: .normal)
    default:
        return
    }
        
    }
}
