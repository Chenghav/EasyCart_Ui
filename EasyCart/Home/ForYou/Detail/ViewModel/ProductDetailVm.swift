//
//  ProductDetailVm.swift
//  EasyCart
//
//  Created by Hen Ty on 23/10/23.
//

import Foundation

class ProductDetailVm{
    var productDetail: [ProductViewDataModel] = []
    
    func fetchProduct(){
        productDetail = [
    
            ProductViewDataModel(productId: "ID #123400" ,productName:"iPhone 14 Pro Max 1TB (LL)" ,productPrice: "$1,750.00" ,productDiscount: "$1,850.00" ,productPercentage: "(10% off)" ,productSubImage: [ #imageLiteral(resourceName: "iPhone") , #imageLiteral(resourceName: "apple_watch") , #imageLiteral(resourceName: "iPhone"), #imageLiteral(resourceName: "done")])
        ]
    }
}
