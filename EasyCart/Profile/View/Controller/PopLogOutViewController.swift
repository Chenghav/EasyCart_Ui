//
//  PopLogOutViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 7/10/23.
//

import UIKit

class PopLogOutViewController: UIViewController {

    // MARK:  - Outlets -
    @IBOutlet weak var Cancel: UIButton!
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var lab1: UILabel!
    var titleButton : String?
    var titleLab : String?
    
    
    // MARK:  - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        logOut.layer.cornerRadius = 10
        Cancel.layer.cornerRadius = 10
        logOut.setTitle(titleButton, for: .normal)
        lab1.text = titleLab
        Cancel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        logOut.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }

    // MARK:  - Outlet Actions -
    @IBAction func CancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LogoutBtn(_ sender: Any) {
        
    }
    
}
