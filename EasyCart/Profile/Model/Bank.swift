//
//  Bank.swift
//  Easycart
//
//  Created by Ly Chenghav on 9/10/23.
//
import UIKit
import Foundation

struct BankSection{
    let Title : String
    let image : UIImage?
}


var bankSection : [BankSection] = [
  BankSection(Title: "Select Bank", image: UIImage(named: "ico_chevup")),
  BankSection(Title: "Account No.", image: UIImage(named: "Frame 427319215")),
  BankSection(Title: "Account Name", image: nil),
  BankSection(Title: "Currency", image: nil),
]
