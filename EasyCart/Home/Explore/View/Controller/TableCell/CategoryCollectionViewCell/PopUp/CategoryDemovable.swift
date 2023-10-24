

import Foundation
import FittedSheets
import UIKit

protocol CategoryDemovable {
   
}
// MARK:  - PopUp FittedSheets -
extension CategoryDemovable {
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
    
    static func openCategoryDetails(from parent: UIViewController, in view: UIView?) {
        
        let useInlineMode = view != nil
        
        let controller = UIStoryboard(name: "Explore", bundle: nil).instantiateViewController(withIdentifier: "CategoryDetailsViewController") as! CategoryDetailsViewController
        
        let options = SheetOptions(
            shouldExtendBackground: true,
            useFullScreenMode: true,
            shrinkPresentingViewController: true,
            useInlineMode: useInlineMode
        )
        let sheetController = SheetViewController(controller: controller, options: options)
        sheetController.allowPullingPastMaxHeight = false
        sheetController.setSizes([.fullscreen])
        parent.present(sheetController, animated: true, completion: nil)
        
    }
}
