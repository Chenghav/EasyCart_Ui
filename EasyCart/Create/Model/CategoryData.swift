//
//  CategoryData.swift
//  Easycart
//
//  Created by Lamo Nin on 10/9/23.
//

import Foundation
import UIKit

enum Rowtypes : Int , CaseIterable {
    case CategotySelec
}

struct CategoryData{
    var image: UIImage
    var title: String
    var desc: String
    var rowType: Rowtypes
}
struct CategoriesModel <T> {
    var value : T
}
