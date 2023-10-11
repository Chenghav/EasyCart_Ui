//
//  CreateItemVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/5/23.
//

import UIKit

class CreateItemVC: UIViewController{
    
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
//    var models = [Data]()
//
//    var roeSection2 = ["Title", "Place"]
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(InfoTVC.nib(), forCellReuseIdentifier: "InfoTVC")
        tableView.register(DiscountTVC.nib(), forCellReuseIdentifier: "DiscountTVC")
        tableView.register(UINib(nibName: "TitleTVC", bundle: .none), forCellReuseIdentifier: "TitleTVC")
        tableView.register(UINib(nibName: "PriceTVC", bundle: .none), forCellReuseIdentifier: "PriceTVC")
        tableView.register(UINib(nibName: "MoreDetailTVC", bundle: .none), forCellReuseIdentifier: "MoreDetailTVC")
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

 // MARK: - UITableViewDelegate -
extension CreateItemVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 5
        }else if section == 2 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath)
            return cell
        }else if indexPath.section == 1{
            if indexPath.row == 0{
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "InfoTVC", for: indexPath) as! InfoTVC
                return labelCel
            }else if indexPath.row == 1 {
                let TitleCel = tableView.dequeueReusableCell(withIdentifier: "TitleTVC", for: indexPath) as! TitleTVC
                return TitleCel
            }else if indexPath.row == 2{
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "PriceTVC", for: indexPath) as! PriceTVC
                return labelCel
            }else if indexPath.row == 3{
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "DiscountTVC", for: indexPath) as! DiscountTVC
                return labelCel
            }else if indexPath.row == 4 {
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "MoreDetailTVC", for: indexPath) as! MoreDetailTVC
                return labelCel
            }
        }else{
            let cellDesc = tableView.dequeueReusableCell(withIdentifier: "DescCell", for: indexPath)
            return cellDesc
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 147
        }else if indexPath.section == 1{
            if indexPath.row == 3 {
                return 62
            }else{
                return 50
            }
        }else{
            return 167
        }
    }
}
