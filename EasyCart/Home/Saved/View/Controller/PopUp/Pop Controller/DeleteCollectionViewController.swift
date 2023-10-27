//
//  DeleteCollectionViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 26/10/23.
//

import UIKit

class DeleteCollectionViewController: UIViewController, PopDelete {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func CancelBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
