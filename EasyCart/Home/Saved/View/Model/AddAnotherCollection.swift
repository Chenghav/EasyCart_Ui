//
//  AddAnotherCollection.swift
//  EasyCart
//
//  Created by Ly Chenghav on 25/10/23.
//

import Foundation
import UIKit

struct AddAnother {
    let image: UIImage
    let lab1: String
}

class YourClass {
    var AddAnothers: [AddAnother] = []

    init() {
        AddAnothers = [
            AddAnother(image: UIImage(named: "iPhone")!, lab1: "iPhone 15Promax"),
            AddAnother(image: UIImage(named: "iPhone")!, lab1: "iPhone 15Promax"),
            AddAnother(image: UIImage(named: "iPhone")!, lab1: "iPhone 15Promax"),
            AddAnother(image: UIImage(named: "iPhone")!, lab1: "iPhone 15Promax"),
            AddAnother(image: UIImage(named: "iPhone")!, lab1: "iPhone 15Promax"),
            AddAnother(image: UIImage(named: "iPhone")!, lab1: "iPhone 15Promax"),
            AddAnother(image: UIImage(named: "iPhone")!, lab1: "iPhone 15Promax"),
            AddAnother(image: UIImage(named: "iPhone")!, lab1: "iPhone 15Promax"),
            AddAnother(image: UIImage(named: "iPhone")!, lab1: "iPhone 15Promax"),
            AddAnother(image: UIImage(named: "iPhone")!, lab1: "iPhone 15Promax"),
        ]
            AddAnothers.append(AddAnother(image: UIImage(named: "Button (1)")!, lab1: "Create"))
        }
    }

