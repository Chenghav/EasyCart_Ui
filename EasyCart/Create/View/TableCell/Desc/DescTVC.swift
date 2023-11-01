//
//  DescTVC.swift
//  EasyCart
//
//  Created by Lamo Nin on 11/1/23.
//

import UIKit
class DescTVC: UITableViewCell {
    @IBOutlet weak var descInput: UITextView!
    
    // Placeholder label
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Describe your product: Condition, Brand, Type, Size, Color, etc."
        label.textColor = UIColor.lightGray
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialize and add the placeholder label
        descInput.addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.leadingAnchor.constraint(equalTo: descInput.leadingAnchor, constant: 5).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: descInput.topAnchor, constant: 8).isActive = true
        placeholderLabel.isHidden = !descInput.text.isEmpty

        // Configure the UITextView delegate
        descInput.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension DescTVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
        let contentSize = textView.contentSize
        let contentHeight = contentSize.height
        textView.constraints.filter { $0.firstAttribute == .height }.forEach { $0.constant = contentHeight }
    }
}
