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
    @IBOutlet weak var bookMark: UIImageView!
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCheckBoxTap))
        bookMark.isUserInteractionEnabled = true
        bookMark.addGestureRecognizer(tapGesture)
        // Configure the view for the selected state
    }
    @objc func handleCheckBoxTap() {
        if bookMark.image == UIImage(named: "icon") {
            bookMark.image = UIImage(named: "ico_bookmark")
        } else {
            bookMark.image = UIImage(named: "icon")

        }
    }
    func config(with topItems: TopItemsModel){
        exploreImgCard.image = topItems.topItemsImage
        explorePrice.text = topItems.price
        exploreDesc.text = topItems.desc
        if topItems.imageAssetName == "ico_bookmark" {
            bookMark.image = UIImage(named: "ico_bookmark")
        } else if topItems.imageAssetName == "icon" {
            bookMark.image = UIImage(named: "icon")

        }
    }
    
}
