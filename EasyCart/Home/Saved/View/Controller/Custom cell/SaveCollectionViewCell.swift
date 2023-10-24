//
//  SaveCollectionViewCell.swift
//  EasyCart
//
//  Created by Ly Chenghav on 24/10/23.
//

import UIKit

class SaveCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SaveCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "SaveCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var NameLab: UILabel!
    @IBOutlet weak var stack1: UIStackView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var stack2: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setUp(with saveData : Save){
        NameLab.text = saveData.Title
        image1.image = saveData.image1
        image2.image = saveData.image2
        image3.image = saveData.image3
        image4.image = saveData.image4
    }

}
