//
//  Expandable.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/18/23.
//

import Foundation
import UIKit


class ListItemExpandable {
    var name: String
    var item: [String]
    var isExpand: Bool
    init(name: String, item: [String], isExpand: Bool) {
        self.name = name
        self.item = item
        self.isExpand = isExpand
    }
}
