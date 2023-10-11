//
//  MoreDetailData.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/11/23.
//

import Foundation

class MoreDetailData{
    var title: String
    var subTitle: String
    var isOpen: Bool = true
    init(title: String, subTitle: String, isOpen: Bool) {
        self.title = title
        self.subTitle = subTitle
        self.isOpen = isOpen
    }
}
