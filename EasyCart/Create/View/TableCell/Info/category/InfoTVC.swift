//
//  InfoTVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/6/23.
//

import UIKit

class InfoTVC: UITableViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var btnSelect: UIButton!
    
    
    static let identifier = "InfoTVC"
        static func nib() -> UINib{
            return UINib(nibName: "InfoTVC", bundle: nil)
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
