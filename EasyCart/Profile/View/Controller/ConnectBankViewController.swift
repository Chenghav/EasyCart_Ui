//
//  ConnectBankViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 9/10/23.
//

import UIKit

class ConnectBankViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var section1 = [BankSection]()
    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        tableView.register(BankSetupTableViewCell.nib(), forCellReuseIdentifier: "BankSetupTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        section1 = bankSection
        View1.layer.cornerRadius = 10
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false

    }

    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankSetupTableViewCell", for: indexPath) as! BankSetupTableViewCell
        cell.setUp(with: section1[indexPath.row])
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            cell.TextField1.textColor = #colorLiteral(red: 0.4371664226, green: 0.06279010326, blue: 0.8771118522, alpha: 1)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
             let headerView = UILabel()
             headerView.text = "Connect your bank account to receive money"
            headerView.textColor = #colorLiteral(red: 0.5555481911, green: 0.5656152368, blue: 0.6396402121, alpha: 0.8980392157)
             headerView.font = UIFont.boldSystemFont(ofSize: 14)
             headerView.textAlignment = .left
             return headerView
         }
         return nil
     }


    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
}
