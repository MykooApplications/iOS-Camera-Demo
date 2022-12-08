//
//  RequestCameraAuthView.swift
//  CameraDemo
//
//  Created by Roshan Mykoo on 12/1/22.
//

import UIKit

protocol RequestCameraAuthViewDelegate: AnyObject {
    func requestCameraAuthTapped()
}

class RequestCameraAuthView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cameraLogoImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: RequestCameraAuthViewDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func customInit() {
        let bundle = Bundle.main
        let nibName = String(describing: Self.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func allowButtonClick(_ sender: Any) {
        delegate?.requestCameraAuthTapped()
    }
    
}
