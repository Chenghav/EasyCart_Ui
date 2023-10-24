//
//  SaveViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 6/10/23.
//

import UIKit

class SaveViewController: UIViewController{

    // MARK:  - Proterties -
    var datas = [Save]()

    // MARK:  - Outlets -
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK:  - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.barTintColor = .clear
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.9089183211, green: 0.9138903022, blue: 0.9224101901, alpha: 1)
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchBar.searchTextField.layer.cornerRadius = 9
        self.searchBar.searchTextField.clipsToBounds = true
        createBtn.layer.cornerRadius = 10
        collectionView.dataSource = self
        collectionView.delegate = self
        datas = Saves
        collectionView.register(SaveCollectionViewCell.nib(), forCellWithReuseIdentifier: "SaveCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .vertical
                layout.itemSize = CGSize(width: (collectionView.frame.size.width - 8 * 3) / 2, height: 203)
                layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 16, right: 4)
//                layout.minimumInteritemSpacing = 8
                collectionView.collectionViewLayout = layout
    }

    // MARK:  - Outlets Action -
    @IBAction func CreateButton(_ sender: Any) {
    }
 
}

extension SaveViewController : UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SaveCollectionViewCell", for: indexPath) as! SaveCollectionViewCell
        cell.setUp(with: datas[indexPath.row])
        if indexPath.row == 0 {
            return cell
        }else {
            cell.stack2.isHidden = true
            cell.image2.isHidden = true
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let nextController = storyboard?.instantiateViewController(identifier: "CellSelectViewController") as? CellSelectViewController {
            nextController.selectedData = datas[indexPath.row]
            nextController.isFirstCellSelected = indexPath.row == 0

            navigationController?.pushViewController(nextController, animated: true)
        }
    }

    
}
