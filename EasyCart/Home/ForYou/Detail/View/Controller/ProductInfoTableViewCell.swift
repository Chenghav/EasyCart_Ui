//
//  ProductInfoTableViewCell.swift
//  EasyCart
//
//  Created by Hen Ty on 26/10/23.
//

import UIKit

class ProductInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var statusButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setExpanded()
        setCollapsed()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  

    func setExpanded() {
        statusButton.setImage(UIImage(named: "chevright"), for: .normal)
    }

    func setCollapsed() {
        statusButton.setImage(UIImage(named: "chevbuttom") , for: .normal)
    }
    
    
}

