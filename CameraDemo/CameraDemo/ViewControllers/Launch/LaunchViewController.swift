//
//  LaunchViewController.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 12/1/22.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }

}

private extension LaunchViewController {
    func setupViewForNextAuthorizationRequest() {
        
    }
    
    func setupViews() {
        let requestCameraAuthView = RequestCameraAuthView()
        requestCameraAuthView.translatesAutoresizingMaskIntoConstraints = false
        requestCameraAuthView.delegate = self
        view.addSubview(requestCameraAuthView)
        NSLayoutConstraint.activate([
            requestCameraAuthView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            requestCameraAuthView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            requestCameraAuthView.topAnchor.constraint(equalTo: view.topAnchor),
            requestCameraAuthView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
extension LaunchViewController: RequestCameraAuthViewDelegate {
    func requestCameraAuthTapped() {
        RequestCameraAuthController.requestCameraAuthorization { stats in
            switch stats {
            case .granted:
                print("[LaunchViewController] granted")
            case .notRequested:
                print("[LaunchViewController] not requested")
            case .unauthorized:
                print("[LaunchViewController] unauthorized")
            }
        }
    }
}
