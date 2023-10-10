//
//  SecondSectionTableViewCell.swift
//  Easycart
//
//  Created by Ly Chenghav on 8/10/23.
//

import UIKit

class SecondSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var AddressDetail: UILabel!
    
    static let identifier = "SecondSectionTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "SecondSectionTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(with secondCell : SecondSection){
        Address.text = secondCell.Address
        AddressDetail.text = secondCell.AddressDetail
    }
    
}
