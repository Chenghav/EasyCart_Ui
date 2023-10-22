//
//  RecieptController.swift
//  EasyCart
//
//  Created by ksga on 18/10/23.
//

import Foundation
import UIKit
class RecieptController : UIViewController, UITableViewDelegate, UITableViewDataSource, ReceiptDemoable {
    var replceReceiptTitle: UILabel?
    var receiptImage: UIImage?
    
    @IBOutlet weak var receiptTitle: UILabel!
    @IBOutlet weak var tableReciept: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//               customView.backgroundColor = UIColor.white
//               view.addSubview(customView)
        tableReciept.delegate = self
        tableReciept.dataSource = self
        tableReciept.register(UINib(nibName: "ReceiptTableViewCell", bundle: .none), forCellReuseIdentifier: "ReceiptTableViewCell")
    }

    
    @IBAction func btnClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableReciept.dequeueReusableCell(withIdentifier: "ReceiptTableViewCell", for: indexPath) as! ReceiptTableViewCell
        cell.receiptSign.image = receiptImage
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 463
    }

}
