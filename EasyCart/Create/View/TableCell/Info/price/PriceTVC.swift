//
//  PriceTVC.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/11/23.
//

import UIKit

class PriceTVC: UITableViewCell {
    @IBOutlet weak var LbTitle: UILabel!
    @IBOutlet weak var input: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        input.placeholder = "$0.00"
        input.keyboardType = .numberPad
        
        // Create a NumberFormatter object.
        let numberFormatter = NumberFormatter()
        
        // Set the number style of the NumberFormatter object.
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.numberStyle = .currency
    }
    func configurePrice(with data : CreateItemInfo){
        self.LbTitle.text = data.name
    }
    
}
