//
//  BankPopViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 12/10/23.
//

import UIKit

class BankPopViewController: UIViewController{

    var section1 = [Bank]()
    
    // MARK:  - Outlets -
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var confirmBtn: UIButton!
    
    // MARK:  - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.register(PopBankTableViewCell.nib(), forCellReuseIdentifier: "PopBankTableViewCell")
        confirmBtn.layer.cornerRadius = 10
        section1 = Banks
    }

    @IBAction func BtnConfirm(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension BankPopViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section1.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopBankTableViewCell", for: indexPath) as! PopBankTableViewCell
        cell.setUp(with: section1[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}
