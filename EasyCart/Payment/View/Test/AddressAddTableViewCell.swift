//
//  AddressAddTableViewCell.swift
//  Payment
//
//  Created by Chheang Somalin on 13/10/23.
//

import UIKit
import Foundation
protocol AddressAddTableViewCellDelegate: AnyObject {
    func didTapButtonInCell(_ cell: AddressAddTableViewCell)
}

class AddressAddTableViewCell: UITableViewCell {
    var isSelectedCell: Bool = false
    @IBOutlet weak var iamgebtn: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var userlb: UILabel!
    @IBOutlet weak var addresslb: UILabel!
    @IBOutlet weak var buidlinglb: UILabel!
    weak var delegate: AddressAddTableViewCellDelegate?
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

       
      
    }
 
   
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.didTapButtonInCell(self)
//        navigationController?.pushViewController(NewAddressController, animated: true)
     }
  
    @IBAction func btnimageAct(_ sender: Any) {
        
        
    }
    
    func setup(with data: Address ){
        userlb.text = data.user
        addresslb.text = data.street
        buidlinglb.text = data.building
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

