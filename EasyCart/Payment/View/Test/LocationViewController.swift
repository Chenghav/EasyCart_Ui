//
//  Location.swift
//  EasyCart
//
//  Created by ToTo  on 27/10/23.
//

import Foundation
import UIKit
class LocationViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    @IBAction func backbtntoadd(_ sender: Any) {
        let viewController = UIStoryboard(name: "NewAddressController", bundle: nil).instantiateViewController(withIdentifier: "NewAddressController")
        navigationController?.pushViewController(viewController, animated: true)


    }
    
}
