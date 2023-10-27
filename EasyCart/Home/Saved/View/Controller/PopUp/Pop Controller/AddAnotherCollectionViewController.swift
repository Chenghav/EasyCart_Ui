//
//  AddAnotherCollectionViewController.swift
//  EasyCart
//
//  Created by Ly Chenghav on 25/10/23.
//

import UIKit

class AddAnotherCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var data = [AddAnother]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate   = self
        collectionView.register(AddAnotherCollectionCollectionViewCell.nib(), forCellWithReuseIdentifier: "AddAnotherCollectionCollectionViewCell")
        let yourClass = YourClass()
        data = yourClass.AddAnothers
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddAnotherCollectionCollectionViewCell", for: indexPath) as! AddAnotherCollectionCollectionViewCell
        cell.setUp(with: data[indexPath.row])
        return cell
    }
    
}
