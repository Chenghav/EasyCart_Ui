//
//  AddItems.swift
//  EasyCart
//
//  Created by Ly Chenghav on 20/10/23.
//


import Foundation
import UIKit

struct Add{
    let image    : UIImage
    let lab1     : String
    let lab2     : String
    let checkBox  : UIImage
    let imageAssetName: String
}

let Adds: [Add] = [
    Add(image: UIImage(named: "iPhone")!, lab1: "iPhone", lab2: "Purchased", checkBox: UIImage(named: "Checkbox (2)")!, imageAssetName: "Checkbox (2)"),
    Add(image: UIImage(named: "iPhone")!, lab1: "iPhone", lab2: "Selling", checkBox: UIImage(named: "Checkbox (2)")!, imageAssetName: "Checkbox (2)"),
    Add(image: UIImage(named: "iPhone")!, lab1: "iPhone", lab2: "Sold out", checkBox: UIImage(named: "Checkbox (2)")!, imageAssetName: "Checkbox (2)"),
]



