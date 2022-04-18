//
//  Toast.swift
//  DeviceList
//
//  Created by vipan sidhu on 2022-04-17.
//

import Foundation
import UIKit
extension UIViewController {

    func showToast(message : String, font: UIFont,Width : CGFloat,height : CGFloat) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - Width/2, y: self.view.frame.size.height/2 - height/2, width: Width, height: height))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
        toastLabel.numberOfLines = 0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
