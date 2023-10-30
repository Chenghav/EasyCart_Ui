//
//  CollectionViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 5/10/23.
//

import UIKit



class CollectionViewController: UIViewController{

    // MARK:  - Properties -
    var toggleItem : Bool   = true
    var owner : HomeViewController?
    
    // MARK:  - Outlet -
    @IBOutlet weak var collectionView: UICollectionView!
    

    // MARK:  - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate   = self
        collectionView.register(UINib(nibName: "CutomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CutomCollectionViewCell")
        NotificationCenter.default.addObserver(self, selector: #selector(LayoutActionChange(_:)), name: Notification.Name(rawValue: "layoutChange"), object: nil)
    }
    
    @objc func LayoutActionChange(_ notiIfo: NSNotification){
            let toggle = notiIfo.userInfo?["layoutChange"] as? Bool
            toggleItem = toggle ?? true
            self.collectionView.reloadData()
        }

    func toggleCellLayout() {
        owner?.isCustomCellVisible.toggle()
        collectionView.reloadData()
        }
    }

// MARK:  - UICollectionViewDelegateFlowLayout -
extension CollectionViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if toggleItem {
            return CGSize(width: UIScreen.main.bounds.width / 2.3, height: 220)
        }else {
            return CGSize(width: UIScreen.main.bounds.width / 1.1, height: 130)
        }
    }
}
// MARK:  - UICollectionViewDataSource -
extension CollectionViewController:  UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Collections.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if toggleItem {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
                   cell.setUp(with: Collections[indexPath.row])
                cell.layer.cornerRadius = 15.0
                cell.layer.borderWidth  = 1
                cell.layer.borderColor  = #colorLiteral(red: 0.8579366803, green: 0.8629106879, blue: 0.9100468755, alpha: 1)
                cell.clipsToBounds      = true
                cell.backgroundColor    = .white
                   return cell
               } else {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CutomCollectionViewCell", for: indexPath) as!  CutomCollectionViewCell
                   cell.config(with: Collections[indexPath.row])
                   cell.layer.cornerRadius = 15.0
                   cell.layer.borderWidth  = 1
                   cell.layer.borderColor  = #colorLiteral(red: 0.8579366803, green: 0.8629106879, blue: 0.9100468755, alpha: 1)
                   cell.clipsToBounds      = true
                   cell.backgroundColor    = .white
                   return cell
               }
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SentTo", sender: self)
print("Hrloooo")
    }
}

