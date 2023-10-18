//
//  PaymentController.swift
//  Easycart
//
//  Created by KSG-USR on 9/10/23.
//

import Foundation
import UIKit


class PaymentController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sections = ["1","2","3"]
    @IBOutlet weak var mytableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mytableView.delegate = self
        mytableView.dataSource = self
        mytableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        mytableView.register(UINib(nibName: "DeliveryTableViewCell", bundle: nil), forCellReuseIdentifier: "DeliveryTableViewCell")
        mytableView.register(UINib(nibName: "PayTableViewCell", bundle: nil), forCellReuseIdentifier: "PayTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if sections[indexPath.section] == "1" {
            let cell = mytableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
            return cell
        } else if sections[indexPath.section] == "2" {
            let cell = mytableView.dequeueReusableCell(withIdentifier: "DeliveryTableViewCell", for: indexPath) as! DeliveryTableViewCell
            return cell
        } else if sections[indexPath.section] == "3"{
            let cell = mytableView.dequeueReusableCell(withIdentifier: "PayTableViewCell", for: indexPath) as! PayTableViewCell
            return cell
            
        }else{
            print("Unknown section: \(sections[indexPath.section])")
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let vc = UIStoryboard.init(name: "AddressSb", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddressController") as? AddressController
        self.navigationController?.pushViewController(vc!, animated: true)
        
//        let mvc = AddressController()
//        let storyBoardNameString = mvc.restorationIdentifier!
//        let storyboard = UIStoryboard(name: storyBoardNameString , bundle: nil)
//        if let  secondViewController = storyboard.instantiateViewController(withIdentifier: "some-view-controller") as? AddressController{
//            navigationController?.pushViewController(storyboard, animated: true)
//        }
        
//        let storyboardName = "AddressStoryboard"  // Replace with your actual storyboard name
//
//            // Instantiate the target storyboard
//            let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
//
//            // Instantiate the view controller from the target storyboard using its identifier
//            if let secondViewController = storyboard.instantiateViewController(withIdentifier: "AddressController") as? AddressController {
//                navigationController?.pushViewController(secondViewController, animated: true)
//            }
}
        
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section] == "1" {
            return 164
        }else if sections[indexPath.section] == "2"{
            return 200
        }else if sections[indexPath.section] == "3"{
            return 400
        }else{
            return 0
        }
        
        
        
    }
}
