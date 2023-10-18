//
//  ExploreTableViewCell.swift
//  Easycart
//
//  Created by PVH_002 on 6/10/23.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableCell: UIView!
    @IBOutlet weak var exploreImgCard: UIImageView!
    @IBOutlet weak var explorePrice: UILabel!
    @IBOutlet weak var exploreDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        tableCell.layer.cornerRadius = 10
        
//        contentView.backgroundColor = UIColor.clear
//        backgroundColor = UIColor.clear
        separatorInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16) // Set the desired spacing for the cells
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
