//
//  ImageSlideTBC.swift
//  EasyCart
//
//  Created by Hen Ty on 19/10/23.
//

import UIKit

class ProductDetailTableCell: UITableViewCell {
    
    var delegate  : ProcessDelegate?
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var modelProductLabel: UILabel!
    @IBOutlet weak var fullPriceLabel: UILabel!
    @IBOutlet weak var disCountLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    
    var countminiImage : Int = 0
    var productDetailVm = ProductDetailVm()
    override func awakeFromNib() {
        super.awakeFromNib()
        productDetailVm.fetchProduct()
        bottomCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //    func setUpProduct(with product: ProductViewDataModel){
    //        idLabel.text = product.productId
    //        modelProductLabel.text = product.productName
    //        disCountLabel.text = product.productDiscount
    //        fullPriceLabel.text = product.productPrice
    //        percentageLabel.text = product.productPercentage
    //
    //    }
}

extension ProductDetailTableCell : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return  productDetailVm.productDetail[0].productSubImage?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = bottomCollectionView.dequeueReusableCell(withReuseIdentifier: "SubProductImageCollectionCell", for: indexPath)
        as! SubProductImageCollectionCell
        
        cell.subimageView.layer.cornerRadius = 10
        
        //        cell.subimageView.image = productDetailVm.productDetail[0].productSubImage?[indexPath.row]
        if let image = productDetailVm.productDetail[0].productSubImage?[indexPath.row] {
            cell.subimageView.image = image
        }
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        
        delegate?.didSelect(index: indexPath)
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 1.5
            cell.layer.cornerRadius = 10
            cell.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 0.0
        }
    }
    
}
