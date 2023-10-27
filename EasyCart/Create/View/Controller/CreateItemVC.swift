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

class CreateItemVC: UIViewController, CustomCellDelegate, PopUpDiscard{
    
    let nameLabel = UILabel()
    let detailLabel = UILabel()
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
    var createItemVM = CreateItemVM()
    var currentlySelectedCellIndexPath: IndexPath?
    var didCollapse : Bool?
    var indexPathDiselect : IndexPath?
    
    func didTapCell(){
        print("success")
    }
    
    func didSelectCollectionCell(){
        CreateItemVC.openDemo(from: self, in: nil)
    }
    
    @objc func didCollapeCell(_ sender: UIButton) {
        
        let point        = sender.convert(CGPoint.zero, to: self.tableView)
          let indexPath    = self.tableView.indexPathForRow(at: point)!
          if let currentlySelectedCellIndexPath = currentlySelectedCellIndexPath {
              // unselect the selected one
              makeCellUnSelected(in: tableView, on: currentlySelectedCellIndexPath)
              guard currentlySelectedCellIndexPath != indexPathDiselect else {
                  tableView.deselectRow(at: currentlySelectedCellIndexPath , animated: true)
                  self.currentlySelectedCellIndexPath = nil
                  if let cell = self.tableView.cellForRow(at: indexPath) as? MoreDetailTVC {
                      cell.expandbtn.setImage(UIImage(named: "up"), for: .normal)
                  }
                  return
              }
          }
        if let cell = self.tableView.cellForRow(at: indexPath) as? MoreDetailTVC {
            cell.expandbtn.setImage(UIImage(named: "down"), for: .normal)
          }
          
          // Highlight the proper cell
          makeCellSelected(in: tableView, on: indexPathDiselect ?? IndexPath())
          currentlySelectedCellIndexPath = indexPathDiselect
        tableView.reloadSections(IndexSet(integer: Rowtype.MoreDetails.rawValue), with: .none)

        print("tappp")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(InfoTVC.nib(), forCellReuseIdentifier: "InfoTVC")
        tableView.register(DiscountTVC.nib(), forCellReuseIdentifier: "DiscountTVC")
        tableView.register(UINib(nibName: "TitleTVC", bundle: nil), forCellReuseIdentifier: "TitleTVC")
        tableView.register(UINib(nibName: "PriceTVC", bundle: nil), forCellReuseIdentifier: "PriceTVC")
        tableView.register(UINib(nibName: "MoreDetailTVC", bundle: nil), forCellReuseIdentifier: "MoreDetailTVC")
        tableView.register(UINib(nibName: "ExpanableTVC", bundle: nil), forCellReuseIdentifier: "ExpanableTVC")
        createItemVM.initData()
        tableView.delegate = self
        tableView.dataSource = self
        pickerImage.delegate = self
        tableView.reloadData()
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
        }else if section == 1{
            return createItemVM.itemCell.count
        }
        else{
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
            
            let data = createItemVM.itemCell[indexPath.row].value as! CreateItemInfo
            switch data.rowType{
            case .Categories:
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "InfoTVC", for: indexPath) as! InfoTVC
                labelCel.selectionStyle = .none
                return labelCel
            case .Titles:
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "TitleTVC", for: indexPath) as! TitleTVC
                labelCel.selectionStyle = .none
                return labelCel
            case .Price:
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "PriceTVC", for: indexPath) as! PriceTVC
                labelCel.selectionStyle = .none
                return labelCel
            case .Discounts:
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "DiscountTVC", for: indexPath) as! DiscountTVC
                labelCel.selectionStyle = .none
                return labelCel
            case .MoreDetails:
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "MoreDetailTVC", for: indexPath) as! MoreDetailTVC
                labelCel.selectionStyle = .none
                labelCel.configureMoreDetail(with: data)
                labelCel.expandbtn.addTarget(self, action: #selector(didCollapeCell), for: .touchUpInside)
                self.indexPathDiselect = indexPath
                return labelCel
            case .CategoryMoreDetail:
                let labelCel = tableView.dequeueReusableCell(withIdentifier: "ExpanableTVC", for: indexPath) as! ExpanableTVC
                labelCel.selectionStyle = .none
                labelCel.configureExpandable(with: data)
                return labelCel
            }
        }else{
            let cellDesc = tableView.dequeueReusableCell(withIdentifier: "DescCell", for: indexPath)
            return cellDesc
        }
        return UITableViewCell()
    }
    
    func makeCellUnSelected(in tableView: UITableView, on indexPath: IndexPath) {
        didCollapse = false
        tableView.reloadSections(IndexSet(integer: Rowtype.MoreDetails.rawValue), with: .none)
    }
    func makeCellSelected(in tableView: UITableView, on indexPath: IndexPath) {
        didCollapse = true
        tableView.reloadSections(IndexSet(integer: Rowtype.MoreDetails.rawValue), with: .none)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 147
        }else if indexPath.section == 1{
            if indexPath.row  == 3{
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
        if let currentlySelectedCellIndexPath = currentlySelectedCellIndexPath {
            // unselect the selected one
            makeCellUnSelected(in: tableView, on: currentlySelectedCellIndexPath)
            guard currentlySelectedCellIndexPath != indexPath  else {
                tableView.deselectRow(at: currentlySelectedCellIndexPath , animated: true)
                self.currentlySelectedCellIndexPath = nil
                return
            }
        }
        
        // Highlight the proper cell
        makeCellSelected(in: tableView, on: indexPath)
        currentlySelectedCellIndexPath = indexPath
        tableView.reloadSections(IndexSet(integer: Rowtype.MoreDetails.rawValue), with: .none)
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
