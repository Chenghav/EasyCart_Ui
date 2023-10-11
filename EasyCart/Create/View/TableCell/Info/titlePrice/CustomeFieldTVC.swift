//
//  CustomeFieldTVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/9/23.
//

import UIKit

class CustomeFieldTVC: UITableViewCell {
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbMiddle: UILabel!
    @IBOutlet weak var lbLast: UILabel!
    
    static let identifier = "CustomeFieldTVC"
        static func nib() -> UINib{
            return UINib(nibName: "CustomeFieldTVC", bundle: nil)
        }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with data : Data ){
        self.lbTitle.text = data.title
        self.lbMiddle.text = data.middleText
        self.lbLast.text = data.lastText

    }
    
}
