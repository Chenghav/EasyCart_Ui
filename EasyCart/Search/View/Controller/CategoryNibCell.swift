//
//  CategoryNibCell.swift
//  Easycart
//
//  Created by KSG-USR on 5/10/23.
//

import UIKit

class CategoryNibCell: UICollectionViewCell {

    @IBOutlet weak var cateBtn: UIButton!
    @IBOutlet weak var categoryView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }
    func setUpdataCate(with data: CategoryModelData ){
        cateBtn.setTitle(data.category, for: .normal)
        cateBtn.setImage(data.image, for: .normal)
        
       
    }

}
