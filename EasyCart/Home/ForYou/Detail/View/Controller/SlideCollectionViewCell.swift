//
//  SlideCollectionViewCell.swift
//  EasyCart
//
//  Created by Hen Ty on 11/10/23.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageview: UIImageView!
    var slides: imagedata?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageview.layer.borderWidth = 0.2
        
    }

    func setImage(with img2: imagedata) {
        imageview.image = img2.imageview
    }
 
}
