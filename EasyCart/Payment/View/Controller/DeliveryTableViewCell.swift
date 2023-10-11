//
//  DeliveryTableViewCell.swift
//  Easycart
//
//  Created by KSG-USR on 9/10/23.
//

import UIKit

class DeliveryTableViewCell: UITableViewCell {

    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var deliveryView: UIView!
    @IBOutlet weak var ok: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        deliveryView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
