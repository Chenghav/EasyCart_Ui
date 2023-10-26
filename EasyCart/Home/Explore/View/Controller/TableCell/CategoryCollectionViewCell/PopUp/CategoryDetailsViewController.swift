//
//  CategoryDetailsViewController.swift
//  EasyCart
//
//  Created by KOSIGN Imac on 24/10/23.
//

import UIKit

class CategoryDetailsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar?.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
                  self.searchBar?.searchTextField.clipsToBounds = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (collectionView.frame.size.width - 8 * 3) / 2, height: 203)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 16, right: 4)
        collectionView.collectionViewLayout = layout
    }
    
    @IBAction func btnClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CategoryDetailsViewController: UICollectionViewDelegate {
    
}

extension CategoryDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topItemsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CategoryDetailsCollectionViewCell
//        collectionCell.config(with: categoryDetails[indexPath.row])
        collectionCell.config(with: topItemsModel[indexPath.row])
        
        return collectionCell
    }
    
    
}

//extension CategoryDetailsViewController: UICollectionViewDelegateFlowLayout {
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
////        return UIEdgeInsets(top: 16, left: 16, bottom: 10, right: 16)
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let collectionViewWidth = UIScreen.main.bounds.width - 42
////        return CGSize(width: collectionViewWidth/2, height: 203)
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////        return 10
////    }
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        return 10
////    }
//
//}
