//
//  AllitemViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 10/10/23.
//

import UIKit
import CarbonKit

class AllitemViewController: UIViewController, CarbonTabSwipeNavigationDelegate  {


    var controllerNames = ["All", "Purchased", "Sold", "Selling"]
    var carbonSwapNavigation = CarbonTabSwipeNavigation()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        searchBar.barTintColor = .clear
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.9089183211, green: 0.9138903022, blue: 0.9224101901, alpha: 1)
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchBar.searchTextField.layer.cornerRadius = 9
        self.searchBar.searchTextField.clipsToBounds = true
        carbonSwapNavigation = CarbonTabSwipeNavigation(items: controllerNames, delegate: self)
        carbonSwapNavigation.pagesScrollView?.isScrollEnabled = true
        carbonSwapNavigation.insert(intoRootViewController: self)
        carbonSwapNavigation.carbonSegmentedControl?.backgroundColor = UIColor.white
        carbonSwapNavigation.setTabBarHeight(40)
        carbonSwapNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3 , forSegmentAt: 0)
        carbonSwapNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3 , forSegmentAt: 1)
        carbonSwapNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3 , forSegmentAt: 2)
        carbonSwapNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3 , forSegmentAt: 3)
        carbonSwapNavigation.setNormalColor(UIColor.black, font: UIFont.systemFont(ofSize: 19))
        carbonSwapNavigation.setSelectedColor(UIColor.purple, font: UIFont.systemFont(ofSize: 19, weight: .bold))
        carbonSwapNavigation.setIndicatorColor(UIColor.purple)
        carbonSwapNavigation.setIndicatorHeight(1)
        carbonSwapNavigation.view.translatesAutoresizingMaskIntoConstraints = false
        print("Hello")
        NSLayoutConstraint.activate([
            carbonSwapNavigation.view.topAnchor.constraint(equalTo: searchBar.topAnchor, constant: 60),
            carbonSwapNavigation.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carbonSwapNavigation.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carbonSwapNavigation.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        guard let storyboard = storyboard else {
            return UIViewController()
        }
        if index == 0 {
            return storyboard.instantiateViewController(withIdentifier: "CollectionViewController")
        }
     return UIViewController()
    }
    
    
}
