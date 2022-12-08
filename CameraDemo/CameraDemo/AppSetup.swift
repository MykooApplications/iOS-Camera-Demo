//
//  AppSetup.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 12/7/22.
//

import Foundation
import UIKit

class AppSetup {
    
    static func loadCaptureViewController() {
        let nibName = String(describing: CaptureViewController.self)
        let bundle = Bundle.main
        let captureViewController = CaptureViewController(nibName: nibName, bundle: bundle)
        let window = Self.keyWindow
        window?.rootViewController = captureViewController
        window?.makeKeyAndVisible()
    }
    
    static var keyWindow: UIWindow? {
        let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return firstScene?.windows.first(where: { $0.isKeyWindow })
    }
    
    static var interfaceOrientation: UIInterfaceOrientation? {
        let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return firstScene?.interfaceOrientation
    }
    
}
