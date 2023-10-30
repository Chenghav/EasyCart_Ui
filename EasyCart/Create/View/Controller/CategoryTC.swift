//
//  CategoryTC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/9/23.
//

import UIKit

class CategoryTC: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    
    var models = CategoriesVM()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.register(CategoryTVC.self, forCellReuseIdentifier: "CategoryTVC")
        
        models.initData()
    }

}

extension CategoryTC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.categoryCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = models.categoryCell[indexPath.row].value as! CategoryData
        switch data.rowType {
        case .CategotySelec:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTVC", for: indexPath) as! CategoryTVC
            cell.configure(with: data)
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 79
    }
}
