//
//  SaveData.swift
//  EasyCart
//
//  Created by Ly Chenghav on 18/10/23.
//

import Foundation
import UIKit

struct Save{
    let Title : String
    let image : UIImage?
}


var Saves : [Save] = [
    Save(Title: "All posts", image: UIImage(named: "ico_addPrimary")),
    Save(Title: "Save item", image: UIImage(named: "apple_watch"))
]
