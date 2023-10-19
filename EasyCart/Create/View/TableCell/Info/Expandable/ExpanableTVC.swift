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

        // Configure the view for the selected state
    }
    
    func configureExpandable(with data : ListItemExpandable ){
        self.lbTitle.text = data.title
        self.lbSubTitle.text = data.subTitle
    }
    
}
