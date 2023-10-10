//
//  PopLogOutViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 7/10/23.
//

import UIKit

class PopLogOutViewController: UIViewController {

    @IBOutlet var mainView1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addAnimate()
    }
    
    
    
    @IBAction func CancelBtn(_ sender: Any) {
        CancelAnimate()
    }
    func addAnimate(){
        self.mainView1.transform = CGAffineTransform(translationX: 0, y: self.mainView1.frame.height)
        UIView.animate(withDuration: 0.5, animations: {
            self.mainView1.transform = .identity
        })
    }
    func CancelAnimate(){
        self.mainView1.transform = .identity
        UIView.animate(withDuration: 0.5, animations: {
            self.mainView1.transform = CGAffineTransform(translationX: 0, y: self.mainView1.frame.height)
        }){
            (complete) in
            self.view.removeFromSuperview()
        }
    }


}
