//
//  ViewModel.swift
//  DeviceList
//
//  Created by vipan sidhu on 2022-04-17.
//

import Foundation
import UIKit

//Struct of device type
 struct DeviceObj {
     var Id = Int(),
         type = String(),
         Price = Int(),
         Currency = String(),
         isFavorite = Bool(),
         imageUrl = String(),
         Title = String(),
         Description = String(),
         review = Double(),
         size = String(),
         OS = String()
         
 }

//Declare array
class ViewModel {
var DeviceArr = [DeviceObj](),
    filter = [DeviceObj](),
    mainArr = [DeviceObj]()
    
}

//MARK: --TABLEVIEW DATASOURCE AND DELEGATES--

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if objViewModel.mainArr.count == 0{
            tbDevive.setEmptyMessage("No Search Found", UIColor.black, 18)
            return 0
        }
        else{
            tbDevive.restore()
            return objViewModel.mainArr.count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbDevive.dequeueReusableCell(withIdentifier: "ViewControllerCell", for: indexPath) as! ViewControllerCell
        cell.lblModelName.text = objViewModel.mainArr[indexPath.row].type
        cell.lblStatus.text = objViewModel.mainArr[indexPath.row].Description
        let imgStr: String = objViewModel.mainArr[indexPath.row].imageUrl
        cell.imgModel.image = UIImage(named: imgStr)
        cell.btnModelInfo.tag = indexPath.row
        cell.btnModelInfo.addTarget(self, action: #selector(infoMess), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC")as!DetailVC
        let array = objViewModel.mainArr[indexPath.row]
        print(array)
        detailVC.members.append(array)
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
    @objc func infoMess(_ sender : UIButton){
        let index = sender.tag
        self.showToast(message: objViewModel.mainArr[index].Title, font: .systemFont(ofSize: 15.0), Width: 150, height: 80)
        
    }

}


