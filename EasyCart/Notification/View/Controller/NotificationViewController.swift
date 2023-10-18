//
//  NotificationViewController.swift
//  EasyCart
//
//  Created by PVH_002 on 17/10/23.
//

import UIKit

class NotificationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        filterNotifications()
        displayNoNotificationsMessage()
        tableView.reloadData()
    }
    
    @IBAction func open(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Sheet", bundle: nil)
//        let sheetPresentController = storyboard.instantiateViewController(withIdentifier: "SheetViewController") as! SheetViewController
//        present(sheetPresentController, animated: true, completion: nil)
//        showMiracle()
    }
    
    var notificationFilter: [(filterType: String, notifications: [NotificationModel])] = [
        (filterType: "new", notifications: []),
        (filterType: "last7days", notifications: []),
        (filterType: "last30days", notifications: []),
        (filterType: "order", notifications: [])
    ]
    
    func createDateFromString(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter.date(from: dateString)
    }
    
    func displayNoNotificationsMessage() {
        if notificationFilter.allSatisfy({ $0.notifications.isEmpty }) {
            // Display "No Notifications" message
            let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            messageLabel.text = "No Notifications"
            messageLabel.textColor = .black
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont.systemFont(ofSize: 18)
            messageLabel.sizeToFit()
            
            tableView.backgroundView = messageLabel
            tableView.separatorStyle = .none
        } else {
            // Remove "No Notifications" message
            tableView.backgroundView = nil
            tableView.separatorStyle = .singleLine
        }
    }
    
    func filterNotifications() {
        let currentDate = Date()
        
        // Clear the previous filtered notifications
        notificationFilter.indices.forEach { notificationFilter[$0].notifications.removeAll() }
        
        // Filter the notification models based on the filter type
        for notification in notificationModel {
            if let createdAtDate = createDateFromString(notification.notificationCreatAt) {
                let daysDifference = Calendar.current.dateComponents([.day], from: createdAtDate, to: currentDate).day ?? 0
                print("dayDifference----------\(daysDifference)")
                print("----------\(createdAtDate)")
                if daysDifference == 0 {
                    notificationFilter[0].notifications.append(notification) // "new" filter type
                } else if daysDifference > 0 && daysDifference < 8 {
                    notificationFilter[1].notifications.append(notification) // "last7days" filter type
                } else if daysDifference > 7 && daysDifference < 31 {
                    notificationFilter[2].notifications.append(notification) // "last30days" filter type
                } else if daysDifference > 30 {
                    notificationFilter[3].notifications.append(notification) // "order" filter type
                }
            }
        }
        
        tableView.reloadData()
    }
    
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let filterType = notificationFilter[section].filterType
        
        switch filterType {
        case "new":
            return !notificationFilter[section].notifications.isEmpty ? "New" : nil
        case "last7days":
            return !notificationFilter[section].notifications.isEmpty ? "Last 7 Days" : nil
        case "last30days":
            return !notificationFilter[section].notifications.isEmpty ? "Last 30 Days" : nil
        case "order":
            return !notificationFilter[section].notifications.isEmpty ? "Order" : nil
        default:
            return nil
        }
    }
    
}

extension NotificationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return notificationFilter.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationFilter[section].notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filterType = notificationFilter[indexPath.section].filterType
        let notifications = notificationFilter[indexPath.section].notifications
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationTableViewCell
        cell.config(with: notifications[indexPath.row])
        return cell
    }
}
