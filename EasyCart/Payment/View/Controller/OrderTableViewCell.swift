//
//  OrderTableViewCell.swift
//  Easycart
//
//  Created by KSG-USR on 9/10/23.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageVIew.layer.cornerRadius = 10
        myView.layer.cornerRadius = 10
    }


    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var imageVIew: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
