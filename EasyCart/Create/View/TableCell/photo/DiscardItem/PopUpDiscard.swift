//
//  PopUpDiscard.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/27/23.
//

import Foundation
import UIKit
import FittedSheets

protocol PopUpDiscard {

}

// MARK:  - PopUp FittedSheets -
extension PopUpDiscard {
    
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
    static func openDemo(from parent: UIViewController, in view: UIView?) {
        let useInlineMode = view != nil
        
        let controller = UIStoryboard(name: "CreateItemSB", bundle: nil).instantiateViewController(withIdentifier: "DiscardItemTVC") as! DiscardItemTVC
        
        let options = SheetOptions(
            shouldExtendBackground: true,
            useFullScreenMode: true,
            shrinkPresentingViewController: false,
            useInlineMode: useInlineMode
        )
        
        let sheetController = SheetViewController(controller: controller, options: options)
        sheetController.allowPullingPastMaxHeight = false
        sheetController.setSizes([.fixed(240)])
        
        
        parent.present(sheetController, animated: true, completion: nil)
    }
}

