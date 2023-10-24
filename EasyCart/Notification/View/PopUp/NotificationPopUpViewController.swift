//
//  NotificationPopUpViewController.swift
//  EasyCart
//
//  Created by PVH_002 on 18/10/23.
//

import UIKit

class NotificationPopUpViewController: UIViewController, ReportDemovable {

    @IBOutlet weak var removeNotificatoinRec: UIView!
    @IBOutlet weak var reportNotificationRec: UIView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeNotificatoinRec.layer.cornerRadius = 10
        removeNotificatoinRec.clipsToBounds = true
        reportNotificationRec.layer.cornerRadius = 10
        reportNotificationRec.clipsToBounds = true
        userImage.translatesAutoresizingMaskIntoConstraints = false

        // Add width constraint
        NSLayoutConstraint.activate([
            userImage.widthAnchor.constraint(equalToConstant: 60)
        ])

        // Add height constraint
        NSLayoutConstraint.activate([
            userImage.heightAnchor.constraint(equalToConstant: 60)
        ])

        // Add top constraint
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
        ])

        // Add horizontal center constraint
        NSLayoutConstraint.activate([
            userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Set corner radius and clipsToBounds
        userImage.layer.cornerRadius = 30
        userImage.clipsToBounds = true
    }
    @IBAction func removeNotification(_ sender: Any) {
        userName.text = "Salin"
    }
    @IBAction func reportNotification(_ sender: Any) {
        NotificationPopUpViewController.self.openReport(from: self, in: nil)
    }

    
}
