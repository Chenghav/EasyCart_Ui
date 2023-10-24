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
    
    var modelsCategory = [CategoryFiel]()
    var modelsTitle = [Title]()
    var modelsPrice = [PriceFiel]()
    var modelsDiscount = [Discount]()
    var modelsExpand = [ListItemExpandable]()
    func didSelectCustomCell() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryVC") as? CategoryTC{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    var image: [UIImage] = []
    let pickerImage = UIImagePickerController()
    var isReloadCollection = false
    var isExpandable = false
    var sectionIndex = -1
    
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
        tableView.reloadData()
        
        modelsCategory.append(CategoryFiel(name: "Category"))
        modelsTitle.append(Title(name: "Tile", input: "Input"))
        modelsPrice.append(PriceFiel(name: "Price", input: "$0.00"))
        modelsDiscount.append(Discount(name: "Discount", input: "0%"))
        modelsExpand.append(ListItemExpandable( name: "More Detail", item: ["hsa"], isExpand: false))
        
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
            return modelsCategory.count + modelsTitle.count + modelsPrice.count + modelsDiscount.count + modelsExpand.count
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
            let currentIndex = indexPath.row
            if currentIndex < modelsCategory.count {
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "InfoTVC", for: indexPath) as! InfoTVC
                labelCel.configureInfoCate(with: modelsCategory[currentIndex])
                labelCel.selectionStyle = .none
                return labelCel
            } else if currentIndex < (modelsTitle.count + modelsCategory.count){
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "TitleTVC", for: indexPath) as! TitleTVC
                labelCel.configureTitle(with: modelsTitle[currentIndex - modelsCategory.count])
                labelCel.selectionStyle = .none
                return labelCel
            }else if currentIndex < (modelsPrice.count + modelsTitle.count + modelsCategory.count){
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "PriceTVC", for: indexPath) as! PriceTVC
                labelCel.configurePrice(with: modelsPrice[currentIndex - modelsCategory.count - modelsTitle.count])
                labelCel.selectionStyle = .none
                return labelCel
            }else if currentIndex < (modelsDiscount.count + modelsPrice.count + modelsTitle.count + modelsCategory.count){
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "DiscountTVC", for: indexPath) as! DiscountTVC
                labelCel.configureDiscout(with: modelsDiscount[currentIndex - modelsCategory.count - modelsTitle.count - modelsDiscount.count])
                labelCel.selectionStyle = .none
                return labelCel
            }else{
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "MoreDetailTVC", for: indexPath) as! MoreDetailTVC
                labelCel.selectionStyle = .none
                return labelCel
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
            if indexPath.row == modelsCategory.count + modelsTitle.count + modelsPrice.count {
                return 62
            }else{
                if indexPath.row == modelsCategory.count + modelsTitle.count + modelsPrice.count + modelsDiscount.count {
                    if modelsExpand[0].isExpand {
                        return 200
                    } else {
                        return 50
                    }
                } else {
                    return 50
                }
            }
        }else{
            return 167
        }
    }
    // MARK: - Expanable didSelectRowAt -
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == modelsCategory.count + modelsTitle.count + modelsPrice.count + modelsDiscount.count {
                // Toggle the expandable state
                modelsExpand[0].isExpand.toggle()
                // Reload the cell to apply the change
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    func reloadRow(header: ExpanableTVC, section: Int){
        
    }
}
 // MARK: - upload Image -
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
