//
//  SellerInfoTBC.swift
//  EasyCart
//
//  Created by Hen Ty on 22/10/23.
//

import UIKit

class SellerInfoTBC: UITableViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var sellername: UILabel!
    @IBOutlet weak var sellernickname: UILabel!
    @IBOutlet weak var tel: UIButton!
    @IBOutlet weak var profile: UIImageView!
    var sellerInfo: SellerInfoModel? // Assuming you want a single SellerInfo, not an array

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setUpInfo(with info: SellerInfoModel) {
        sellername.text = info.username
        sellernickname.text = info.email

        // Use setTitle to set the title text for the button
        tel.setTitle(info.phoneNumber, for: .normal)

        profile.image = info.photoProfile
    }
    
    @IBAction func callButtonClicked(_ sender: Any) {
           if let phoneNumber = sellerInfo?.phoneNumber, let phoneURL = URL(string: "tel:\(phoneNumber)") {
               if UIApplication.shared.canOpenURL(phoneURL) {
                   UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
               } else {
                   // Handle the case where the device can't make phone calls, e.g., show an alert.
                   // For example:
                   let alertController = UIAlertController(title: "Phone Call Not Supported", message: "Your device doesn't support phone calls.", preferredStyle: .alert)
                   alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   // Make sure to present the alert from a view controller
                   // For example, if this cell is in a table view, you can use the following code to find the parent view controller:
                   // if let viewController = self.firstAvailableViewController() {
                   //     viewController.present(alertController, animated: true, completion: nil)
                   // }
               }
           }
       }

       // Function to find the parent view controller for presenting the alert
       private func firstAvailableViewController() -> UIViewController? {
           var responder: UIResponder? = self
           while responder != nil {
               if let viewController = responder as? UIViewController {
                   return viewController
               }
               responder = responder?.next
           }
           return nil
       }
}

