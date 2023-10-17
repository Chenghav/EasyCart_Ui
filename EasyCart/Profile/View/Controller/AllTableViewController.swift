//
//  AllTableViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 13/10/23.
//

import UIKit

class AllTableViewController: UIViewController{

    // MARK:  - Array Data -
    var section1 = [Allitem]()
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:  - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource     = self
        tableView.delegate       = self
        section1                 = Allitems
        tableView.separatorStyle = .none
        tableView.register(ForAllitemSec1TableViewCell.nib(), forCellReuseIdentifier: "ForAllitemSec1TableViewCell")
    }
}

// MARK:  - UITableViewDataSource -
extension AllTableViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return section1.count
        }else if section == 1 {
            return section1.count
        }
        return 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForAllitemSec1TableViewCell") as! ForAllitemSec1TableViewCell
            cell.setUp(with: Allitems[indexPath.row])
            cell.selectionStyle = .none
            
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForAllitemSec1TableViewCell") as! ForAllitemSec1TableViewCell
            cell.setUp(with: Allitems[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
//            let headerView              = UIView()
            let headerView           = UILabel()
            headerView.text          = "Today"
            headerView.textColor     = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            headerView.font          = UIFont.boldSystemFont(ofSize: 16)
            headerView.textAlignment = .left
//            let sectionView          = UIView()
//
//            let sectionImage = UIImage(named: "ico_chevdown (1)")
//            let sectionImageView = UIImageView(image: sectionImage)
//            sectionImageView.frame = CGRect(x: 3, y: 10, width: 24, height: 24)
//
//            headerView.addSubview(headerViewLab)
//            headerView.addSubview(sectionView)
            
            return headerView
        }else if section == 1 {
            let headerView           = UILabel()
            headerView.text          = "Yesterday"
            headerView.textColor     = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            headerView.font          = UIFont.boldSystemFont(ofSize: 16)
            headerView.textAlignment = .left
            
            return headerView
        }
         return nil
     }
}
