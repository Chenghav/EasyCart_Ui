//
//  ReduisExtension.swift
//  EasyCart
//
//  Created by Hen Ty on 17/10/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}
