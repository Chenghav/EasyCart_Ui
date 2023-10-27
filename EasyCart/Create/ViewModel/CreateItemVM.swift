//
//  CreateItemVM.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/25/23.
//

import Foundation

class CreateItemVM {
    
    var itemCell : [CreatemModel<Any>] = []
    
    func initData(){
        
        itemCell = []
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .Categories)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Title", description: "", rowType: .Titles)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Price", description: "", rowType: .Price)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Discount", description: "", rowType: .Discounts)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "More Detail", description: "", rowType: .MoreDetails)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Condition", description: "Used, New", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Brand", description: "Input", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Model", description: "Input", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Color", description: "Black, White...", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Year", description: "Input", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Size", description: "Input", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Type", description: "Input", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Type", description: "Input", rowType: .CategoryMoreDetail)))
        
    }
}
