//
//  ProductDataTableViewCell.swift
//  EasyCart
//
//  Created by Hen Ty on 26/10/23.
//

import UIKit

class ProductDataTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var data: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
