//
//  NotificationModel.swift
//  EasyCart
//
//  Created by PVH_002 on 17/10/23.
//

import Foundation
import UIKit

struct NotificationModel{
    let notificationTitle : String
    let notificatoinImage : UIImage
    let notificationDesc : String
    let notificationCreatAt : String
    
}

let notificationModel : [NotificationModel] = [
    NotificationModel(notificationTitle: "You receive an order", notificatoinImage: UIImage(named: "notification_user")!, notificationDesc: "$1,000.00 from Krong Kampuchea", notificationCreatAt: "2023-9-10T08:20:09.000+00:00"),
    NotificationModel(notificationTitle: "You receive an order", notificatoinImage: UIImage(named: "notification_user")!, notificationDesc: "$1,000.00 from Krong Kampuchea", notificationCreatAt: "2023-7-10T08:20:09.000+00:00"),
    NotificationModel(notificationTitle: "You receive an order", notificatoinImage: UIImage(named: "notification_user")!, notificationDesc: "$1,000.00 from Krong Kampuchea", notificationCreatAt: "2023-10-10T09:20:09.000+00:00"),
    NotificationModel(notificationTitle: "You receive an order", notificatoinImage: UIImage(named: "notification_user")!, notificationDesc: "$1,000.00 from Krong Kampuchea", notificationCreatAt: "2023-10-1T06:24:09.000+00:00"),
    NotificationModel(notificationTitle: "You receive an order", notificatoinImage: UIImage(named: "notification_user")!, notificationDesc: "$1,000.00 from Krong Kampuchea", notificationCreatAt: "2023-10-17T09:22:09.000+00:00"),
    NotificationModel(notificationTitle: "You receive an order", notificatoinImage: UIImage(named: "notification_user")!, notificationDesc: "$1,000.00 from Krong Kampuchea", notificationCreatAt: "2023-10-17T06:22:09.000+00:00"),
    NotificationModel(notificationTitle: "You receive an order", notificatoinImage: UIImage(named: "notification_user")!, notificationDesc: "$1,000.00 from Krong Kampuchea", notificationCreatAt: "2023-10-17T06:22:09.000+00:00"),
    NotificationModel(notificationTitle: "You receive an order", notificatoinImage: UIImage(named: "notification_user")!, notificationDesc: "$1,000.00 from Krong Kampuchea", notificationCreatAt: "2023-10-23T06:22:09.000+00:00"),
]
