//
//  CreateNewViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 24/10/23.
//

import UIKit

class CreateNewViewController: UIViewController, CreatePop {

    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var titleLab: UILabel!
    var titleButton : String?
    var titleLabel : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLab.text = titleLabel
        rightBtn.setTitle(titleButton, for: .normal)
    }
    

    @IBAction func rightBtnAction(_ sender: Any) {
        if rightBtn.titleLabel?.text == "Done" {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
