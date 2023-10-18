//
//  ThirdCellsTableViewCell.swift
//  Easycart
//
//  Created by Ly Chenghav on 8/10/23.
//

import UIKit

class ThirdCellsTableViewCell: UITableViewCell {

    static let identifier = "ThirdCellsTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "ThirdCellsTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var imageView1 : UIImageView!
    @IBOutlet weak var Map        : UILabel!
    @IBOutlet weak var Linked     : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUps(with thirdCell : ThirdSection){
        imageView1.image = thirdCell.image
        Linked.text      = thirdCell.Linked
        Map.text         = thirdCell.Map
    }
}
