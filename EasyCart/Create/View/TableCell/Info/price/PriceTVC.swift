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
    }
    func configurePrice(with data : CreateItemInfo){
        self.LbTitle.text = data.name
    }
    
}
