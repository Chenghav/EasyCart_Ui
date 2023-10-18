//
//  AddressAddTableViewCell.swift
//  Payment
//
//  Created by Chheang Somalin on 13/10/23.
//

import UIKit
import Foundation


class AddressAddTableViewCell: UITableViewCell  {
   
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var userlb: UILabel!
    @IBOutlet weak var addresslb: UILabel!
    @IBOutlet weak var buidlinglb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        self.window?.rootViewController?.performSegue(withIdentifier: "Add", sender: nil)
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
