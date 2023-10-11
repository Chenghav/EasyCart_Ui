//
//  ButtonCVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/10/23.
//

import UIKit

class ButtonCVC: UICollectionViewCell{

    @IBOutlet weak var btnAddImage: UIButton!
    
    let imagePicker = UIImagePickerController()
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
        
        imagePicker.delegate = self
    }

    @IBAction func didTapPickerImage(_ sender: UIButton) {
//        let vc = UIImagePickerController()
//        vc.sourceType = .photoLibrary
//        vc.delegate = self
//        vc.allowsEditing = true
//        self.present(vc, animated: true)
    }
    
}
extension ButtonCVC : UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}
