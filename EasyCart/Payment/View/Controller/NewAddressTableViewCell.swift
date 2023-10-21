//
//  NewAddressTableViewCell.swift
//  Payment
//
//  Created by Chheang Somalin on 14/10/23.
//

import UIKit

class NewAddressTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
