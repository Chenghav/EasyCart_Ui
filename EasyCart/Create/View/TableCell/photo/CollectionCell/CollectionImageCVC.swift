//
//  CollectionImageCVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/9/23.
//

import UIKit

class CollectionImageCVC: UICollectionViewCell {

    var imagepicker : Completion = {}
    
    @IBOutlet weak var btnAddImage: UIButton!
    @IBOutlet weak var uiImage: UIImageView!
    
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
        
//        imagePicker.delegate = self
    }
 
    @IBAction func uploadImageMore(_ sender: Any) {
        imagepicker()
    }
}

