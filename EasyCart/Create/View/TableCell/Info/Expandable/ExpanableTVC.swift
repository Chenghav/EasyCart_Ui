//
//  ExpanableTVC.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/19/23.
//

import UIKit

class ExpanableTVC: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubTitle: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureExpandable(with data: CreateItemInfo){
        self.lbTitle.text = data.name
        self.lbSubTitle.text = data.description
    }
}
