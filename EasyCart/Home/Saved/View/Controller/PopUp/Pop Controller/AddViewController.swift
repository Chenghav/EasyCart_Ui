//
//  AddViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 19/10/23.
//

import UIKit
class AddViewController: UIViewController, PopAnother  {
    
    // MARK:  - Outlets -
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var View1: UIView!
    
    // MARK:  - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        View1.layer.cornerRadius = 10
        View2.layer.cornerRadius = 10
        
    }
    @IBAction func AddAnotherCollection(_ sender: Any) {
        AddViewController.Pop(from: self, in: nil)
    }
    
}
