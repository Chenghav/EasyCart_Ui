//
//  SearchController.swift
//  Easycart
//
//  Created by KSG-USR on 5/10/23.
//

import Foundation
import UIKit
class SearchController : UIViewController{
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(UINib(nibName: "RecentCollectionNibCell", bundle: .none), forCellWithReuseIdentifier: "RecentCollectionNibCell")
      
    }
}
extension SearchController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "RecentCollectionNibCell", for: indexPath)
   
        return cell
    }
}
