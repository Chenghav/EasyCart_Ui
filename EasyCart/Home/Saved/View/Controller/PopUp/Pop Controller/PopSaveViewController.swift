//
//  PopSaveViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 18/10/23.
//

import UIKit
import FittedSheets

class PopSaveViewController: UIViewController, CreatePop, PopDelete{
    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    var vc1 : CellSelectViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        View1.heightAnchor.constraint(equalToConstant: 52).isActive = true
        View2.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    @IBAction func EditCollectionName(_ sender: Any) {
        PopSaveViewController.PopNew(from: self, in: nil, btnName: "Done", titleLab1: "Edit")
    }
    
    @IBAction func DeleteCollectionBtn(_ sender: Any) {
        let useInlineMode = view != nil
        
        let controller = UIStoryboard(name: "Storyboard1", bundle: nil).instantiateViewController(withIdentifier: "DeleteCollectionViewController") as! DeleteCollectionViewController
        
        let options = SheetOptions(
            shouldExtendBackground: true,
            useFullScreenMode: true,
            shrinkPresentingViewController: false,
            useInlineMode: useInlineMode
        )
        
        let sheetController = SheetViewController(controller: controller, options: options)
        sheetController.allowPullingPastMaxHeight = false
        sheetController.setSizes([.fixed(270)])
        let pop2 = self
        self.dismiss(animated: true){
            pop2.vc1.present(sheetController, animated: true, completion: nil)
        }

        
    }
    
}
