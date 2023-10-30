//
//  ProductInfoVm.swift
//  EasyCart
//
//  Created by Hen Ty on 26/10/23.
//

import Foundation

class ProductInfoVm{
    var productInfoVm: [ProductInfoModel] = []
    
    func fetchProductInfo(){
        productInfoVm = [
            ProductInfoModel(productInfo: "Condition", productValue: "New"),
            ProductInfoModel(productInfo: "Brand", productValue: "Apple"),
            ProductInfoModel(productInfo: "Model", productValue: "iPhone 14 pro max"),
            ProductInfoModel(productInfo: "Color", productValue: "Black"),
            ProductInfoModel(productInfo: "Year", productValue: "2023"),
            ProductInfoModel(productInfo: "Size", productValue: "XL"),
            ProductInfoModel(productInfo: "Type", productValue: "-"),
            ProductInfoModel(productInfo: "Description", productValue: "The product is only for sale and available in Phnom Penh only.product is only for sale and available in Phnom Penh only")
        ]
    }
}
