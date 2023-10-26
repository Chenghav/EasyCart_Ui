//
//  CategoryDetailsCollectionViewCell.swift
//  EasyCart
//
//  Created by KOSIGN Imac on 24/10/23.
//

import UIKit

class CategoryDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryDetailsRec: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryDesc: UILabel!
    @IBOutlet weak var categoryPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryDetailsRec.layer.cornerRadius = 10
        categoryDetailsRec.layer.cornerRadius = 10
        categoryDetailsRec.layer.borderWidth = 1
        categoryDetailsRec.layer.borderColor = #colorLiteral(red: 0.9000977278, green: 0.9119441509, blue: 1, alpha: 1)
    }
    
    
    func config(with categoryDetails: TopItemsModel){
        categoryImage.image = categoryDetails.topItemsImage
        categoryPrice.text = categoryDetails.price
        categoryDesc.text = categoryDetails.desc
    }
}
