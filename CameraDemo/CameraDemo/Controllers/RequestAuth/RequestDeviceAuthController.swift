//
//  RequestDeviceAuthController.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 12/7/22.
//
//
/* This Class combines all Authorization request for hardware access and photo library access
 */

import Foundation
import AVFoundation
import Photos

enum DeviceAuthStatus {
    case granted, notRequested, unauthorized
}

typealias RequestDeviceAuthCompletionHandler = (DeviceAuthStatus) -> Void

class RequestDeviceAuthController {
    
    //Handles Camera Authorization
    static func requestCameraAuth(completionHandler: @escaping RequestDeviceAuthCompletionHandler) {
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
    
    static func getCameraAuthStatus() -> DeviceAuthStatus {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
            case .authorized: return .granted
            case .notDetermined: return .notRequested
            default: return .unauthorized
        }
    }
    
    //Handles Microphone Authorization
    static func requestMicrophoneAuth(completionHandler: @escaping RequestDeviceAuthCompletionHandler) {
        AVCaptureDevice.requestAccess(for: .audio) { granted in
            DispatchQueue.main.async {
                guard granted else {
                    completionHandler(.unauthorized)
                    return
                }
                completionHandler(.granted)
            }
        }
    }
    
    static func getMicrophoneAuthStatus() -> DeviceAuthStatus {
        let status = AVCaptureDevice.authorizationStatus(for: .audio)
        switch status {
            case .authorized: return .granted
            case .notDetermined: return .notRequested
            default: return .unauthorized
        }
    }
    
    //Handles Photo Library Authorization
    static func requestPhotoLibraryAuth(completionHandler: @escaping RequestDeviceAuthCompletionHandler) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                guard status == .authorized else {
                    completionHandler(.unauthorized)
                    return
                }
                completionHandler(.granted)
            }
        }
    }
    
    static func getPhotoLibraryAuthStatus() -> DeviceAuthStatus {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
            case .authorized: return .granted
            case .notDetermined: return .notRequested
            default: return .unauthorized
        }
    }
    
}
