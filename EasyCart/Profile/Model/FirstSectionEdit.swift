//
//  FirstSectionEdit.swift
//  Easycart
//
//  Created by Ly Chenghav on 8/10/23.
//

import Foundation
import UIKit

struct FirstSection{
    let image : UIImage?
    let lab1 : String
    let lab2 : String
}

let firstSection : [FirstSection] = [
    FirstSection(image: nil, lab1: "Full name", lab2: "Ly Chenghav"),
    FirstSection(image: nil, lab1: "Email", lab2: "Chenghav@gmail.com"),
    FirstSection(image: nil, lab1: "Phone No.", lab2: "098-333-929"),
    FirstSection(image: UIImage(named: "Frame 427319775")!, lab1: "Password", lab2: "*********"),
    FirstSection(image: UIImage(named: "Frame 427319774")!, lab1: "Google Linked", lab2: "Connected"),
]
