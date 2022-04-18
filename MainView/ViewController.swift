//
//  ViewController.swift
//  DeviceList
//
//  Created by vipan sidhu on 2022-04-17.
//

import UIKit

class ViewController: UIViewController {

    //MARK: ----------------OUTLET-------------
    @IBOutlet weak var tfSearch : UITextField!
    @IBOutlet weak var tbDevive : UITableView!
    @IBOutlet weak var stackTopHeader : UIStackView!
    @IBOutlet weak var lblHeaderName : UILabel!
    @IBOutlet var sideMenuBtn: UIButton!
  
    //MARK: -----------CONSTANT VARIABLES------------
    var objViewModel = ViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add menu buton on top
        navigationController?.navigationBar.tintColor = .white
        sideMenuBtn.addTarget(revealViewController(), action: #selector(revealViewController()?.revealSideMenu), for: .touchUpInside)
        
        
        //add placeholder color of textfield
        tfSearch.attributedPlaceholder = NSAttributedString(
            string: "Search Bar.....",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        
        
        //add deveice data in array
           devicesArrayData()

        //Table view delegate and source
        self.tbDevive.registeredXibCell("ViewControllerCell")
        objViewModel.mainArr = objViewModel.DeviceArr
        tbDevive.delegate = self
        tbDevive.dataSource = self
        tbDevive.separatorStyle = .none
        
       
     
    }
    override func viewWillAppear(_ animated: Bool) {
        tbDevive.reloadData()
    }
    //MARK:-******************Append detail of devices************************
    func devicesArrayData() {
        
        objViewModel.DeviceArr.append(DeviceObj(Id: 0, type: "Nokia 3.1", Price: 10, Currency: "USD", isFavorite: true, imageUrl: "nokiaImage" , Title: "Test Thermostat", Description: "Status  -  Available", review: 1.0, size: "160 * 160", OS: "Microsoft Window"))
        objViewModel.DeviceArr.append(DeviceObj(Id: 1, type: "Apple", Price: 10, Currency: "USD", isFavorite: false, imageUrl: "IphoneImage", Title: "Test Sensor", Description: "Status  -  Not Available", review: 4.0, size: "160 * 160", OS: "MACOS"))
        objViewModel.DeviceArr.append(DeviceObj(Id: 2, type: "Samsung galaxy S22 ultra", Price: 1500, Currency: "USD", isFavorite: true, imageUrl: "samsung", Title: "Sensor", Description: "Status  -  Available", review: 5.0, size: "6.8 inches", OS: "Android"))
        objViewModel.DeviceArr.append(DeviceObj(Id: 3, type: "Huawei P50 Pro", Price: 1000, Currency: "USD", isFavorite: false, imageUrl: "huawei", Title: "Test Sensor", Description: "Status  -  Available", review: 3.0, size: "6.6 inches", OS: "Android"))
        objViewModel.DeviceArr.append(DeviceObj(Id: 4, type: "Mi 11 ultra", Price: 700, Currency: "USD", isFavorite: true, imageUrl: "m1Image", Title: "Test Thermostat", Description: "Status  -  Available", review: 4.0, size: "6.8", OS: "Android (Linux)"))
        
        
        
    }
    
    
    
    
    //Mark Search Bar text field Action-----
    
    @IBAction func searchAct(_ sender: UITextField) {
        debugPrint(sender.text ?? "")
        let searchkey  = sender.text ?? ""
        objViewModel.filter = objViewModel.DeviceArr.filter({
            $0.type.uppercased().contains(searchkey.uppercased())  || $0.OS.uppercased().contains(searchkey.uppercased())
        })
        debugPrint(objViewModel.filter.count)
        if objViewModel.filter.count > 0{
            objViewModel.mainArr = objViewModel.filter
            tbDevive.reloadData()
        }
        else{
            objViewModel.mainArr.removeAll()
           // objViewModel.mainArr = objViewModel.DeviceArr
            tbDevive.reloadData()
        }
        let txt = sender.text!
        if txt.isEmpty{
            objViewModel.mainArr = objViewModel.DeviceArr
             tbDevive.reloadData()
        }
    }
    
    
}







