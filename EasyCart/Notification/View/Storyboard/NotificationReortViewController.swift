//
//  NotificationReortViewController.swift
//  EasyCart
//
//  Created by PVH_002 on 18/10/23.
//

import UIKit

class 	NotificationReortViewController: UIViewController {
    
    var image: [UIImage] = []
    let pickerImage = UIImagePickerController()
    var isReloadCollection = false
    
    func didTapCell(){
        print("success")
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        pickerImage.delegate = self
        
    }
    
    @IBAction func btnClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnUploadScreenShot(_ sender: Any) {
        self.pickerImage.allowsEditing = false
        self.pickerImage.sourceType = .photoLibrary
        self.pickerImage.delegate = self
        self.present(self.pickerImage, animated: true, completion: nil)
        print("---\(pickerImage)")
    }
    
}

extension NotificationReortViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 175
        } else {
            return 255
            
        }
        
    }
}

extension NotificationReortViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WriteREeportCell", for: indexPath) as! WriteReportTableViewCell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UploadPhotoCell", for: indexPath) as! UploadPhotoTableViewCell
            cell.photo = image
            if self.isReloadCollection{
                cell.ReloadCollection(isReloadCollection: self.isReloadCollection)
                self.isReloadCollection = false
            }
            
            cell.imagePicker = {
                self.pickerImage.allowsEditing = false
                self.pickerImage.sourceType = .photoLibrary
                self.pickerImage.delegate = self
                self.present(self.pickerImage, animated: true, completion: nil)
                
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension NotificationReortViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
            if image.count == 0{
                image.append(selectedImage)
                image.append(selectedImage)
            }else{
                image.insert(selectedImage, at: image.count - 1)
            }
            
            dismiss(animated: true)
            self.isReloadCollection = true
            tableView.reloadData()
        }
    }
}
