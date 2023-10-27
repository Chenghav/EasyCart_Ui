//
//  PaymentController.swift
//  Payment
//
//  Created by Chheang Somalin on 13/10/23.
//

import Foundation
import UIKit


class AddressController : UIViewController, UITableViewDelegate, UITableViewDataSource, AddressAddTableViewCellDelegate, AddressTableViewCellDelegate {
 
    var userInputs: [Int: String] = [:]
    var addressModel: Address = Address()
    let sections = ["1","2","3"]
    var selectedCellIndexPath: IndexPath?
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
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          
            AddressData.remove(at: indexPath.row)
            
            userInputs.removeValue(forKey: indexPath.row)
            
        
            mytableViewAdd.deleteRows(at: [indexPath], with: .fade)
        }
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
            cell.delegate = self
            return cell
        } else if sections[indexPath.section] == "2" {
            let cell = mytableViewAdd.dequeueReusableCell(withIdentifier: "SectionAddTableViewCell") as! SectionAddTableViewCell
            return cell
        } else if sections[indexPath.section] == "3" {
            let cell = mytableViewAdd.dequeueReusableCell(withIdentifier: "AddressAddTableViewCell") as! AddressAddTableViewCell
            cell.setup(with: AddressData[indexPath.row])
            
            if indexPath == selectedCellIndexPath {
                      cell.iamgebtn.setImage(UIImage(named: "Checkbox"), for: .normal)
               
                      cell.isSelectedCell = true
                  } else {
                      cell.iamgebtn.setImage(UIImage(named: "Unchecked"), for: .normal)
                      cell.isSelectedCell = false
                  }
            cell.delegate = self
                  return cell
              }
        return UITableViewCell()
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
      
        if indexPath == [1,0]{
            
          return
        }else if indexPath == [0,0]{
             self.performSegue(withIdentifier: "Add", sender: self)
        }
        else{
            selectedCellIndexPath = indexPath
            mytableViewAdd.reloadData()
        }
      

//        self.performSegue(withIdentifier: "Add", sender: self)
    }
 
    
    func didTapButtonInCell(_ cell: AddressAddTableViewCell) {
        if let indexPath = mytableViewAdd.indexPath(for: cell) {
                    if sections[indexPath.section] == "3" {
                        // Perform the navigation when the button is tapped in the cell
                        self.performSegue(withIdentifier: "Add", sender: self)
                    }
                }
    }
    
    
    func didTapButton(_ cell: AddressTableViewCell) {
        if let indexPath = mytableViewAdd.indexPath(for: cell) {
                    if sections[indexPath.section] == "1" {
                        // Perform the navigation when the button is tapped in the cell
                        self.performSegue(withIdentifier: "Add", sender: self)
                    }
                }
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
