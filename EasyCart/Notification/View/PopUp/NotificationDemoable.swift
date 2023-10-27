
import Foundation
import FittedSheets
import UIKit

protocol NotificationDemoable {
    
}

// MARK:  - PopUp FittedSheets -
extension NotificationDemoable {
    
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
        
        let controller = UIStoryboard(name: "NotificationSB", bundle: nil).instantiateViewController(withIdentifier: "NotificationPopUpViewController") as! NotificationPopUpViewController
        
        let options = SheetOptions(
            shouldExtendBackground: true,
            useFullScreenMode: true,
            shrinkPresentingViewController: false,
            useInlineMode: useInlineMode
        )
        
        let sheetController = SheetViewController(controller: controller, options: options)
        sheetController.allowPullingPastMaxHeight = false
        sheetController.setSizes([.fixed(390)])
        
        parent.present(sheetController, animated: true, completion: nil)
    }
}