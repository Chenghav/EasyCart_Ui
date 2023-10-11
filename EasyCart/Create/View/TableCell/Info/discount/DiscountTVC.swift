//
//  DiscountTVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/10/23.
//

import UIKit

class DiscountTVC: UITableViewCell {
    static let identifier = "DiscountTVC"
        static func nib() -> UINib{
            return UINib(nibName: "DiscountTVC", bundle: nil)
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
