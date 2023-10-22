//
//  ReceiptTableViewCell.swift
//  EasyCart
//
//  Created by ksga on 18/10/23.
//

import UIKit

class ReceiptTableViewCell: UITableViewCell {

    @IBOutlet weak var itemview: UIImageView!
    @IBOutlet weak var receiptSign: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemview.layer.cornerRadius = itemview.frame.size.width / 2
                itemview.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    



}
