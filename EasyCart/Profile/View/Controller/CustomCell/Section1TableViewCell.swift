//
//  Section1TableViewCell.swift
//  Easycart
//
//  Created by Ly Chenghav on 7/10/23.
//

import UIKit

class Section1TableViewCell: UITableViewCell {

    
    static let identifier = "Section1TableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "Section1TableViewCell", bundle: nil)
    }
    
    // MARK:  - Outlets -
    @IBOutlet weak var LabTitle   : UILabel!
    @IBOutlet weak var LabDetail  : UILabel!
    @IBOutlet weak var imageView1 : UIImageView!
    
    // MARK:  - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK:  - Functions -
    func config(with section1: Section1){
        LabTitle.text    = section1.lab1
        LabDetail.text   = section1.lab2
        imageView1.image = section1.image
    }
}
