//
//  CategoryDetailsViewController.swift
//  EasyCart
//
//  Created by KOSIGN Imac on 24/10/23.
//

import UIKit

class CategoryDetailsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (collectionView.frame.size.width - 8 * 3) / 2, height: 203)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 16, right: 4)
        //                layout.minimumInteritemSpacing = 8
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
        return categoryModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CategoryDetailsCollectionViewCell
        return collectionCell
    }
    
    
}
extension CategoryDetailsViewController: UICollectionViewDelegateFlowLayout {
    
}
