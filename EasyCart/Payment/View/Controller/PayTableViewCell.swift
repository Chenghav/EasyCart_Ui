//
//  PayTableViewCell.swift
//  Easycart
//
//  Created by KSG-USR on 10/10/23.
//

import UIKit

class PayTableViewCell: UITableViewCell {
    
    var openReceipt: (() -> Void)?
    @IBOutlet weak var qrkhview: UIView!

    @IBOutlet weak var cashview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        qrkhview.layer.cornerRadius = 10
        cashview.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCashViewTap))
             cashview.addGestureRecognizer(tapGesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @objc func handleCashViewTap() {
      
           cashview.layer.borderWidth = 2.0
        cashview.layer.borderColor = #colorLiteral(red: 0.5210024118, green: 0.2106079459, blue: 0.9001228213, alpha: 1)

        
        
    }
    @IBAction func openReceipt(_ sender: Any) {
        openReceipt?()
    }
    
    
    
}
