//
//  CreateItemVC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/5/23.
//

import UIKit

protocol CreateItemViewDelegate {
    func toggleSection(for header: CreateItemVC)
}

class CreateItemVC: UIViewController, CustomCellDelegate{
    
    var models = [ListItemExpandable]()
    func didSelectCustomCell() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryVC") as? CategoryTC{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    var image: [UIImage] = []
    let pickerImage = UIImagePickerController()
    var isReloadCollection = false
    var hiddenSections = Set<Int>()
    
    func didTapCell(){
        print("success")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(InfoTVC.nib(), forCellReuseIdentifier: "InfoTVC")
        tableView.register(DiscountTVC.nib(), forCellReuseIdentifier: "DiscountTVC")
        tableView.register(UINib(nibName: "TitleTVC", bundle: .none), forCellReuseIdentifier: "TitleTVC")
        tableView.register(UINib(nibName: "PriceTVC", bundle: .none), forCellReuseIdentifier: "PriceTVC")
        tableView.register(UINib(nibName: "MoreDetailTVC", bundle: .none), forCellReuseIdentifier: "MoreDetailTVC")
        tableView.register(UINib(nibName: "ExpanableTVC", bundle: .none), forCellReuseIdentifier: "ExpandableTVC")
        
        tableView.delegate = self
        tableView.dataSource = self
        pickerImage.delegate = self
        
        models.append(ListItemExpandable( title: "Vehicle", subTitle: "Motor, car, truck, etc.", isExpand: false))
        models.append(ListItemExpandable( title: "Vehicle", subTitle: "Motor, car, truck, etc.", isExpand: false))
        models.append(ListItemExpandable( title: "Vehicle", subTitle: "Motor, car, truck, etc.", isExpand: false))
        models.append(ListItemExpandable( title: "Vehicle", subTitle: "Motor, car, truck, etc.", isExpand: false))
        models.append(ListItemExpandable( title: "Vehicle", subTitle: "Motor, car, truck, etc.", isExpand: false))
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

 // MARK: - UITableViewDelegate -
extension CreateItemVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 5
        }else if section == 2 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! CustomPhotoTVC
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
        }else if indexPath.section == 1{
            if indexPath.row == 0{
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "InfoTVC", for: indexPath) as! InfoTVC
                labelCel.delegate = self
                return labelCel
            }else if indexPath.row == 1 {
                let TitleCel = tableView.dequeueReusableCell(withIdentifier: "TitleTVC", for: indexPath) as! TitleTVC
                return TitleCel
            }else if indexPath.row == 2{
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "PriceTVC", for: indexPath) as! PriceTVC
                return labelCel
            }else if indexPath.row == 3{
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "DiscountTVC", for: indexPath) as! DiscountTVC
                return labelCel
            }else if indexPath.row == 4 {
//                let labelCel = tableView.dequeueReusableCell(withIdentifier: "MoreDetailTVC", for: indexPath) as! MoreDetailTVC
                
                if indexPath.row == 0 {
                    let labelCel = tableView.dequeueReusableCell(withIdentifier: "MoreDetailTVC", for: indexPath) as! MoreDetailTVC
                    return labelCel
                } else {
                    let ExpandCell = tableView.dequeueReusableCell(withIdentifier: "ExpandableTVC", for: indexPath) as! ExpanableTVC
                    ExpandCell.configureExpandable(with: models[indexPath.row])
                    return ExpandCell
                }
            }
        }else{
            let cellDesc = tableView.dequeueReusableCell(withIdentifier: "DescCell", for: indexPath)
            return cellDesc
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 147
        }else if indexPath.section == 1{
            if indexPath.row == 3 {
                return 62
            }else{
                return 50
            }
        }else{
            return 167
        }
    }
    // MARK: - Expanable didSelectRowAt -
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let section = indexPath.section

            var sectionData = models[section]
            sectionData.isExpand.toggle()
            models.remove(at: section)
            models.insert(sectionData, at: section)
            
            tableView.reloadSections(.init(integer: section), with: .automatic)
        }
    }
}

extension CreateItemVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
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

