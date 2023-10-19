//
//  SlideClickCVC.swift
//  EasyCart
//
//  Created by Hen Ty on 17/10/23.
//

import UIKit

class SlideClickCVC: UICollectionViewCell {

    @IBOutlet weak var imageview2: UIImageView!
    var slides: imagedata?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageview2.layer.borderWidth = 0.8
        
    }

    func setImage2(with img: imagedata) {
        imageview2.image = img.imageview
    }
}
