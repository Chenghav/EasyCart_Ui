//
//  CustomPhotoTVC.swift
//  EasyCart
//
//  Created by Lamo Nin on 10/17/23.
//

import UIKit

class CustomPhotoTVC: UITableViewCell {
    
    var imagePicker: Completion = {}
    var photo : [UIImage] = []
    let picker = UIImagePickerController()
    var popUpDiscard: DeleteImage = {}

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func ReloadCollection(isReloadCollection: Bool){
        if isReloadCollection{
            collectionView.reloadData()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension CustomPhotoTVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if photo.count > 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "uploadImageCell", for: indexPath) as! CollectionImageCVC
            cell.imagepicker = {
                self.imagePicker()
            }
            if indexPath.item == photo.count - 1 {
                cell.uiImage.isHidden = true
                cell.btnAddImage.isHidden = false
            }else{
                cell.uiImage.isHidden = false
                cell.btnAddImage.isHidden = true
            }
            cell.uiImage.image = photo[indexPath.row]
            collectionView.isScrollEnabled = true
            collectionView.showsHorizontalScrollIndicator = false
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "beforeUploadCell", for: indexPath) as! ButtonCVC
            cell.imagePicker = {
                self.imagePicker()
            }
            collectionView.isScrollEnabled = false
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photo.count == 0{
            return 1
        }else{
            return photo.count
        }
    }
}

extension CustomPhotoTVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if photo.count == 0{
            return CGSize(width: collectionView.frame.size.width, height: 80)
        }else{
            return CGSize(width: (collectionView.frame.size.width / 3) , height: 80)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

