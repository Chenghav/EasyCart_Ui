//
//  BankSetupTableViewCell.swift
//  Easycart
//
//  Created by Ly Chenghav on 9/10/23.
//

import UIKit

class BankSetupTableViewCell: UITableViewCell {

    @IBOutlet weak var TextField1: UITextField!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var TitleLab: UILabel!
    static let identifier = "BankSetupTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "BankSetupTableViewCell", bundle: nil)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUp(with bank: BankSection){
        TitleLab.text = bank.Title
        Button1.setImage(bank.image, for: .normal)
    }
    
}
