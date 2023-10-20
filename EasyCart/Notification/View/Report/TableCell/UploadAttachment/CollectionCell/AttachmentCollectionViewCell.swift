//
//  AttachmentCollectionViewCell.swift
//  EasyCart
//
//  Created by PVH_002 on 19/10/23.
//

import UIKit

class AttachmentCollectionViewCell: UICollectionViewCell {
    
    var imagepicker : Completion = {}
    @IBOutlet weak var btnAddImages: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

//        setupButtonAppearance()
        
    }
    @IBAction func btnAddImages(_ sender: Any) {
        imagepicker()
    }
    private func setupButtonAppearance() {
        btnAddImages.layer.cornerRadius = 10
        btnAddImages.layer.masksToBounds = true
        
        let borderLayer = CAShapeLayer()
        borderLayer.strokeColor = UIColor.black.cgColor
        borderLayer.lineDashPattern = [4, 4]
        borderLayer.fillColor = nil
        borderLayer.path = UIBezierPath(roundedRect: btnAddImages.bounds, cornerRadius: 10).cgPath
        borderLayer.frame = btnAddImages.bounds
        btnAddImages.layer.addSublayer(borderLayer)
    }
}
