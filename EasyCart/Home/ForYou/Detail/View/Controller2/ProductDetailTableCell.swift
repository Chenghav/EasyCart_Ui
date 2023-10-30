//
//  ImageSlideTBC.swift
//  EasyCart
//
//  Created by Hen Ty on 19/10/23.
//

import UIKit

class ImageSlideTBC: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var modelProductLabel: UILabel!
    @IBOutlet weak var fullPriceLabel: UILabel!
    @IBOutlet weak var disCountLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setItem (with2 item_pro : itemData ){
        idLabel.text = item_pro.id
        priceLabel.text = String(item_pro.price)
        discriptionLabel.text = item_pro.discription
        valueLabel.text = item_pro.value
        percentLabel.text = item_pro.percent
    }
    
}
