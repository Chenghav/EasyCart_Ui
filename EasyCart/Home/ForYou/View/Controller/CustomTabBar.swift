//
//  CustomTabBar.swift
//  Easycart
//
//  Created by Ly Chenghav on 4/10/23.
//

import UIKit


class CustomTabBar: UITabBar {

    // MARK:  - Outlets -
    private var borderView: UIView!
    
    // MARK:  - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        borderView                 = UIView()
        borderView.backgroundColor = #colorLiteral(red: 0.437166661, green: 0.06278865784, blue: 0.8730230927, alpha: 1)
        addSubview(borderView)
       }
    
    // MARK:  - Functions -
    func addTopBorderIfNeeded() {
           if let firstTab = items?.first, let index = items?.firstIndex(of: firstTab) {
               let itemWidth    = frame.width / CGFloat(items?.count ?? 1)
               let borderFrame  = CGRect(x: CGFloat(index) * itemWidth, y: 0, width: itemWidth, height: 2)
               borderView.frame = borderFrame
           }
       }
    func updateBorderViewFrame(index: Int, totalItems: Int) {
        let itemWidth = frame.width / CGFloat(totalItems)
               let borderFrame  = CGRect(x: CGFloat(index) * itemWidth, y: 0, width: itemWidth, height: 2)
               borderView.frame = borderFrame
        }
}
