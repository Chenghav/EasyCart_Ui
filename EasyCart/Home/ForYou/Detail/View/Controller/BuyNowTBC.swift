import UIKit

class BuyNowTBC: UITableViewCell {
    
    @IBOutlet weak var buy: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func SavebtnClick(_ sender: Any) {
        // Call the saveMessage function when the Save button is clicked
        saveMessage(message: "Item Saved", iconName: "tick")
    }
    
    func saveMessage(message: String, iconName: String) {
        // Create a container view for the toast message
        let toastLabel = UIView()
        toastLabel.backgroundColor = UIColor(white: 0, alpha: 0.6)
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        toastLabel.alpha = 1.0
        
        // Create the icon view
        let iconView = UIImageView()
        iconView.image = UIImage(named: iconName)
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.addSubview(iconView)
        
        // Create the label inside the container view
        let label = UILabel()
        label.text = message
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.addSubview(label)
        
        // Add the container view to the parent view
        self.addSubview(toastLabel)
        
        // Apply constraints for the container view
        toastLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        toastLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        toastLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40).isActive = true
        toastLabel.heightAnchor.constraint(equalToConstant: 75.0).isActive = true
        
        // Apply constraints for the icon view
        iconView.leadingAnchor.constraint(equalTo: toastLabel.leadingAnchor, constant: 10).isActive = true
        iconView.centerYAnchor.constraint(equalTo: toastLabel.centerYAnchor).isActive = true
        iconView.heightAnchor.constraint(equalTo: toastLabel.heightAnchor, multiplier: 0.5).isActive = true
        iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor).isActive = true
        
        // Apply constraints for the label
        label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: toastLabel.trailingAnchor, constant: -10).isActive = true
        label.topAnchor.constraint(equalTo: toastLabel.topAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: toastLabel.bottomAnchor, constant: -10).isActive = true
        
        // Animate the toast message
        UIView.animate(withDuration: 1.5, animations: {
            toastLabel.frame.origin.y = 40
        }, completion: { _ in
            UIView.animate(withDuration: 1.0, delay: 1.0, animations: {
                toastLabel.frame.origin.y = -80
            }, completion: { finished in
                print("Completed animation")
                toastLabel.removeFromSuperview()
            })
        }
        )
    }
    
}
