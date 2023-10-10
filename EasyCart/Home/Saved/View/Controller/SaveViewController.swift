//
//  SaveViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 6/10/23.
//

import UIKit

class SaveViewController: UIViewController {

    var selectedSegmentIndex: Int = 0
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.barTintColor = .clear
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.9089183211, green: 0.9138903022, blue: 0.9224101901, alpha: 1)
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchBar.searchTextField.layer.cornerRadius = 9
        self.searchBar.searchTextField.clipsToBounds = true
        let font = UIFont.systemFont(ofSize: 16)
        let selectedFont = UIFont.boldSystemFont(ofSize: 16)
        let selectedFontAttributes = [NSAttributedString.Key.font: selectedFont, NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.437166661, green: 0.06278865784, blue: 0.8730230927, alpha: 1)]
        segment.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        segment.setTitleTextAttributes(selectedFontAttributes, for: .selected)
        segment.frame.size.height = 40
        segment.changeUnderlinePosition()
        addBottomBorder(to: view1)
        segment.addUnderlineForSelectedSegment()
    }
    func addBottomBorder(to view: UIView) {
          let border = CALayer()
          let borderWidth: CGFloat = 1.0
          border.borderColor = UIColor.gray.cgColor
          border.frame = CGRect(x: 0, y: view.frame.size.height - borderWidth, width: view.frame.size.width, height: borderWidth)
          border.borderWidth = borderWidth
          view.layer.addSublayer(border)
          view.layer.masksToBounds = true
      }
    @IBAction func mySegemt(_ sender: UISegmentedControl) {
        selectedSegmentIndex = sender.selectedSegmentIndex
            segment.changeUnderlinePosition()
        if view2.isHidden == true {
            view2.isHidden = false
        }else {
            view2.isHidden = true
        }
    }

}
extension UISegmentedControl{
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }

    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 8.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = #colorLiteral(red: 0.437166661, green: 0.06278865784, blue: 0.8730230927, alpha: 1)
        underline.tag = 1
        self.addSubview(underline)
    }

    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else { return }
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.2) {
            underline.frame.origin.x = underlineFinalXPosition
        }
    }
}

extension UIImage{

    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}
