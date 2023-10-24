//
//  MoreDetailTVC.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/11/23.
//

import UIKit

class MoreDetailTVC: UITableViewCell {

    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var expandbtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnExpandable(_ sender: UIButton) {
        
    }
    func configureExpandable(with data : ListItemExpandable ){
        self.headerTitle.text = data.name
    }
}
