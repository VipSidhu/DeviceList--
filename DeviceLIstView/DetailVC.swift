//
//  DetailVC.swift
//  DeviceList
//
//  Created by vipan sidhu on 2022-04-17.
//

import UIKit

import Cosmos
class DetailVC: UIViewController {
    
    //MARK: ----------------OUTLET-------------
    @IBOutlet var lblDataRecords: [UILabel]!
    @IBOutlet weak var btnIsFav: UIButton!
    @IBOutlet weak var vwRating : CosmosView!
    @IBOutlet weak var imgMobile : UIImageView!
    
    //MARK: -----------CONSTANT VARIABLES------------

    var objViewModel = ViewModel()
    var members = [DeviceObj]()
    
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        debugPrint(members)
        if members.isEmpty { // If Arr is not empty
         return
        }
        
        //add each device detail in label
        lblDataRecords[0].text = "Name   -   \(members.first?.type ?? "")" // Samsung
        lblDataRecords[1].text = "OS     -    \(members.first?.OS ?? "")" // Android
        lblDataRecords[2].text = "\(members.first?.Description ?? "")" // Available
        lblDataRecords[3].text = "Size  -   \(members.first?.size ?? "")" // 150*150
        lblDataRecords[4].text = "Details :    \(members.first?.type ?? "")"// Header
        vwRating.rating = members.first?.review ?? 0.0
        
        // add fav buton rating
        let fav = members.first!.isFavorite
        fav == true ? btnIsFav.setImage(#imageLiteral(resourceName: "ratingImage"), for: .normal) : btnIsFav.setImage(#imageLiteral(resourceName: "starSelectedImage"), for: .normal)
        imgMobile.image = UIImage(named: members.first?.imageUrl ?? "")
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: --Back view action--

    @IBAction func backView(_ sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
