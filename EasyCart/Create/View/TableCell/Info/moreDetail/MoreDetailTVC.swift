//
//  MoreDetailTVC.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/11/23.
//

import UIKit
protocol MoreDetailTVCDelegate: AnyObject {
    func didToggleExpansionState()
}
class MoreDetailTVC: UITableViewCell {
    
    var delegate: MoreDetailTVCDelegate?
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var expandbtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func btnExpandable(_ sender: UIButton) {
        delegate?.didToggleExpansionState()
    }
    func configureMoreDetail(with data : CreateItemInfo){
        self.headerTitle.text = data.name
    }
    func configureContent(isExpand: Bool) {
        
        if isExpand {
            expandbtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        } else {
            expandbtn.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        }
    }
}
