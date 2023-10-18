//
//  Demoable.swift
//  EasyCart
//
//  Created by Ly Chenghav on 17/10/23.
//

import Foundation
import UIKit
import FittedSheets

protocol Demoable {

}

// MARK:  - PopUp FittedSheets -
extension Demoable {
    
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
    static func openDemo(from parent: UIViewController, in view: UIView?,btnName : String?, titleLab1: String?) {
        let useInlineMode = view != nil
        
        let controller = UIStoryboard(name: "Storyboard1", bundle: nil).instantiateViewController(withIdentifier: "PopLogOutViewController") as! PopLogOutViewController
         controller.titleButton = btnName!
         controller.titleLab = titleLab1!
        let options = SheetOptions(
            shouldExtendBackground: true,
            useFullScreenMode: true,
            shrinkPresentingViewController: true,
            useInlineMode: useInlineMode
        )
        
        let sheetController = SheetViewController(controller: controller, options: options)
        sheetController.allowPullingPastMaxHeight = false
        sheetController.setSizes([.fixed(240)])
        
        
        parent.present(sheetController, animated: true, completion: nil)
    }
}