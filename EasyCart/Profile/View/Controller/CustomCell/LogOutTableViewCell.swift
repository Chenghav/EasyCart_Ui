//
//  LogOutTableViewCell.swift
//  Easycart
//
//  Created by Ly Chenghav on 7/10/23.
//

import UIKit

class LogOutTableViewCell: UITableViewCell {

    static let identifier = "LogOutTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "LogOutTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var LogOut: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
  
    func setUp(with sec: Section3){
        LogOut.text = sec.logOut
    }
}
