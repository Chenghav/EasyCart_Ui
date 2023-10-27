//
//  EmptyCollectionViewCell.swift
//  EasyCart
//
//  Created by Ly Chenghav on 25/10/23.
//

import UIKit

class EmptyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backHomeBtn: UIButton!
    
    func setButtonTitle(title: String, image: UIImage?) {
        backHomeBtn.setTitle(title, for: .normal)
        backHomeBtn.setImage(image, for: .normal)
    }
}
