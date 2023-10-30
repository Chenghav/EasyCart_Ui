//
//  RegisterModel.swift
//  EasyCart
//
//  Created by SalinChhun on 29/10/23.
//

import Foundation

struct RegisterModel: Codable {
    let userName, email, password, phoneNumber: String
    let address, photoProfile, role, googleLink: String
    let maplink: String
}
