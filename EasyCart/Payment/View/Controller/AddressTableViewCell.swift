//
//  AddressTableViewCell.swift
//  Payment
//
//  Created by Chheang Somalin on 13/10/23.
//

import UIKit
protocol AddressTableViewCellDelegate: AnyObject {
    func didTapButton(_ cell: AddressTableViewCell)
}
class AddressTableViewCell: UITableViewCell {
    @IBOutlet weak var myview : UIView!
    @IBOutlet weak var viewAddress: UIView!
    weak var delegate: AddressTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myview.layer.cornerRadius = 10.0
               myview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
               myview.layer.masksToBounds = true
    }

    @IBAction func btnaddadderss(_ sender: Any) {
        delegate?.didTapButton(self)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
