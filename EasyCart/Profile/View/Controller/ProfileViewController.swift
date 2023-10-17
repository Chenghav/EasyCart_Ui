//
//  ProfileViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 7/10/23.
//

import UIKit
import FittedSheets




class ProfileViewController: UIViewController,Demoable {

    // MARK:  - Array Data -
    var section1 = [Section1]()
    var section2 = [Section]()
    var section3 = [Section3]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:  - Life Cycle -
    override func  viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: "TableViewCell")
        tableView.register(LogOutTableViewCell.nib(), forCellReuseIdentifier: "LogOutTableViewCell")
        tableView.register(Section1TableViewCell.nib(), forCellReuseIdentifier: "Section1TableViewCell")
        section1 = Section1s
        section2 = Sections
        section3 = Section3s
        tableView.reloadData()
    }
    }


// MARK:  - UITableViewDataSource and UITableViewDelegate -
extension ProfileViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return section1.count
        } else if section == 1 {
            return section2.count
        } else if section == 2 {
            return section3.count
            
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection = indexPath.section
        
        if currentSection == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Section1TableViewCell", for: indexPath) as! Section1TableViewCell
            cell.config(with: section1[indexPath.row])
            cell.selectionStyle = .none
            return cell
        } else if currentSection == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.setUp(with: section2[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }else if currentSection == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogOutTableViewCell", for: indexPath) as! LogOutTableViewCell
            cell.setUp(with: section3[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentIndex = indexPath.section
        if currentIndex == 2 {
            ProfileViewController.openDemo(from: self, in: nil, btnName: "Log out", titleLab1: "Log out of EasyCart?")
        }else if currentIndex == 0 {
            if let nextController = storyboard?.instantiateViewController(identifier: "ConnectBankViewController") as? ConnectBankViewController {
                navigationController?.pushViewController(nextController, animated: true)
            }
        }else if currentIndex == 1 && indexPath.row == 0 {
            if let nextController = storyboard?.instantiateViewController(identifier: "AllitemViewController") as? AllitemViewController {
                navigationController?.pushViewController(nextController, animated: true)
            }
        }
    
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let currentSections = indexPath.section
            if currentSections == 0 {
                return 64
            }else if currentSections == 1{
                return 74
            }else {
                return 34
            }
        }
}




