//
//  WriteReportTableViewCell.swift
//  EasyCart
//
//  Created by PVH_002 on 19/10/23.
//

import UIKit

class WriteReportTableViewCell: UITableViewCell, UITextViewDelegate  {


    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var writeReportRec: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        writeReportRec.layer.cornerRadius = 10
        textView.delegate = self
        textView.text = "Write suggestion/problem here"
        textView.textColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write suggestion/problem here"
            textView.textColor = UIColor.lightGray
        } else {
            textView.textColor = UIColor.black
        }
    }
}
