//
//  TabMainViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 4/10/23.
//

import UIKit

class TabMainViewController: UITabBarController {
  
    // MARK:  - Outlet -
    @IBOutlet weak var myTabBar: CustomTabBar!
    
    // MARK:  - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate      = self
        self.selectedIndex = 0
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        myTabBar.addTopBorderIfNeeded()
    }
}

// MARK:  - UITabBarControllerDelegate -
extension TabMainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
            myTabBar.updateBorderViewFrame(index: index, totalItems: tabBarController.viewControllers?.count ?? 1)
        }
    }
}

