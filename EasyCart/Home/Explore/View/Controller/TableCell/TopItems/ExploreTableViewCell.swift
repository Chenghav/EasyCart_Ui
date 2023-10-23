//
//  ExploreTableViewCell.swift
//  Easycart
//
//  Created by PVH_002 on 6/10/23.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var exploreRec: UIView!
    @IBOutlet weak var exploreImgCard: UIImageView!
    @IBOutlet weak var explorePrice: UILabel!
    @IBOutlet weak var exploreDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        exploreRec.layer.cornerRadius = 10
        exploreRec.layer.borderWidth = 1
        exploreRec.layer.borderColor = #colorLiteral(red: 0.9000977278, green: 0.9119441509, blue: 1, alpha: 1)
        exploreImgCard.layer.cornerRadius = 10
        exploreImgCard.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func config(with topItems: TopItemsModel){
        exploreImgCard.image = topItems.topItemsImage
        explorePrice.text = topItems.price
        exploreDesc.text = topItems.desc
    }
    
}
