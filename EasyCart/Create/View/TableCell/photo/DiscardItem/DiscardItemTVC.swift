//
//  DiscardItemTVC.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/27/23.
//

import UIKit

class DiscardItemTVC: UIViewController {
    
    @IBOutlet weak var btnDiscard: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    var titleButton : String?
    var titleLab : String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        btnDiscard.layer.cornerRadius = 10
        btnEdit.layer.cornerRadius = 10
        btnDiscard.setTitle(titleButton, for: .normal)
        btnEdit.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btnDiscard.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btnEdit.backgroundColor = .clear
        btnEdit.layer.cornerRadius = 10
        btnEdit.layer.borderWidth = 1
        btnEdit.layer.borderColor = UIColor.black.cgColor
    }
    @IBAction func Discard(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
    }
    @IBAction func Editing(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
