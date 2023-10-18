//
//  PopBankTableViewCell.swift
//  EasyCart
//
//  Created by Ly Chenghav on 17/10/23.
//

import UIKit

class PopBankTableViewCell: UITableViewCell {

    static let identifier = "PopBankTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "PopBankTableViewCell", bundle: nil)
    }
    
    

    @IBOutlet weak var checkBoxImg: UIImageView!
    @IBOutlet weak var bankImg: UIImageView!
    @IBOutlet weak var bankName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUp(with bank : Bank){
        checkBoxImg.image = bank.imageCheck
        bankImg.image     = bank.imageBank
        bankName.text     = bank.lab1
    }
}
