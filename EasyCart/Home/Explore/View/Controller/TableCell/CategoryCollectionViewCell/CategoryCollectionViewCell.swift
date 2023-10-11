//
//  CategoryCollectionViewCell.swift
//  Easycart
//
//  Created by PVH_002 on 8/10/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(with categories: CategoryModel){
        categoryImage.image = categories.categoryImage
        categoryName.text = categories.categoryName
    }

}
