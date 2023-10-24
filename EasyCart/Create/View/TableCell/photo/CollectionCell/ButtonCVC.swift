//
//  ButtonCVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/10/23.
//

import UIKit

typealias Completion = ()-> Void
class ButtonCVC: UICollectionViewCell{
    
    var imagePicker : Completion = {}

    @IBOutlet weak var btnAddImage: UIButton!
    
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
        border.strokeColor = UIColor.red.cgColor
        border.strokeColor = borderColorSelected.cgColor
        border.fillColor = nil
        border.path = UIBezierPath(roundedRect: btnAddImage.bounds, cornerRadius:cornerRadius).cgPath
        btnAddImage.layer.addSublayer(border)

        btnAddImage.layer.cornerRadius = cornerRadius
        btnAddImage.layer.masksToBounds = true
        
    }

    @IBAction func didTapPickerImage(_ sender: UIButton) {
        imagePicker()
    }
}
