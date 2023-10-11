//
//  SectionCellNib.swift
//  Easycart
//
//  Created by KSG-USR on 5/10/23.
//

import UIKit

class SectionCellNib: UICollectionViewCell {
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var btnSeeAll : UIButton!    
    func configCell(_ value : String) {
        titleLb.text = value
        
    }
}
