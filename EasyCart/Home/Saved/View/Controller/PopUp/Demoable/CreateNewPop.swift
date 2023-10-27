//
//  CreateNewPop.swift
//  EasyCart
//
//  Created by Ly Chenghav on 24/10/23.
//

import Foundation
import FittedSheets
import UIKit

protocol CreatePop {

}

// MARK:  - PopUp FittedSheets -
extension CreatePop {
    
    static func addSheetEventLogging(to sheet: SheetViewController) {
        let previousDidDismiss = sheet.didDismiss
        sheet.didDismiss = {
            print("did dismiss")
            previousDidDismiss?($0)
        }
        
        let previousShouldDismiss = sheet.shouldDismiss
        sheet.shouldDismiss = {
            print("should dismiss")
            return previousShouldDismiss?($0) ?? true
        }
        
        let previousSizeChanged = sheet.sizeChanged
        sheet.sizeChanged = { sheet, size, height in
            print("Changed to \(size) with a height of \(height)")
            previousSizeChanged?(sheet , size, height)
        }
    }
    static func PopNew(from parent: UIViewController, in view: UIView?,btnName : String?, titleLab1: String?) {
        let useInlineMode = view != nil
        
        let controller = UIStoryboard(name: "Storyboard1", bundle: nil).instantiateViewController(withIdentifier: "CreateNewViewController") as! CreateNewViewController
        controller.titleButton = btnName!
        controller.titleLabel = titleLab1!
        let options = SheetOptions(
            shouldExtendBackground: true,
            useFullScreenMode: true,
            shrinkPresentingViewController: false,
            useInlineMode: useInlineMode
        )
        
        let sheetController = SheetViewController(controller: controller, options: options)
        sheetController.allowPullingPastMaxHeight = false
        sheetController.setSizes([.fixed(200)])
        
        
        parent.present(sheetController, animated: true, completion: nil)
    }
}


