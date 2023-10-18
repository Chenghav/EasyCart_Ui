//
//  NewAddressController.swift
//  Payment
//
//  Created by Chheang Somalin on 14/10/23.
//

import Foundation
import UIKit
class NewAddressController : UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    @IBOutlet weak var newTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newTableView.delegate = self
        newTableView.dataSource = self
        newTableView.register(UINib(nibName: "NewAddressTableViewCell", bundle: .none
        ), forCellReuseIdentifier: "NewAddressTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
 
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newTableView.dequeueReusableCell(withIdentifier: "NewAddressTableViewCell")  as! NewAddressTableViewCell
        return cell
        
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 334
        
    }
}
