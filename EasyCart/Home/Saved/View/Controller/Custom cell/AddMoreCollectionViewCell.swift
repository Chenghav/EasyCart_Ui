//
//  AddMoreCollectionViewCell.swift
//  EasyCart
//
//  Created by Ly Chenghav on 18/10/23.
//

import UIKit
import FittedSheets

class AddMoreCollectionViewCell: UICollectionViewCell, PopUp1 {

    static let identifier = "AddMoreCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "AddMoreCollectionViewCell", bundle: nil)
    }
    
    // MARK:  - Outlets -
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var NameLab: UILabel!
    @IBOutlet weak var moreImage: UIImageView!
    @IBOutlet weak var tagLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tagLab.layer.cornerRadius   = 8
        tagLab.clipsToBounds        = true
    }

    func setUp(with post: More){
        imageView1.image = post.image
        moreImage.image  = post.moreDot
        NameLab.text     = post.lab1
        tagLab.text      = post.lab2
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
    
    @IBAction func moreButton(_ sender: Any) {
        if let parentViewController = self.parentViewController {
            AddMoreCollectionViewCell.Pop(from: parentViewController, in: nil)
           }
    }
    
}
extension UIResponder {
    var parentViewController: UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.parentViewController
        } else {
            return nil
        }
    }
}
