//
//  Section2.swift
//  Easycart
//
//  Created by Ly Chenghav on 7/10/23.
//

import Foundation
import UIKit

struct Section{
    let image : UIImage
    let lab1 : String
    let lab2 : String
    let lab3 : String
}

var Sections : [Section] = [
    Section(image: UIImage(named: "ico_box")! , lab1: "All item", lab2: "Selling,purchased", lab3: "590"),
    Section(image: UIImage(named: "ico_dollarOutline")!, lab1: "Selling", lab2: "Lsit of selling items", lab3: "0"),
    Section(image: UIImage(named: "ico_tagOutline")!, lab1: "Purchased", lab2: "List of purchased items", lab3: "0"),
    Section(image: UIImage(named: "ico_out")!, lab1: "Sold out", lab2: "Numbers purchased items", lab3: "1"),
    Section(image: UIImage(named: "ico_chart")!, lab1: "Sales report", lab2: " ", lab3: "0"),
]


