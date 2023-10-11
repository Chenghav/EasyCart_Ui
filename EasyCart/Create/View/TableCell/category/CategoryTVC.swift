//
//  CategoryTVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/9/23.
//

import UIKit

class CategoryTVC: UITableViewCell {

    @IBOutlet weak var uiIcon: UIImageView!
    @IBOutlet weak var lbTIitle: UILabel!
    @IBOutlet weak var lbDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with data : CategoryData ){
        self.uiIcon.image = data.image
        self.lbTIitle.text = data.title
        self.lbDesc.text = data.desc

    }

}
