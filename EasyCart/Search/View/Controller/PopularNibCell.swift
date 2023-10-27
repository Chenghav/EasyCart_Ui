//
//  PopularNibCell.swift
//  Easycart
//
//  Created by KSG-USR on 5/10/23.
//

import UIKit

class PopularNibCell: UICollectionViewCell {

    @IBOutlet weak var btnPopular: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupwithdata(with data: CateModel ){
        btnPopular.setTitle(data.popular, for: .normal)
       
    }

}
