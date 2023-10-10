//
//  FirstEditSectionTableViewCell.swift
//  Easycart
//
//  Created by Ly Chenghav on 8/10/23.
//

import UIKit

class FirstEditSectionTableViewCell: UITableViewCell {
    
    static let identifier = "FirstEditSectionTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "FirstEditSectionTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var FirstLab: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var SecondLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUp(with firstStart: FirstSection){
        FirstLab.text = firstStart.lab1
        SecondLab.text = firstStart.lab2
        imageView1.image = firstStart.image
    }
    
    
}
