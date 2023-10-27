//
//  PopSaveViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 18/10/23.
//

import UIKit

class PopSaveViewController: UIViewController, CreatePop, PopDelete{
    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!

    var vc1: CellSelectViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        View1.heightAnchor.constraint(equalToConstant: 52).isActive = true
        View2.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    @IBAction func EditCollectionName(_ sender: UIButton) {
//        self.dismiss(animated: true)
//    PopSaveViewController.PopNew(from: self, in: nil, btnName: "Done", titleLab1: "Edit")
       
        self.dismiss(animated: true, completion: {
            
            
            print("jjhjh")
            PopSaveViewController.PopNew(from: self, in: nil, btnName: "Done", titleLab1: "Edit")
                    })
    }
    
    @IBAction func DeleteCollectionBtn(_ sender: Any) {
        PopSaveViewController.Pop(from: self, in: nil)
        
    }
    
}
