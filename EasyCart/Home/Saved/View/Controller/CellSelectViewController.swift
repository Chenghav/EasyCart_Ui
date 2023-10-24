//
//  CellSelectViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 18/10/23.
//

import UIKit

class CellSelectViewController: UIViewController, PopUp, UICollectionViewDataSource, UICollectionViewDelegate{


    var datas = [More]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var AddMoreBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedData: Save?
    var isFirstCellSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        datas = Mores
        searchBar.barTintColor = .clear
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.9089183211, green: 0.9138903022, blue: 0.9224101901, alpha: 1)
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchBar.searchTextField.layer.cornerRadius = 9
        self.searchBar.searchTextField.clipsToBounds = true
        collectionView.register(AddMoreCollectionViewCell.nib(), forCellWithReuseIdentifier: "AddMoreCollectionViewCell")
        if let selectedData = selectedData {
        title = selectedData.Title
        AddMoreBtn.layer.cornerRadius = 10
        AddMoreBtn.isHidden = isFirstCellSelected
        if isFirstCellSelected {
                navigationItem.rightBarButtonItem = nil
            }
        }
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
      
    @IBAction func moreBtn(_ sender: Any) {
        CellSelectViewController.Pop(from: self, in: nil)
    }
    
    @IBAction func AddMoreButton(_ sender: Any) {
        if let addItemsVC = storyboard?.instantiateViewController(withIdentifier: "AddItemsViewController") as? AddItemsViewController {
            addItemsVC.title = selectedData?.Title
            navigationController?.pushViewController(addItemsVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddMoreCollectionViewCell", for: indexPath) as! AddMoreCollectionViewCell
        cell.setUp(with: datas[indexPath.row])
        cell.layer.cornerRadius = 10
        return cell
    }
    
}
