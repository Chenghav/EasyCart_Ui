//
//  HomeViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 4/10/23.
//

import UIKit
class HomeViewController: UIViewController {

   
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var image: UIBarButtonItem!
    @IBOutlet weak var layoutToChange: UIBarButtonItem!
    
    @IBOutlet weak var testBtn: UIButton!
    var isChangeBtn = false
    var selectedSegmentIndex: Int = 0
    var previouslySelectedSegmentIndex: Int = 0
    let bottomBorderView = UIView()
    var isImageSelected = true
    let userDefaultsKey = "isImageSelected"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        let clearImage = createClearImage(size: CGSize(width: 1, height: 1))
               segment.setDividerImage(clearImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
               segment.setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
               segment.setBackgroundImage(clearImage, for: .selected, barMetrics: .default)
        let font = UIFont.boldSystemFont(ofSize: 19.0)
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        ]
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
                   .font: font,
                   .foregroundColor: UIColor.black
               ]
        segment.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        segment.setTitleTextAttributes(textAttributes, for: .normal)

        bottomBorderView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
                let yPosition = segment.frame.origin.y + segment.frame.size.height - 1
                bottomBorderView.frame = CGRect(x: 0, y: yPosition, width: segment.frame.size.width, height: 1)
                view.addSubview(bottomBorderView)
        addBottomBorder(to: 0)
        let isImageSelected = UserDefaults.standard.bool(forKey: userDefaultsKey)
                
                layoutToChange.image = isImageSelected ? UIImage(named: "ico_grid") : UIImage(named: "ico_list")
    }
    func createClearImage(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let clearImage = renderer.image { _ in
            UIColor.clear.setFill()
            UIRectFill(CGRect(origin: .zero, size: size))
        }
        return clearImage
    }
    func addBottomBorder(to segmentIndex: Int) {
        let segmentWidth = segment.bounds.width / CGFloat(segment.numberOfSegments)
        let xPosition = segmentWidth * CGFloat(segmentIndex)
        let yPosition = segment.frame.origin.y + segment.frame.size.height - 1

        let borderView = UIView()
        borderView.backgroundColor = #colorLiteral(red: 0.437166661, green: 0.06278865784, blue: 0.8730230927, alpha: 1)
        borderView.frame = CGRect(x: xPosition, y: yPosition, width: segmentWidth, height: 1)
        borderView.tag = 123
        view.addSubview(borderView)
    }

    func removeBottomBorder(from segmentIndex: Int) {
        for subview in view.subviews {
            if subview is UIView && subview.tag == 123 {
                subview.removeFromSuperview()
            }
        }
    }

    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        let newlySelectedSegmentIndex = sender.selectedSegmentIndex

           if newlySelectedSegmentIndex != previouslySelectedSegmentIndex {
               removeBottomBorder(from: previouslySelectedSegmentIndex)
           }
           addBottomBorder(to: newlySelectedSegmentIndex)
           previouslySelectedSegmentIndex = newlySelectedSegmentIndex
    }
    @IBAction func layoutChange(_ sender: Any) {
        let isImageSelected = !UserDefaults.standard.bool(forKey: userDefaultsKey)
               
               UserDefaults.standard.set(isImageSelected, forKey: userDefaultsKey)

               layoutToChange.image = isImageSelected ? UIImage(named: "ico_grid") : UIImage(named: "ico_list")
        
          }
    }
    
    
