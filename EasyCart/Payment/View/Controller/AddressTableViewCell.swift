//
//  AddressTableViewCell.swift
//  Payment
//
//  Created by Chheang Somalin on 13/10/23.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    @IBOutlet weak var myview : UIView!
    @IBOutlet weak var viewAddress: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myview.layer.cornerRadius = 10.0
               myview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
               myview.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
