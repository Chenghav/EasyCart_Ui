import UIKit

class HomeDetailCV: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var slider: [imagedata] = []
    var slider2: [imagedata] = []
    var itemdata: [itemData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        staticData()
        registerCustomCells()
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        // Reload or display the collection view
        collectionView.reloadData()
        //        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.collectionViewLayout = createCompositionalLayout()
        
    }
    
    
    // MARK: - Static Data -
    func staticData() {
        slider = [
            imagedata(imageview: #imageLiteral(resourceName: "iPhone")),
            imagedata(imageview: #imageLiteral(resourceName: "iPhone")),
            imagedata(imageview: #imageLiteral(resourceName: "iPhone"))
            
        ]
        
        slider2 = [
            imagedata(imageview: #imageLiteral(resourceName: "iPhone")),
            imagedata(imageview: #imageLiteral(resourceName: "iPhone")),
            imagedata(imageview: #imageLiteral(resourceName: "iPhone")),
            imagedata(imageview: #imageLiteral(resourceName: "iPhone")),
            imagedata(imageview: #imageLiteral(resourceName: "iPhone")),
            imagedata(imageview: #imageLiteral(resourceName: "iPhone"))
            
        ]
        
        itemdata = [
            itemData(id: "ID #123400", brand: "15Pro", price: "$1,750.00", discription: "iPhone 15 Pro Max 256gb (LL)", value: "$1,850.00", percent: "(10% off)")
        ]
    }
    
    // MARK: - Register Custom Cells -
    func registerCustomCells() {
        let slideCellNib = UINib(nibName: "SlideCollectionViewCell", bundle: nil)
        collectionView.register(slideCellNib, forCellWithReuseIdentifier: "slideCell")
        
        let slideCellNib2 = UINib(nibName: "SlideClickCVC", bundle: nil)
        collectionView.register(slideCellNib2, forCellWithReuseIdentifier: "slideCell2")
        
        let itemCellNib = UINib(nibName: "DateOfitemCollCell", bundle: nil)
        collectionView.register(itemCellNib, forCellWithReuseIdentifier: "itemCell")
        
        
    }
    
     func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            
            case 0 : return self.firstLayoutSection()
            case 1: return self.secondLayoutSection()
            case 2: return self.thirdLayoutSection()

            default: return nil
            }
        }
    }
    private func firstLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalWidth(0.5))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)
       
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private func secondLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(100))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 15, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 15
        

        
        
        return section
    }
    
    private func thirdLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalWidth(0.35))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)
       
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
}

// MARK: - UICollectionViewDataSource and UICollectionViewDelegate -
extension HomeDetailCV: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        
            case 0:
            return slider.count
            case 1:
            return itemdata.count
            default:
            return slider2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        if indexPath.row < slider.count {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "slideCell", for: indexPath) as! SlideCollectionViewCell
            let cellData1 = slider[indexPath.row]
            cell1.setImage(with: cellData1)
            cell = cell1
        } else if indexPath.row < slider.count + itemdata.count {
            let adjustedIndex = indexPath.row - slider.count
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! DateOfitemCollCell
            let cellData2 = itemdata[adjustedIndex]
            cell2.setItem(with2: cellData2)
            cell = cell2
        } else {
            let adjustedIndex = indexPath.row - slider.count - itemdata.count
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "slideCell2", for: indexPath) as! SlideClickCVC
            let cellData3 = slider2[adjustedIndex]
            cell3.setImage2(with: cellData3)
            cell = cell3
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row < slider.count {
            return CGSize(width: 390, height: 360)
        } else if indexPath.row < slider.count + itemdata.count {
            return CGSize(width: 388, height: 130)
        } else {
            return CGSize(width: 50, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
}



