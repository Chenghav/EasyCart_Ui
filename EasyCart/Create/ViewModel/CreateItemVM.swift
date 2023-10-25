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
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .Titles)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .Price)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .Discounts)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .MoreDetails)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .CategoryMoreDetail)))
        itemCell.append(CreatemModel<Any>(value: CreateItemInfo(name: "Category", description: "", rowType: .CategoryMoreDetail)))
        
    }
}
