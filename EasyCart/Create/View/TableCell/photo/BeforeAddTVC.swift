//
//  BeforeAddTVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/6/23.
//

import UIKit
import Kingfisher

class BeforeAddTVC: UITableViewCell{

    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView?.register(UINib(nibName: "ButtonCVC", bundle: .none), forCellWithReuseIdentifier: "beforeUploadCell")
        collectionView?.register(UINib(nibName: "CollectionImageCVC", bundle: .none), forCellWithReuseIdentifier: "uploadImageCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension BeforeAddTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "beforeUploadCell", for: indexPath) as! ButtonCVC
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       return CGSize(width: 350, height: 80)
//    }
}
