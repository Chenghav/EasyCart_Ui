//
//  AddItemsCollectionViewCell.swift
//  EasyCart
//
//  Created by Ly Chenghav on 20/10/23.
//

import UIKit

class AddItemsCollectionViewCell: UICollectionViewCell {

    static let identifier = "AddItemsCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "AddItemsCollectionViewCell", bundle: nil)
    }

    @IBOutlet weak var tagLab: UILabel!
    @IBOutlet weak var NameLab: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var checkBox: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tagLab.layer.cornerRadius = 8
        tagLab.clipsToBounds = true
        imageView1.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCheckBoxTap))
            checkBox.isUserInteractionEnabled = true
            checkBox.addGestureRecognizer(tapGesture)
    }
    @objc func handleCheckBoxTap() {
        if checkBox.image == UIImage(named: "Checkbox (1)") {
            checkBox.image = UIImage(named: "Checkbox (2)")
            checkBox.layer.borderWidth = 1.0
            checkBox.layer.borderColor = #colorLiteral(red: 0.6988375783, green: 0.6988375783, blue: 0.6988376975, alpha: 1)
            checkBox.layer.cornerRadius = 10
        } else {
            checkBox.image = UIImage(named: "Checkbox (1)")
            checkBox.layer.borderWidth = 0.0
            checkBox.layer.borderColor = UIColor.clear.cgColor
        }
    }

    func setUp(with add: Add) {
        imageView1.image = add.image
        NameLab.text = add.lab1
        tagLab.text = add.lab2
        
        if add.imageAssetName == "Checkbox (2)" {
            checkBox.image = UIImage(named: "Checkbox (2)")
            checkBox.layer.borderWidth = 1.0
            checkBox.layer.borderColor = #colorLiteral(red: 0.6988375783, green: 0.6988375783, blue: 0.6988376975, alpha: 1)
            checkBox.layer.cornerRadius = 10
        } else if add.imageAssetName == "Checkbox (1)" {
            checkBox.image = UIImage(named: "Checkbox (1)")
            checkBox.layer.borderWidth = 0.0
            checkBox.layer.borderColor = UIColor.clear.cgColor
        }
        LabelChange()
    }

    
    func LabelChange(){
        if tagLab.text == "Purchased" {
            tagLab.backgroundColor = #colorLiteral(red: 0.8683370352, green: 0.9637517333, blue: 0.7658879161, alpha: 1)
            tagLab.textColor = #colorLiteral(red: 0, green: 0.5138630271, blue: 0, alpha: 1)
        }else if tagLab.text == "Selling" {
            tagLab.backgroundColor = #colorLiteral(red: 0.9502804875, green: 0.9561652541, blue: 0.9991169572, alpha: 1)
            tagLab.textColor = #colorLiteral(red: 0.104422234, green: 0.04826869816, blue: 0.7695562243, alpha: 1)
        }else if tagLab.text == "Sold out" {
            tagLab.backgroundColor = #colorLiteral(red: 0.9663469195, green: 0.7632277608, blue: 0.7642469406, alpha: 1)
            tagLab.textColor = #colorLiteral(red: 0.5151617527, green: 0, blue: 0, alpha: 1)
        }
            
    }
}
