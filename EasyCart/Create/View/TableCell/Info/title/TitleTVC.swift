//
//  TitleTVC.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/11/23.
//

import UIKit

class TitleTVC: UITableViewCell {
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbInput: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureTitle(with data : Title ){
        self.lbTitle.text = data.name
        self.lbInput.text = data.input
    }
    
}
