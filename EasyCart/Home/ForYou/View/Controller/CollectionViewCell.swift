//
//  CollectionViewCell.swift
//  Easycart
//
//  Created by Ly Chenghav on 6/10/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var labelView1: UILabel!
    @IBOutlet weak var labelView : UILabel!
    @IBOutlet weak var bookMark: UIImageView!
   
    func setUp(with collect: Collection){
        imageView.image = collect.image
        labelView.text  = collect.product
        labelView1.text = collect.price
        bookMark.image  = collect.book
    }
    
    
}
