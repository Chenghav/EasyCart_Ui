//
//  NotificationReortViewController.swift
//  EasyCart
//
//  Created by PVH_002 on 18/10/23.
//

import UIKit

class NotificationReortViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var reportTextField: UITextView!
    @IBOutlet weak var notificationReportRec: UIView!
    @IBOutlet weak var notificatoinAttachmentRec: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reportTextField.delegate = self
        reportTextField.text = "Write here"
        reportTextField.textColor = UIColor.lightGray

        notificationReportRec.layer.cornerRadius = 10
        notificatoinAttachmentRec.layer.cornerRadius = 10
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write here"
            textView.textColor = UIColor.lightGray
        }
    }
    
}
