//
//  UITableViewExtension.swift
//  DeviceList
//
//  Created by vipan sidhu on 2022-04-17.
//

import Foundation
import UIKit


//MARK: ----------------register cell in Tableview-------------
extension UITableView {
    
    func registeredXibCell(_ identifier: String) {
        self.register(UINib.init(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
extension UITableView {

    func setEmptyMessage(_ message: String, _ TextColor : UIColor, _ fontSize : CGFloat) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y:0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = TextColor
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}
