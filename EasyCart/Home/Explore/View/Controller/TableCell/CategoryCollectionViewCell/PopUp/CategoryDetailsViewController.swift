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
    }
    
    @IBAction func btnClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CategoryDetailsViewController: UICollectionViewDelegate {
    
}

extension CategoryDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CategoryDetailsCollectionViewCell
        return collectionCell
    }
    
    
}
