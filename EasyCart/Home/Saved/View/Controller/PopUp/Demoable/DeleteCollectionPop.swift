//
//  DeleteCollectionPop.swift
//  EasyCart
//
//  Created by Ly Chenghav on 26/10/23.
//

import Foundation
import FittedSheets
import UIKit

protocol PopDelete {

}

// MARK:  - PopUp FittedSheets -
extension PopDelete {
    
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
    static func Pop(from parent: UIViewController, in view: UIView?) {
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
        sheetController.setSizes([.fixed(290)])
        
        
        parent.present(sheetController, animated: true, completion: nil)
    }
}

