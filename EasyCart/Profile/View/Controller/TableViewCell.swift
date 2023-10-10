//
//  TableViewCell.swift
//  Easycart
//
//  Created by Ly Chenghav on 7/10/23.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var LabTitle: UILabel!
    
    @IBOutlet weak var LabNum: UILabel!
    @IBOutlet weak var LabSub: UILabel!
    
    static let identifier = "TableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setUp(with cellCus: Section){
        imageView1.image = cellCus.image
        LabTitle.text = cellCus.lab1
        LabSub.text = cellCus.lab2
        LabNum.text = cellCus.lab3
    }
    
}
