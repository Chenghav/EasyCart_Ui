//
//  ImageSlideCVC.swift
//  EasyCart
//
//  Created by Hen Ty on 19/10/23.
//

import UIKit

class ImageSlideCVC: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    var slides: imagedata?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.borderWidth = 0.2
        
    }

    func setUpImage(with imageSlide: imagedata) {
        imageView.image = imageSlide.imageview
    }

}
