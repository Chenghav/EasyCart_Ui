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
    @IBOutlet weak var bookMark: UIImageView!
    // MARK:  - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCheckBoxTap))
        bookMark.isUserInteractionEnabled = true
        bookMark.addGestureRecognizer(tapGesture)
    }
    @objc func handleCheckBoxTap() {
        if bookMark.image == UIImage(named: "icon") {
            bookMark.image = UIImage(named: "ico_bookmark")
        } else {
            bookMark.image = UIImage(named: "icon")

        }
    }
    // MARK:  - Functions -
    func config(with conllection: Collection) {
        imageCus.image = conllection.image
        LabCus.text    = conllection.product
        LabPri.text    = conllection.price
        if conllection.imageAssetName == "ico_bookmark" {
            bookMark.image = UIImage(named: "ico_bookmark")
        } else if conllection.imageAssetName == "icon" {
            bookMark.image = UIImage(named: "icon")

        }
    }
}
