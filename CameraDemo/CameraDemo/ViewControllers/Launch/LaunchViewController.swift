//
//  LaunchViewController.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 12/1/22.
//

import UIKit

class LaunchViewController: UIViewController {
    
    
    private var requestCameraAuthView: RequestCameraAuthView?
    private var requestMicrophoneAuthView: RequestMicrophoneAuthView?
    private var requestPhotoLibraryAuthView: RequestPhotoLibraryAuthView?
    
    private var cameraAuthStatus = RequestDeviceAuthController.getCameraAuthorizationStatus() {
        didSet {
            setupViewForNextAuthorizationRequest()
        }
    }
    
    private var microphoneAuthStatus = RequestDeviceAuthController.getMicrophoneAuthStatus() {
        didSet {
            setupViewForNextAuthorizationRequest()
        }
    }
    
    private var photoLibraryAuthStatus = RequestDeviceAuthController.getPhotoLibraryAuthStatus() {
        didSet {
            setupViewForNextAuthorizationRequest()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //   setupViews()
    }

}

private extension LaunchViewController {
    func setupViewForNextAuthorizationRequest() {
        guard cameraAuthStatus == .granted else {
            // setupRequestCameraAuthView()
            return
        }
        
        if let _ = requestCameraAuthView {
            //removeRequestCameraAuthView()
        }
        
        guard microphoneAuthStatus == .granted else {
            // setupRequestMicrophoneAuthView()
            return
        }
        
        if let _ = requestCameraAuthView {
            //removeRequestMicrophoneAuthView()
        }
        
        guard photoLibraryAuthStatus == .granted else {
            // setupRequestPhotoLibraryAuthView()
            return
        }
        
        if let _ = requestCameraAuthView {
            //removeRequestPhotoLibraryAuthView()
        }
    }
    
    
    func setupRequestCameraAuthView() {
        guard requestCameraAuthView == nil else {
            if
        }
    }
    
    func removeRequestCameraAuthView() {
        
    }
    
    func setupRequestMicrophoneAuthView() {
        
    }
    
    func removeRequestMicrophoneAuthView() {
        
    }
    
    func setupRequestPhotoLibraryAuthView() {
        
    }
    
    func removeRequestPhotoLibraryAuthView() {
        
    }
    
    func openSettings() {
        let settingsURLString = UIApplication.openSettingsURLString
        if let settingURL = URL(string: settingsURLString) {
            UIApplication.shared.open(settingURL, options: [:], completionHandler: nil)
        }
    }
}

extension LaunchViewController: RequestDeviceAuthViewDelegate {
    
    func requestCameraAuthTapped() {
        if cameraAuthStatus == .notRequested {
            RequestDeviceAuthController.requestCameraAuth { [weak self] status in
                guard let self = self else { return }
                self.cameraAuthStatus = status
            }
            return
        }
        
        if microphoneAuthStatus == .unauthorized {
            openSettings()
            return
        }
    }
    
    func requestMicrophoneAuthTapped() {
        if microphoneAuthStatus == .notRequested {
            RequestDeviceAuthController.requestMicrophoneAuth { [weak self] status in
                guard let self = self else { return }
                self.microphoneAuthStatus = status
            }
            return
        }
        
        if microphoneAuthStatus == .unauthorized {
            openSettings()
            return
        }
    }
    
    
    func requestPhotoLibraryAuthTapped() {
        if photoLibraryAuthStatus == .notRequested {
            RequestDeviceAuthController.requestPhotoLibraryAuth { [weak self] status in
                guard let self = self else { return }
                self.photoLibraryAuthStatus = status
            }
            return
        }
        
        if photoLibraryAuthStatus == .unauthorized {
            openSettings()
            return
        }
    }}
