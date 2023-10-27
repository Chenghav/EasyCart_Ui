//
//  RecentCollectionNibCell.swift
//  Easycart
//
//  Created by KSG-USR on 5/10/23.
//

import UIKit

class RecentCollectionNibCell: UICollectionViewCell {

    @IBOutlet weak var recentBtn: UIButton!
    @IBOutlet weak var recentLb: UILabel!
    weak var delegate: RecentCollectionNibCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
//        addBottomBorder()
    }
    
    @IBAction func actiondel(_ sender: Any) {
        delegate?.deleteRecentSearch(recentLb.text ?? "")
    }
//    private func addBottomBorder() {
//          let borderLayer = CALayer()
//          borderLayer.backgroundColor = UIColor.lightGray.cgColor
//          borderLayer.frame = CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 1)
//          layer.addSublayer(borderLayer)
//      }
}
