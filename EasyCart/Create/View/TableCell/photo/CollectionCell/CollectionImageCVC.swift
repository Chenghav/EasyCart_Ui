//
//  CollectionImageCVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/9/23.
//

import UIKit

typealias DeleteImage = ()-> Void
class CollectionImageCVC: UICollectionViewCell, PopUpDiscard{

    var imagepicker : Completion = {}
    var deleteImage: DeleteImage = {}
    var parentVC: UIViewController?
    
    @IBOutlet weak var btnAddImage: UIButton!
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var btnDiscard: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
//        var borderColorSelected:UIColor = UIColor.purple
//        var borderWidth:CGFloat = 3
//        var cornerRadius:CGFloat = 10
//        let border = CAShapeLayer()
//        border.lineWidth = borderWidth
//        border.frame = btnAddImage.bounds
//        border.lineDashPattern = [4, 4]
//        border.strokeColor = borderColorSelected.cgColor
//        border.fillColor = nil
//        border.path = UIBezierPath(roundedRect: btnAddImage.bounds, cornerRadius:cornerRadius).cgPath
//        btnAddImage.layer.addSublayer(border)
//
//        btnAddImage.layer.cornerRadius = cornerRadius
//        btnAddImage.layer.masksToBounds = true
//
        uiImage.layer.cornerRadius = 10
        
    }
 
    @IBAction func uploadImageMore(_ sender: Any) {
        imagepicker()
        
    }
    @IBAction func Discards(_ sender: Any) {
        deleteImage()
        print("hello")
    }
}

