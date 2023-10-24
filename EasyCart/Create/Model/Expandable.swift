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
    var item: [Item]
    var isExpand: Bool
    init(name: String, item: [Item], isExpand: Bool) {
        self.name = name
        self.item = item
        self.isExpand = isExpand
    }
    
}

public struct Item {
    var name: String
    var detail: String
    
    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}
