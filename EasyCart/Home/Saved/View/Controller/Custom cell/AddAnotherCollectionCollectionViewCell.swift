//
//  AddAnotherCollectionCollectionViewCell.swift
//  EasyCart
//
//  Created by Ly Chenghav on 25/10/23.
//

import UIKit

class AddAnotherCollectionCollectionViewCell: UICollectionViewCell {

    static let identifier = "AddAnotherCollectionCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "AddAnotherCollectionCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var LabName: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setUp(with add : AddAnother){
        LabName.text     = add.lab1
        imageView1.image = add.image
    }
    
}
