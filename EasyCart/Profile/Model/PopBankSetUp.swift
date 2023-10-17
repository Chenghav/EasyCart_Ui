//
//  PopBankSetUp.swift
//  EasyCart
//
//  Created by Ly Chenghav on 17/10/23.
//

import Foundation
import UIKit

struct Bank{
    let imageCheck : UIImage?
    let imageBank : UIImage?
    let lab1  : String
}

let Banks : [Bank] = [
    Bank(imageCheck: UIImage(named: "Checkbox (3)"), imageBank: UIImage(named: "Aba"), lab1: "ABA"),
    Bank(imageCheck: UIImage(named: "Checkbox (3)"), imageBank: UIImage(named: "Vector"), lab1: "ACELDA"),
    Bank(imageCheck: UIImage(named: "Checkbox (3)"), imageBank: UIImage(named: "PPCB"), lab1: "PPCB")
]
