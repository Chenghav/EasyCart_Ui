//
//  SaveCollectionViewCell.swift
//  EasyCart
//
//  Created by Ly Chenghav on 18/10/23.
//

import UIKit

class SaveCollectionViewCell: UICollectionViewCell {

    static let identifier = "SaveCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "SaveCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var NameLab: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setUp(with dataSave : Save){
        NameLab.text = dataSave.Title
        imageView1.image = dataSave.image
    }

}
