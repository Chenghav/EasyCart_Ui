//
//  UploadPhotoTableViewCell.swift
//  EasyCart
//
//  Created by PVH_002 on 19/10/23.
//

import UIKit

class UploadPhotoTableViewCell: UITableViewCell {

    var imagePicker: Completion = {}
    var photo : [UIImage] = []
    let picker = UIImagePickerController()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var uploadImageRec: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        uploadImageRec.layer.cornerRadius = 10
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

extension UploadPhotoTableViewCell: UICollectionViewDelegate {
    
}

extension UploadPhotoTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photo.count == 0{
            return 1
        }else{
            return photo.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if photo.count > 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "uploadImageCell", for: indexPath) as! AttachmentCollectionViewCell
            
            cell.imagepicker = {
                self.imagePicker()
            }
            if indexPath.item == photo.count - 1{
                cell.imageView.isHidden = true
                cell.btnAddImages.isHidden = false
            }else{
                cell.imageView.isHidden = false
                cell.btnAddImages.isHidden = true
            }
            cell.imageView.image = photo[indexPath.row]
            collectionView.isScrollEnabled = true
            collectionView.showsHorizontalScrollIndicator = false
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "beforeUploadCell", for: indexPath) as! AttachmentButton
            cell.imagePicker = {
                self.imagePicker()
            }
            collectionView.isScrollEnabled = false
            return cell
        }
    }
    
}

extension UploadPhotoTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if photo.count == 0{
            return CGSize(width: collectionView.frame.size.width, height: (collectionView.frame.size.width))
        }else{
            return CGSize(width: collectionView.frame.size.width / 4 , height: (collectionView.frame.size.width))
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
