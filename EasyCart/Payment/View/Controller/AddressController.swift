//
//  PaymentController.swift
//  Payment
//
//  Created by Chheang Somalin on 13/10/23.
//

import Foundation
import UIKit

class AddressController : UIViewController, UITableViewDelegate, UITableViewDataSource {



    
  
    let sections = ["1","2","3"]
    @IBOutlet weak var mytableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mytableView.delegate = self
        mytableView.dataSource = self
        mytableView.register(UINib(nibName: "AddressTableViewCell", bundle: .none), forCellReuseIdentifier: "AddressTableViewCell")
        mytableView.register(UINib(nibName: "SectionAddTableViewCell", bundle: .none), forCellReuseIdentifier: "SectionAddTableViewCell")
        mytableView.register(UINib(nibName: "AddressAddTableViewCell", bundle: .none), forCellReuseIdentifier: "AddressAddTableViewCell")
        mytableView.layer.cornerRadius = 10
       
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections[section] == "3" {
                return AddressData.count
            }
        return 1
    }
    
    func tableView(_ tableVieaw: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if sections[indexPath.section] == "1"{
            let cell = mytableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell") as! AddressTableViewCell
            return cell
        } else if sections[indexPath.section] == "2" {
            let cell = mytableView.dequeueReusableCell(withIdentifier: "SectionAddTableViewCell") as! SectionAddTableViewCell
            return cell
        } else if sections[indexPath.section] == "3" {
            let cell = mytableView.dequeueReusableCell(withIdentifier: "AddressAddTableViewCell") as! AddressAddTableViewCell
           
            cell.setup(with: AddressData[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "Add" {
                // Handle any data passing here if needed
            }
        }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section] == "1"{
            return 52
        }else if sections[indexPath.section] == "2"{
            return 35
        }else if sections[indexPath.section] == "3"{
            return 133
        }else{
            return 133
        }
    }
    



}
