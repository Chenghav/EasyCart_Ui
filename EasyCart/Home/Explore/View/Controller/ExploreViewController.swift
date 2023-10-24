//
//  ExploreViewController.swift
//  Easycart
//
//  Created by PVH_002 on 4/10/23.
//

import UIKit

class ExploreViewController: UIViewController, CategoryDemovable {
    
    
    @IBOutlet weak var collectonView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        collectonView.delegate = self
        collectonView.dataSource = self
        collectonView.collectionViewLayout = UICollectionViewFlowLayout()
        collectonView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        tableView.register(UINib(nibName: "ExploreTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        
    }
    
    
    
}

extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Top items"
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        
        let font = UIFont.systemFont(ofSize: 16, weight: .semibold) // Adjust the font size and weight as needed
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.black
        ]
        let title = tableView.dataSource?.tableView?(tableView, titleForHeaderInSection: section) ?? ""
        let attributedString = NSAttributedString(string: title, attributes: attributes)
        headerView.textLabel?.attributedText = attributedString
    }
}

extension ExploreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topItemsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExploreTableViewCell
        cell.config(with: topItemsModel[indexPath.row])
        // clear selection color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        return cell
    }
}


extension ExploreViewController: UICollectionViewDelegate {
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        print("dfdfdf")
    //        ExploreViewController.self.openCategoryDetails(from: self, in: nil)
    //    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ExploreViewController.self.openCategoryDetails(from: self, in: nil)
    }
}

extension ExploreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CategoryCollectionViewCell
        collectionCell.config(with: categoryModel[indexPath.row])
        return collectionCell
    }
    
}

extension ExploreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 10, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = UIScreen.main.bounds.width - 42
        return CGSize(width: collectionViewWidth/2, height: 194/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
