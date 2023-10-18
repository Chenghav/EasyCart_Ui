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
    @IBOutlet weak var mytableViewAdd: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mytableViewAdd.delegate = self
        mytableViewAdd.dataSource = self
        mytableViewAdd.register(UINib(nibName: "AddressTableViewCell", bundle: .none), forCellReuseIdentifier: "AddressTableViewCell")
        mytableViewAdd.register(UINib(nibName: "SectionAddTableViewCell", bundle: .none), forCellReuseIdentifier: "SectionAddTableViewCell")
        mytableViewAdd.register(UINib(nibName: "AddressAddTableViewCell", bundle: .none), forCellReuseIdentifier: "AddressAddTableViewCell")
        mytableViewAdd.layer.cornerRadius = 10
       
        
        
    }
  
    @IBAction func bntback(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections[section] == "3" {
                return AddressData.count
            }
        return 1
    }
    
    func tableView(_ tableVieaw: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if sections[indexPath.section] == "1"{
            let cell = mytableViewAdd.dequeueReusableCell(withIdentifier: "AddressTableViewCell") as! AddressTableViewCell
            return cell
        } else if sections[indexPath.section] == "2" {
            let cell = mytableViewAdd.dequeueReusableCell(withIdentifier: "SectionAddTableViewCell") as! SectionAddTableViewCell
            return cell
        } else if sections[indexPath.section] == "3" {
            let cell = mytableViewAdd.dequeueReusableCell(withIdentifier: "AddressAddTableViewCell") as! AddressAddTableViewCell
            cell.setup(with: AddressData[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        if indexPath == [1,0]{
          return
        }
        
        self.performSegue(withIdentifier: "Add", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let detailsVC = segue.destination as! NewAddressController
   
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
