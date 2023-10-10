//
//  HomeViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 4/10/23.
//

import UIKit
import CarbonKit

class HomeViewController: UIViewController, CarbonTabSwipeNavigationDelegate {
    let exploreStoryboard = UIStoryboard(name: "Explore", bundle: Bundle(identifier: "ExploreViewController"))
    var controllerName = ["For you", "Explore", "Saved"]
    var carbonSwapNavigation = CarbonTabSwipeNavigation()
    
    @IBOutlet weak var layoutToChange: UIBarButtonItem!
    
    var isChangeBtn = false
    var selectedSegmentIndex: Int = 0
    var previouslySelectedSegmentIndex: Int = 0
    let bottomBorderView = UIView()
    var isImageSelected = true
    let userDefaultsKey = "isImageSelected"
    var currentViewController: UIViewController?
    var currentViewControllerIndex: UInt = 0
    var isCollectionViewControllerVisible = true
    var isCustomCellVisible = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        carbonSwapNavigation = CarbonTabSwipeNavigation(items: controllerName, delegate: self)
        carbonSwapNavigation.insert(intoRootViewController: self)
        carbonSwapNavigation.carbonSegmentedControl?.backgroundColor = UIColor.white
        carbonSwapNavigation.setTabBarHeight(40)
        carbonSwapNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3 , forSegmentAt: 0)
        carbonSwapNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3 , forSegmentAt: 1)
        carbonSwapNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3 , forSegmentAt: 2)
        carbonSwapNavigation.setNormalColor(UIColor.black, font: UIFont.systemFont(ofSize: 19))
        carbonSwapNavigation.setSelectedColor(UIColor.purple, font: UIFont.systemFont(ofSize: 19, weight: .bold))
        carbonSwapNavigation.setIndicatorColor(UIColor.purple)
        carbonSwapNavigation.setIndicatorHeight(1)
        layoutToChange.image = isImageSelected ? UIImage(named: "4Grid") : UIImage(named: "ico_list")
        
    }
    
    @IBAction func layoutChange(_ sender: Any) {
        let isImageSelected = !UserDefaults.standard.bool(forKey: userDefaultsKey)
        UserDefaults.standard.set(isImageSelected, forKey: userDefaultsKey)
        layoutToChange.image = isImageSelected ? UIImage(named: "4Grid") : UIImage(named: "ico_list")
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "layoutChange"), object: nil,userInfo: ["layoutChange" : isCustomCellVisible])
        
        isCustomCellVisible.toggle()
            if let collectionViewController = currentViewController as? CollectionViewController {
                collectionViewController.toggleCellLayout()
            }
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        guard let storyboard = storyboard else {
            return UIViewController()
        }
        if index == 0 {
            return storyboard.instantiateViewController(withIdentifier: "CollectionViewController")
        } else if index == 1 {
            return exploreStoryboard.instantiateViewController(withIdentifier: "ExploreViewController")
        }
        else if index == 2 {
            return storyboard.instantiateViewController(withIdentifier: "SaveViewController")
        } else {
            return storyboard.instantiateViewController(withIdentifier: "SaveViewController")
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        layoutToChange.image = UserDefaults.standard.bool(forKey: userDefaultsKey) ? UIImage(named: "4Grid") : UIImage(named: "ico_list")
      }
}


    
