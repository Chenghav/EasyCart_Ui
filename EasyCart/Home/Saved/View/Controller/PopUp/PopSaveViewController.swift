//
//  PopSaveViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 18/10/23.
//

import UIKit

class PopSaveViewController: UIViewController {
    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        View1.heightAnchor.constraint(equalToConstant: 52).isActive = true
        View2.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }

}
