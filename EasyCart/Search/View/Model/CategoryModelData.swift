//
//  CategoryModelData.swift
//  EasyCart
//
//  Created by ToTo  on 27/10/23.
//

import Foundation
import UIKit
struct CateModel{
    var popular : String?
}
struct CategoryModelData{
    var category : String?
    var image : UIImage?
}
var CateModelData: [CateModel] = [
    CateModel(popular: "Sports"),
    CateModel(popular: "Motors"),
    CateModel(popular: "Electronics"),
    CateModel(popular: "Shoes"),
    CateModel(popular: "Real Estate")
]
var CateData: [CategoryModelData] = [
    CategoryModelData(category: "Automobile", image: UIImage(named: "ico_car")),
    CategoryModelData(category: "Electronics", image: UIImage(named: "ico_devices") ),
    CategoryModelData(category: "Sports", image: UIImage(named: "ico_sport") ),
    CategoryModelData(category: "Clothing", image: UIImage(named: "ico_clothe")),
    CategoryModelData(category: "Real Estates", image: UIImage(named: "ico_house") ),
    CategoryModelData(category: "Game", image: UIImage(named: "ico_game") )
    
]

