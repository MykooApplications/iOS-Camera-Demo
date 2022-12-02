//
//  RequestCameraAuthController.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 12/1/22.
//

import Foundation
import AVFoundation

typealias RequestCameraAuthorizationCompletionHandler = (CameraAuthStatus) -> Void

class RequestCameraAuthController {
    
    static func requestCameraAuthorization(completionHandler: @escaping RequestCameraAuthorizationCompletionHandler) {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                guard granted else {
                    completionHandler(.unauthorized)
                    return
                }
                completionHandler(.granted)
            }
            
        }
    }
    
    static func getCameraAuthorizationStatus() -> CameraAuthStatus {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            return .granted
        case .notDetermined:
            return .notRequested
        default :
            return.unauthorized
        }
    }
}

enum CameraAuthStatus {
    case granted, notRequested, unauthorized
}
