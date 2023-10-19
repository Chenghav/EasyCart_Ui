//
//  DateOfitemCollCell.swift
//  EasyCart
//
//  Created by Hen Ty on 11/10/23.
//

import UIKit

class DateOfitemCollCell: UICollectionViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    var item: itemData?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setItem (with2 item_pro : itemData ){
        idLabel.text = item_pro.id
        priceLabel.text = String(item_pro.price)
        discriptionLabel.text = item_pro.discription
        valueLabel.text = item_pro.value
        percentLabel.text = item_pro.percent
    }
}
