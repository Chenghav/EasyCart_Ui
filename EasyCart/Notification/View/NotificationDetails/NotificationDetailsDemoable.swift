//
//  NotificationDetailsDemoable.swift
//  EasyCart
//
//  Created by PVH_002 on 21/10/23.
//

import Foundation
import FittedSheets
import UIKit

protocol NotificationDetailsDemoable {

}
var receiptType = "notificationReceipt"
// MARK:  - PopUp FittedSheets -
extension NotificationDetailsDemoable {
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
    static func openNotificationDetails(from parent: UIViewController, in view: UIView?) {
        let useInlineMode = view != nil
        
        let controller = UIStoryboard(name: "PaymentSb", bundle: nil).instantiateViewController(withIdentifier: "RecieptController") as! RecieptController
        
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
