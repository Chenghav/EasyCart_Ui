//
//  AddItemsViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 19/10/23.
//

import UIKit

class AddItemsViewController: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate {

    var data = [Add]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    @IBOutlet weak var addItemBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.barTintColor = .clear
        searchbar.searchTextField.backgroundColor = #colorLiteral(red: 0.9089183211, green: 0.9138903022, blue: 0.9224101901, alpha: 1)
        searchbar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchbar.searchTextField.layer.cornerRadius = 9
        self.searchbar.searchTextField.clipsToBounds = true
        collectionView.dataSource = self
        collectionView.delegate   = self
        addItemBtn.layer.cornerRadius = 10
        data = Adds
        collectionView.register(AddItemsCollectionViewCell.nib(), forCellWithReuseIdentifier: "AddItemsCollectionViewCell")
    }

    @IBAction func AddItemButton(_ sender: Any) {
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddItemsCollectionViewCell", for: indexPath) as! AddItemsCollectionViewCell
        cell.setUp(with: data[indexPath.row])
        cell.layer.cornerRadius = 10
        return cell
    }
}
