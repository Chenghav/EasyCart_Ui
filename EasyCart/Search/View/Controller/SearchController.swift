
import Foundation
import UIKit

enum SearchSection: Int, CaseIterable {
    case Recent
    case Popular
    case Category

    var title: String {
        switch self {
        case .Recent:
            return "Recent"
        case .Popular:
            return "Popular"
        case .Category:
            return "Category"
        }
    }
}
protocol RecentCollectionNibCellDelegate: AnyObject {
    func deleteRecentSearch(_ searchText: String)
}
class SearchController : UIViewController, RecentCollectionNibCellDelegate{
    var currentSearchText: String?
    var recentSearchQueries: [String] = []
    let sections: [SearchSection] = [.Recent, .Popular, .Category]
    var isSearching = false
    private let spacing:CGFloat = 16.0
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(UINib(nibName: "RecentCollectionNibCell", bundle: .none), forCellWithReuseIdentifier: "RecentCollectionNibCell")
        myCollectionView.register(UINib(nibName: "PopularNibCell", bundle: .none), forCellWithReuseIdentifier: "PopularNibCell")
        myCollectionView.register(UINib(nibName: "CategoryNibCell", bundle: .none), forCellWithReuseIdentifier: "CategoryNibCell")
        myCollectionView.register(UINib(nibName: "SectionCellNib", bundle: .none), forCellWithReuseIdentifier: "SectionCellNib")
        myCollectionView.register(UINib(nibName: "PopularSection", bundle: .none), forCellWithReuseIdentifier: "PopularSection")
        
        searchBar.delegate = self
        if let savedQueries = UserDefaults.standard.stringArray(forKey: "RecentSearchQueries") {
                   recentSearchQueries = savedQueries
               }
        searchBar?.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
                  self.searchBar?.searchTextField.clipsToBounds = true
//        let layout = UICollectionViewFlowLayout()
//               layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
//               layout.minimumLineSpacing = spacing
//               layout.minimumInteritemSpacing = spacing
//               self.myCollectionView?.collectionViewLayout = layout

        
        //        let layout = UICollectionViewFlowLayout()
        //                let itemSizewidth =  (UIScreen.main.bounds.width / 3 ) - 16
        //                layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        //                layout.itemSize = CGSize(width: itemSizewidth, height: itemSizewidth)
        //                layout.minimumInteritemSpacing = 0
        //                layout.minimumLineSpacing = 16
        //                myCollectionView.collectionViewLayout = layout
      
    }
}

// MARK:  - UICollectionViewDataSource -

extension SearchController : UICollectionViewDelegate, UICollectionViewDataSource,UISearchBarDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let searchSection = SearchSection(rawValue: section) {
            switch searchSection {
            case .Recent:
                return isSearching ? 0 : recentSearchQueries.count
            case .Popular:
                return isSearching ? 0 : 5
            case .Category:
                return isSearching ? 0 : 5
            }
        }
        return 0
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
     
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let searchSection = SearchSection(rawValue: indexPath.section) {
            switch searchSection {
            case .Recent:
               
                    let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "RecentCollectionNibCell", for: indexPath) as! RecentCollectionNibCell
                    cell.recentLb?.text = recentSearchQueries[indexPath.row]
                    cell.delegate = self
                    return cell
                
            case .Popular:
                let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "PopularNibCell", for: indexPath) as! PopularNibCell
                return cell
            case .Category:
                let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryNibCell", for: indexPath) as! CategoryNibCell
                
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearchText = searchText
            isSearching = !searchText.isEmpty
            myCollectionView.reloadData()

            }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = currentSearchText, !searchText.isEmpty {
            saveSearchQuery(searchText)
            currentSearchText = nil
        }
        searchBar.resignFirstResponder()
    }
    func saveSearchQuery(_ query: String) {
        if query.count > 1 {
            recentSearchQueries.insert(query, at: 0)
            if recentSearchQueries.count > 5 {
              recentSearchQueries.removeLast()
            }

            UserDefaults.standard.set(recentSearchQueries, forKey: "RecentSearchQueries")
          }
        }
    func deleteRecentSearch(_ searchText: String) {
        if let index = recentSearchQueries.firstIndex(of: searchText) {
              recentSearchQueries.remove(at: index)
              UserDefaults.standard.set(recentSearchQueries, forKey: "RecentSearchQueries")
              myCollectionView.reloadData()
          }
      }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
                if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerTitle", for: indexPath) as? SectionCellNib {
                            if isSearching {
                                sectionHeader.titleLb.isHidden = true
                                sectionHeader.btnSeeAll.isHidden = true
                            } else {
                                sectionHeader.titleLb.isHidden = false
                                sectionHeader.titleLb.text = "\(sections[indexPath.section])"
                                switch sections[indexPath.section] {
                                case .Recent:
                                    sectionHeader.btnSeeAll.isHidden = false
                                case .Popular, .Category:
                                    sectionHeader.btnSeeAll.isHidden = true
                                }
                            }
                            return sectionHeader
                        }
                        return UICollectionReusableView()
                    }
   
    
}

// MARK:  - UICollectionViewDelegateFlowLayout -

extension SearchController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let numberOfItemsPerRow:CGFloat = 4
//                let spacingBetweenCells:CGFloat = 16
//
//        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 4) * spacingBetweenCells) //Amount of total spacing in a row
//
//                if let collection = self.myCollectionView{
//                    let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
//                    return CGSize(width: width, height: width)
//                }else{
//                    return CGSize(width: 0, height: 0)
//                }

      let cellSpacing: CGFloat = 16
        if let searchSection = SearchSection(rawValue: indexPath.section) {

            switch searchSection {
            case .Recent:
                let cellWidth = view.bounds.width
                           return CGSize(width: cellWidth, height: 55)

            case .Popular:
                let availableWidth = (view.bounds.width - 47) / 3
                            return CGSize(width: availableWidth, height: 33)
            case .Category:

                let availableWidth = (view.bounds.width - 42) / 2
                          return CGSize(width: availableWidth, height: 55)


            }
        }
            return CGSize(width: (UIScreen.main.bounds.width), height: 55)

        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if let searchSection = SearchSection(rawValue: section) {
            
            switch searchSection {
            case .Recent:
                return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
               
            case .Popular:
                return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
             
            case .Category:
                return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
                
                
            }
        }
               return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
           }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5

    }
       
    
}
