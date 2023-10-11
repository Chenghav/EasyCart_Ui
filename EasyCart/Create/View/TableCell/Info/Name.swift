//
//  Name.swift
//  Easycart
//
//  Created by Lamo Nin on 10/6/23.
//

import Foundation
import UIKit

struct myName{
    var category: String
    var title: String
    var price: String
    var discount: String
    var check = false
    init(category: String, title: String, price: String, discount: String, check: Bool = false) {
        self.category = category
        self.title = title
        self.price = price
        self.discount = discount
        self.check = check
    }
}
