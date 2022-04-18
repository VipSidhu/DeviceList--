//
//  SettingsViewController.swift
//  DeviceList
//
//  Created by vipan sidhu on 2022-04-17.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var sideMenuBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add menu buton on top
        navigationController?.navigationBar.tintColor = .white
        sideMenuBtn.addTarget(revealViewController(), action: #selector(revealViewController()?.revealSideMenu), for: .touchUpInside)
    }
}
