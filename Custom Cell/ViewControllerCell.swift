//
//  ViewControllerCell.swift
//  DeviceList
//
//  Created by vipan sidhu on 2022-04-17.
//

import UIKit

class ViewControllerCell: UITableViewCell {
    
    //MARK: ----------------OUTLET-------------
    @IBOutlet weak var lblModelName : UILabel!
    @IBOutlet weak var lblStatus : UILabel!
    @IBOutlet weak var imgModel : UIImageView!
    @IBOutlet weak var btnModelInfo : UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
