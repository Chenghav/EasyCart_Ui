//
//  CutomCollectionViewCell.swift
//  Easycart
//
//  Created by Ly Chenghav on 6/10/23.
//

import UIKit

class CutomCollectionViewCell: UICollectionViewCell {

    // MARK:  - Outlets -
    @IBOutlet weak var imageCus : UIImageView!
    @IBOutlet weak var LabCus   : UILabel!
    @IBOutlet weak var LabPri   : UILabel!
    
    // MARK:  - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK:  - Functions -
    func config(with conllection: Collection) {
        imageCus.image = conllection.image
        LabCus.text    = conllection.product
        LabPri.text    = conllection.price
    }

}
