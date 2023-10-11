//
//  ExploreTableViewCell.swift
//  Easycart
//
//  Created by PVH_002 on 6/10/23.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var exploreCardRec: UIView!
    @IBOutlet weak var exploreImgCard: UIImageView!
    @IBOutlet weak var explorePrice: UILabel!
    @IBOutlet weak var exploreDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        exploreCardRec.layer.cornerRadius = 10
        exploreImgCard.layer.cornerRadius = 10
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
