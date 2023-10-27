//
//  ForPostViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 25/10/23.
//

import UIKit

class ForPostViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var datas = [More]()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var selectedData: Save?
    override func viewDidLoad() {
        super.viewDidLoad()
        datas = Mores
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.barTintColor = .clear
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.9089183211, green: 0.9138903022, blue: 0.9224101901, alpha: 1)
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchBar.searchTextField.layer.cornerRadius = 9
        self.searchBar.searchTextField.clipsToBounds = true
        collectionView.register(AddMoreCollectionViewCell.nib(), forCellWithReuseIdentifier: "AddMoreCollectionViewCell")
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if datas.isEmpty {
            return 1
        }
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if datas.isEmpty {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddMoreCollectionViewCell", for: indexPath) as! AddMoreCollectionViewCell
            cell.setUp(with: datas[indexPath.row])
            cell.layer.cornerRadius = 10
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if datas.isEmpty {
            return CGSize(width: collectionView.frame.width, height: 671)
        } else {
            return CGSize(width: collectionView.frame.width, height: 100)
        }
    }
}
