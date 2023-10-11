//
//  CategoryData.swift
//  Easycart
//
//  Created by Lamo Nin on 10/9/23.
//

import Foundation
import UIKit

class CategoryData{
    var image: UIImage
    var title: String
    var desc: String
    
    init(image: UIImage, title: String, desc: String) {
        self.image = image
        self.title = title
        self.desc = desc
    }
}
