//
//  ExpanableTVC.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/19/23.
//

import UIKit

//protocol CustomTableViewCellDelegate {
//    func reloadRow(header: ExpanableTVC, section: Int)
//}
class ExpanableTVC: UITableViewCell {
//    var delegate: CustomTableViewCellDelegate?
//    var section: Int!
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubTitle: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))

        // Configure the view for the selected state
    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
//    }
//    @objc func selectHeaderView(gesture: UITapGestureRecognizer){
//        let cell = gesture.view as! ExpanableTVC
//        delegate?.reloadRow(header: self, section: cell.section)
//    }
    
    func configureExpandable(with data : ListItemExpandable ){
        self.lbTitle.text = data.name
    }
}
