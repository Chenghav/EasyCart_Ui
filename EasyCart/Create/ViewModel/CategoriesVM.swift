//
//  CategoriesVM.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/30/23.
//

import Foundation
import UIKit

class CategoriesVM {
    
    var categoryCell: [CategoriesModel<Any>] = []
    
    func initData(){
        
        categoryCell = []

        categoryCell.append(CategoriesModel<Any>(value: CategoryData(image: UIImage(named: "ico_drinks")!, title: "Vehicle", desc: "Motor, car, truck, etc.", rowType: .CategotySelec)))
        categoryCell.append(CategoriesModel<Any>(value: CategoryData(image: UIImage(named: "icon_1")!, title: "Vehicle", desc: "Motor, car, truck, etc.", rowType: .CategotySelec)))
        categoryCell.append(CategoriesModel<Any>(value: CategoryData(image: UIImage(named: "ico_devices_1")!, title: "Vehicle", desc: "Motor, car, truck, etc.", rowType: .CategotySelec)))
        categoryCell.append(CategoriesModel<Any>(value: CategoryData(image: UIImage(named: "ico_house_1")!, title: "Vehicle", desc: "Motor, car, truck, etc.", rowType: .CategotySelec)))
        categoryCell.append(CategoriesModel<Any>(value: CategoryData(image: UIImage(named: "ico_fan")!, title: "Vehicle", desc: "Motor, car, truck, etc.", rowType: .CategotySelec)))
        categoryCell.append(CategoriesModel<Any>(value: CategoryData(image: UIImage(named: "ico_paw")!, title: "Vehicle", desc: "Motor, car, truck, etc.", rowType: .CategotySelec)))
        categoryCell.append(CategoriesModel<Any>(value: CategoryData(image: UIImage(named: "ico_guitar")!, title: "Vehicle", desc: "Motor, car, truck, etc.", rowType: .CategotySelec)))
    }
}
