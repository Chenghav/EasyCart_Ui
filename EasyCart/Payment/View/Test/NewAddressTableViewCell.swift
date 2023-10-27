//
//  NewAddressTableViewCell.swift
//  Payment
//
//  Created by Chheang Somalin on 14/10/23.
//

import UIKit

protocol DataPassingDelegate: AnyObject {
    func passData(_ data: String)
}
class NewAddressTableViewCell: UITableViewCell{
    weak var delegate: DataPassingDelegate?
    @IBOutlet weak var detailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lbTextField: UITextField!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 10
      
       
    }
  

   
    @IBAction func handleLb(_ sender: UITextField) {
     
       
            
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
