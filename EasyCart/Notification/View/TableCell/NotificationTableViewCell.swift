import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationRec: UIView!
    @IBOutlet weak var notificationTitle: UILabel!
    @IBOutlet weak var notificatoinDesc: UILabel!
    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var notificatonCreateAt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        notificationRec.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(with notification: NotificationModel) {
        notificationTitle.text = notification.notificationTitle
        notificatoinDesc.text = notification.notificationDesc
        notificationImage.image = notification.notificatoinImage
        
        if let createdAtDate = convertToDate(notification.notificationCreatAt) {
            let hoursDifference = calculateHoursDifference(from: createdAtDate)
            
            if hoursDifference < 24 {
                let hoursString = formatHours(hoursDifference)
                notificatonCreateAt.text = hoursString
            } else {
                let dateString = formatDate(createdAtDate)
                notificatonCreateAt.text = dateString
            }
        } else {
            notificatonCreateAt.text = ""
        }
    }
    
    private func convertToDate(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter.date(from: dateString)
    }
    
    private func calculateHoursDifference(from date: Date) -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: date, to: currentDate)
        return components.hour ?? 0
    }
    
    private func formatHours(_ hours: Int) -> String {
        if hours < 1 {
            return "Just now"
        } else if hours == 1 {
            return "1 hour ago"
        } else {
            return "\(hours) hours ago"
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
    
    @IBAction func notificationPopUp(_ sender: Any) {
//        print("hello")
//        let storyboard = UIStoryboard(name: "Sheet", bundle: nil)
//        let sheetPresentController = storyboard.instantiateViewController(withIdentifier: "SheetViewController") as! SheetViewController
//        present(sheetPresentController, animated: true, completion: nil)
    }
    
}
