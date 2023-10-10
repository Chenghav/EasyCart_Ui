//
//  EditProfileViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 8/10/23.
//

import UIKit

class EditProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate   {
    
    var FirstSec = [FirstSection]()
    var SecondSec = [SecondSection]()
    var ThirdSec = [ThirdSection]()
    
    @IBOutlet weak var backBtnStyle: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.isNavigationBarHidden = false
        backBtnStyle.contentHorizontalAlignment = .left
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FirstEditSectionTableViewCell.nib(), forCellReuseIdentifier: "FirstEditSectionTableViewCell")
        tableView.register(SecondSectionTableViewCell.nib(), forCellReuseIdentifier: "SecondSectionTableViewCell")
        tableView.register(ThirdCellsTableViewCell.nib(), forCellReuseIdentifier: "ThirdCellsTableViewCell")
        tableView.register(UINib(nibName: "ThirdSectionTableViewCell", bundle: nil), forCellReuseIdentifier: "ThirdSectionTableViewCell")
        FirstSec = firstSection
        SecondSec = secondSection
        ThirdSec = thirdSection
        tableView.reloadData()
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return FirstSec.count
        } else if section == 1 {
            return SecondSec.count + ThirdSec.count
        } else if section == 2 {
            return 1
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstEditSectionTableViewCell", for: indexPath) as! FirstEditSectionTableViewCell
            cell.setUp(with: FirstSec[indexPath.row])
            if indexPath.row == 4 {
                cell.SecondLab.textColor = #colorLiteral(red: 0.5210024118, green: 0.2106079459, blue: 0.9001228213, alpha: 1)
            }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let currentIndex = indexPath.row
            if currentIndex < SecondSec.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SecondSectionTableViewCell", for: indexPath) as! SecondSectionTableViewCell
                cell.config(with: SecondSec[currentIndex])
                cell.selectionStyle = .none
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdCellsTableViewCell", for: indexPath) as! ThirdCellsTableViewCell
                cell.setUps(with: ThirdSec[currentIndex - SecondSec.count])
                cell.selectionStyle = .none
                return cell
            }
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdSectionTableViewCell", for: indexPath) as! ThirdSectionTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentRow = indexPath.row
        if indexPath.section == 0 {
            return 50
        }else if indexPath.section == 1 {
            if currentRow == 0 {
                return 106
            }else if currentRow == 1 {
                return 50
            }
        }else if indexPath.section == 2 {
            return 44
        }
        return 0
    }
    


}
