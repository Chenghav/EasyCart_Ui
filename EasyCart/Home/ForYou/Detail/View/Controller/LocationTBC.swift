//
//  LocationTBC.swift
//  EasyCart
//
//  Created by Hen Ty on 22/10/23.
//

import UIKit

class LocationTBC: UITableViewCell {

    @IBOutlet weak var googlelink: UILabel!
    @IBOutlet weak var maplink: UIImageView!
    var location: LocationModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(with locate: LocationModel){
        googlelink.text = locate.googleLink
        maplink.image = locate.mapLink
    }
    
}
