//
//  ViewDetailCV.swift
//  EasyCart
//
//  Created by Hen Ty on 19/10/23.
//

import UIKit
protocol ProcessDelegate{
    func didSelect(index:IndexPath)
}
class ViewDetailCV: UIViewController , ProcessDelegate, UICollectionViewDelegate, PopUpDetail{
    func didSelect(index: IndexPath) {
        topcollection?.scrollToItem(at: index, at: .right, animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var topcollection: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    private var sectionIsExpanded = [true, true, true]
    var productDetailVm = ProductDetailVm()
    var productInfoVm = ProductInfoVm()
    
    var sellInfoModel: [SellerInfoModel] = []
    var locationModel: [LocationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productDetailVm.fetchProduct()
        productInfoVm.fetchProductInfo()
        staticData()
        registerCustomCells()
        topcollection.dataSource = self
        topcollection.delegate = self
        
    }
    
    // MARK: - Static Data -
    func staticData() {
        
        sellInfoModel = [
            SellerInfoModel(username: "Dara Kok", email: "@darakok", phoneNumber: "(+855) 10 297 859", photoProfile: #imageLiteral(resourceName: "iconMini"))
        ]
        
        locationModel = [
            LocationModel(googleLink: "Street 12, Khan 7 Makara, Phnom Penh, Cambodia", mapLink: #imageLiteral(resourceName: "Location"))
        ]
        
    }
    
    
    // MARK: - nib file -
    func registerCustomCells() {
        
        
        let productCell = UINib(nibName: "ItemProductTBC", bundle: nil)
        tableView.register(productCell, forCellReuseIdentifier: "proCell")
        
        let sellCell = UINib(nibName: "SellerInfoTBC", bundle: nil)
        tableView.register(sellCell, forCellReuseIdentifier: "sellCell")
        
        let locatCell = UINib(nibName: "LocationTBC", bundle: nil)
        tableView.register(locatCell, forCellReuseIdentifier: "locateCell")
        
        let buyNow = UINib(nibName: "BuyNowTBC", bundle: nil)
        tableView.register(buyNow, forCellReuseIdentifier: "buyNowCell")
    }
    
    
    // MARK: - more option -
    @IBAction func MoreBtnClick(_ sender: Any) {
        ViewDetailCV.openDemo(from: self, in: nil)
    }
    
    
    
    
}

extension ViewDetailCV: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - tableView -
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections you want
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return productDetailVm.productDetail.count
            
        } else if section == 1 {
            return 1
        }else if section == 2 {
            return productInfoVm.productInfoVm.count
        }else if section == 3 {
            return sellInfoModel.count
        }
        else if section == 4 {
            return locationModel.count
            
        }else if section == 5{
            return 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailTableCell", for: indexPath) as! ProductDetailTableCell
            productCell.idLabel.text = productDetailVm.productDetail[indexPath.row].productId
            productCell.modelProductLabel.text = productDetailVm.productDetail[indexPath.row].productName
            productCell.disCountLabel?.text = productDetailVm.productDetail[indexPath.row].productPrice
            productCell.fullPriceLabel.text = productDetailVm.productDetail[indexPath.row].productDiscount
            productCell.percentageLabel.text = productDetailVm.productDetail[indexPath.row].productPercentage
            
            print(productDetailVm.productDetail)
            
            print(" ====== Section 1 ")
            productCell.selectionStyle = .none
           
            productCell.delegate = self
            return productCell
            
            
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoTableViewCell", for: indexPath) as! ProductInfoTableViewCell
            if sectionIsExpanded[indexPath.section]{
                cell.setExpanded()
            }else{
                cell.setCollapsed()
            }
            cell.selectionStyle = .none
            
            return cell
            
        }else if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDataTableViewCell", for: indexPath) as! ProductDataTableViewCell
            
           
            
            // MARK: - get data -
            cell.label.text = productInfoVm.productInfoVm[indexPath.row].productInfo
            cell.data.text = productInfoVm.productInfoVm[indexPath.row].productValue
            print(" ====== Section 2 ")
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 3 {
            
            let sellinfo = tableView.dequeueReusableCell(withIdentifier: "sellCell", for: indexPath) as! SellerInfoTBC
            let s_info = sellInfoModel[indexPath.row]
            sellinfo.setUpInfo(with: s_info)
            
            sellinfo.selectionStyle = .none
            print(" ====== Section 3 ")
            return sellinfo
        }else if indexPath.section == 4{
            
            let locationCell = tableView.dequeueReusableCell(withIdentifier: "locateCell", for: indexPath) as! LocationTBC
            let loc = locationModel[indexPath.row]
            locationCell.setUp(with: loc)
            locationCell.selectionStyle = .none
            print(" ====== Section 4 ")
            return locationCell
        }else{
            // Dequeue and configure cells for the second section
            let buyCell = tableView.dequeueReusableCell(withIdentifier: "buyNowCell", for: indexPath) as! BuyNowTBC
            buyCell.selectionStyle = .none
            
            
            buyCell.layoutIfNeeded()
            let topBorder = CALayer()
            topBorder.frame = CGRect(x: 0, y: 0, width: buyCell.frame.size.width, height: 0.3) // Adjust the height as needed
            topBorder.backgroundColor = UIColor.gray.cgColor // Set the border color
            
            // Add the top border layer as a sublayer to the cell's layer
            buyCell.layer.addSublayer(topBorder)
            buyCell.layoutMargins = .zero
            return buyCell
            
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            sectionIsExpanded[indexPath.section] = !sectionIsExpanded[indexPath.section]
            
            tableView.reloadSections([indexPath.section], with: .automatic)
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let viewHeader = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
//                viewHeader.backgroundColor = UIColor.darkGray // Changing the header background color to gray
//                let button = UIButton(type: .custom)
//                button.frame = viewHeader.bounds
//                button.tag = section // Assign section tag to this button
//                button.addTarget(self, action: #selector(tapSection(sender:)), for: .touchUpInside)
//                button.setTitle("Section: \(section)", for: .normal)
//                viewHeader.addSubview(button)
//                return viewHeader
//    }
//    @objc func tapSection(sender: UIButton) {
//        self.productInfoVm.productInfoVm[sender.tag] = (self.productInfoVm.productInfoVm[sender.tag] == true) ? 1 : 0
//           self.tableView.reloadSections([sender.tag], with: .fade)
//       }
    
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let sectionButton = UIButton()
    //        sectionButton.setTitle(String(section),
    //                               for: .normal)
    //        sectionButton.backgroundColor = .systemBlue
    //        sectionButton.tag = section
    //        sectionButton.addTarget(self,
    //                                action: #selector(self.hideSection(sender:)),
    //                                for: .touchUpInside)
    //
    //        return sectionButton
    //    }
    //
    //    @objc
    //    private func hideSection(sender: UIButton) {
    //        let section = sender.tag
    //
    //        func indexPathsForSection() -> [IndexPath] {
    //            var indexPaths = [IndexPath]()
    //
    //            for row in 0..<self.productInfoVm.productInfoVm[section].count {
    //                indexPaths.append(IndexPath(row: row, section: section))
    //            }
    //
    //
    //            return indexPaths
    //        }
    //
    //        if self.hiddenSections.contains(section) {
    //            self.hiddenSections.remove(section)
    //            self.tableView.insertRows(at: indexPathsForSection(),
    //                                      with: .fade)
    //        } else {
    //            self.hiddenSections.insert(section)
    //            self.tableView.deleteRows(at: indexPathsForSection(),
    //                                      with: .fade)
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(218)
        }else if indexPath.section == 1 {
            return CGFloat(56)
            

        }else if indexPath.section == 2 {
//            return CGFloat(56)
            return tableView.estimatedRowHeight
        }else if indexPath.section == 3 {
            return CGFloat(175)
        }else if indexPath.section == 4{
            return CGFloat(197)
        }else{
            return CGFloat(98)
        }
        
    }
    
    
    
}

extension ViewDetailCV: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDetailVm.productDetail[0].productSubImage?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductImageCollectionCell", for: indexPath) as! ProductImageCollectionCell
        cell.ParentViewImage.image = productDetailVm.productDetail[0].productSubImage?[indexPath.row]
        
        return cell
    }
    
    
}

extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func topRounded() {
        self.roundCorners(corners: [.topLeft, .topRight], radius: 0)
    }
    
    func bottomRounded() {
        self.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 10.0)
    }
    
    func topBottomRounded() {
        self.roundCorners(corners: [.topLeft, .topRight,.bottomLeft, .bottomRight], radius: 10.0)
    }
    
    func defaultStateForBorders() {
        self.roundCorners(corners: [], radius: 0)
    }
    
}
