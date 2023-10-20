//
//  AttachmentButton.swift
//  EasyCart
//
//  Created by PVH_002 on 19/10/23.
//

import Foundation
//
//  ButtonCVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/10/23.
//

import UIKit

typealias Completion = ()-> Void
class AttachmentButton: UICollectionViewCell{
    
    var imagePicker : Completion = {}
    
    @IBOutlet weak var btnAddImages: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        var borderColorSelected:UIColor = UIColor.purple
        var borderWidth:CGFloat = 3
        var cornerRadius:CGFloat = 10
        let border = CAShapeLayer()
        border.lineWidth = borderWidth
        border.frame = btnAddImages.bounds
        border.lineDashPattern = [4, 4]
        border.strokeColor = borderColorSelected.cgColor
        border.fillColor = nil
        border.path = UIBezierPath(roundedRect: btnAddImages.bounds, cornerRadius:cornerRadius).cgPath
        btnAddImages.layer.addSublayer(border)
        
        btnAddImages.layer.cornerRadius = cornerRadius
        btnAddImages.layer.masksToBounds = true
    }

    @IBAction func imagePicker(_ sender: UIButton) {
        imagePicker()
    }
    
}
