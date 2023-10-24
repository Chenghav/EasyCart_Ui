//
//  SaveViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 6/10/23.
//

import UIKit

class SaveViewController: UIViewController{

    // MARK:  - Proterties -
    var datas = [Save]()

    // MARK:  - Outlets -
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK:  - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.barTintColor = .clear
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.9089183211, green: 0.9138903022, blue: 0.9224101901, alpha: 1)
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchBar.searchTextField.layer.cornerRadius = 9
        self.searchBar.searchTextField.clipsToBounds = true
        createBtn.layer.cornerRadius = 10

        datas = Saves

    }

    // MARK:  - Outlets Action -
    @IBAction func CreateButton(_ sender: Any) {
    }
 
}
