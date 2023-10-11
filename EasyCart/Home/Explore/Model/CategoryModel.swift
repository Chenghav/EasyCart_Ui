//
//  CategoryModel.swift
//  Easycart
//
//  Created by PVH_002 on 8/10/23.
//

import Foundation
import UIKit

struct CategoryModel{
    let categoryImage : UIImage
    let categoryName : String
}

let categoryModel : [CategoryModel] = [
    CategoryModel(categoryImage: UIImage(named: "ico_car")!, categoryName: "Automobile"),
    CategoryModel(categoryImage: UIImage(named: "ico_devices")!, categoryName: "Electronics"),
    CategoryModel(categoryImage: UIImage(named: "ico_sport")!, categoryName: "Sports"),
    CategoryModel(categoryImage: UIImage(named: "ico_clothe")!, categoryName: "Clothing"),
    CategoryModel(categoryImage: UIImage(named: "ico_house")!, categoryName: "Real Estates"),
    CategoryModel(categoryImage: UIImage(named: "ico_game")!, categoryName: "Games"),
]
