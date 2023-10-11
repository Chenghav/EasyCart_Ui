//
//  topItemsModel.swift
//  Easycart
//
//  Created by PVH_002 on 8/10/23.
//

import Foundation
import UIKit

struct TopItemsModel{
    let topItemsImage : UIImage
    let price : String
    let desc : String
}

let topItemsModel : [TopItemsModel] = [
    TopItemsModel(topItemsImage: UIImage(named: "watch")!, price: "$800.00", desc: "Apple Watch Ultra 2nd Generation (44mm)"),
    TopItemsModel(topItemsImage: UIImage(named: "iPhone")!, price: "$1,400.00", desc: "Apple iPhone 15 Pro Max (Natural Titanium)"),
    TopItemsModel(topItemsImage: UIImage(named: "apple_watch")!, price: "$1,400.00", desc: "Apple Watch Ultra Generation")
]
