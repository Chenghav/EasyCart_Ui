//
//  CreateItemModel.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/25/23.
//

import Foundation


enum Rowtype : Int , CaseIterable {
    case Categories
    case Titles
    case Price
    case Discounts
    case MoreDetails
    case CategoryMoreDetail
}

struct CreatemModel <T> {
    var value : T 
}

struct CreateItemInfo{
    var name : String
    var description: String
    var rowType: Rowtype
}
