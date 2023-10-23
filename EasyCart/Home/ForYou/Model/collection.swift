//
//  collection.swift
//  Easycart
//
//  Created by Ly Chenghav on 6/10/23.
//

import Foundation
import UIKit

struct Collection {
    let image: UIImage
    let product: String
    let price: String
    let book: UIImage
    var isBookmarked: Bool
}

let Collections: [Collection] = [
    Collection(image: #imageLiteral(resourceName: "94730753d727dcf2e5a5509f0630a81e"), product: "Iphone 15 ProMax", price: "1800.50", book: UIImage(named: "icon")!, isBookmarked: false),
    Collection(image: #imageLiteral(resourceName: "newTry"), product: "Iphone 14 ProMax", price: "1800.50", book: UIImage(named: "ico_bookmark")!, isBookmarked: false),
    Collection(image: #imageLiteral(resourceName: "A9ICZf"), product: "Iphone 13 ProMax", price: "1800.50", book: UIImage(named: "ico_bookmark")!, isBookmarked: false),
    Collection(image: #imageLiteral(resourceName: "iconMini"), product: "Iphone 12 ProMax", price: "1800.50", book: UIImage(named: "icon")!, isBookmarked: false),

]
