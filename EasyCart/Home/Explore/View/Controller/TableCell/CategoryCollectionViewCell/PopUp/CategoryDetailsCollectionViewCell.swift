//
//  CategoryDetailsCollectionViewCell.swift
//  EasyCart
//
//  Created by KOSIGN Imac on 24/10/23.
//

import UIKit

class CategoryDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryDetailsRec: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryDetailsRec.layer.cornerRadius = 10
    }
}
