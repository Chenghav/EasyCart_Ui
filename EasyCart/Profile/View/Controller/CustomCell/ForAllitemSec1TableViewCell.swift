//
//  ForAllitemSec1TableViewCell.swift
//  EasyCart
//
//  Created by Ly Chenghav on 13/10/23.
//

import UIKit

class ForAllitemSec1TableViewCell: UITableViewCell {

    
    static let identifier = "ForAllitemSec1TableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "ForAllitemSec1TableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var View1        : UIView!
    @IBOutlet weak var NameLab      : UILabel!
    @IBOutlet weak var imageView1   : UIImageView!
    @IBOutlet weak var PurchasedLab : UILabel!
    @IBOutlet weak var PriceLab     : UILabel!
    
    
    // MARK:  - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()

        imageView1.layer.cornerRadius     = 12
        View1.layer.cornerRadius          = 12
        PurchasedLab.layer.cornerRadius   = 8
        PurchasedLab.clipsToBounds        = true
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUp(with items : Allitem){
        imageView1.image  = items.image
        NameLab.text      = items.lab1
        PriceLab.text     = items.lab2
        PurchasedLab.text = items.lab3
        LabelChange()
    }
    
    func LabelChange(){
        if PurchasedLab.text == "Purchased" {
            PurchasedLab.backgroundColor = #colorLiteral(red: 0.8683370352, green: 0.9637517333, blue: 0.7658879161, alpha: 1)
            PurchasedLab.textColor = #colorLiteral(red: 0, green: 0.5138630271, blue: 0, alpha: 1)
        }else if PurchasedLab.text == "Selling" {
            PurchasedLab.backgroundColor = #colorLiteral(red: 0.9410327077, green: 0.8965150714, blue: 0.9873706698, alpha: 1)
            PurchasedLab.textColor = #colorLiteral(red: 0.327924192, green: 0.001723796595, blue: 0.8208648562, alpha: 1)
        }
    }
}
