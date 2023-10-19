//
//  Expandable.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/18/23.
//

import Foundation
import UIKit


class ListItemExpandable {
    let title: String
    let subTitle: String
    let isExpand: Bool
    init(title: String, subTitle: String, isExpand: Bool) {
        self.title = title
        self.subTitle = subTitle
        self.isExpand = isExpand
    }
}

