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
    
    @IBOutlet weak var btnAddImage: UIButton!
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var btnDiscard: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        var borderColorSelected:UIColor = UIColor.purple
        var borderWidth:CGFloat = 3
        var cornerRadius:CGFloat = 10
        let border = CAShapeLayer()
        border.lineWidth = borderWidth
        border.frame = btnAddImage.bounds
        border.lineDashPattern = [4, 4]
        //        border.strokeColor = UIColor.red.cgColor
        border.strokeColor = borderColorSelected.cgColor
        border.fillColor = nil
        border.path = UIBezierPath(roundedRect: btnAddImage.bounds, cornerRadius:cornerRadius).cgPath
        btnAddImage.layer.addSublayer(border)
        
        btnAddImage.layer.cornerRadius = cornerRadius
        btnAddImage.layer.masksToBounds = true
        
//        let yourColor = UIColor.red.cgColor
//        let yourBorder = CAShapeLayer()
//        yourBorder.strokeColor = yourColor
//        yourBorder.lineDashPattern = [4, 4]
//        yourBorder.frame = btnAddImage.bounds
//        yourBorder.fillColor = nil
//        yourBorder.path = UIBezierPath(rect: btnAddImage.bounds).cgPath
//        btnAddImage.layer.addSublayer(yourBorder)
        
        //        btnAddImage.layer.cornerRadius = 10
        uiImage.layer.cornerRadius = 10
        
    }
 
    @IBAction func uploadImageMore(_ sender: Any) {
        imagepicker()
        
    }
    @IBAction func Discards(_ sender: Any) {
//        let vc = DiscardItemTVC()
        deleteImage()
        print("hello")
//
//        CreateItemVC.openDemo(from: selt, in: nil)
    }
}

