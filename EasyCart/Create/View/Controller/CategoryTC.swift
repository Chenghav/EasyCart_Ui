//
//  CategoryTC.swift
//  Easycart
//
//  Created by Lamo Nin on 10/9/23.
//

import UIKit

class CategoryTC: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    
    var models = [CategoryData]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        models.append(CategoryData(image: UIImage(named: "ico_drinks")!, title: "Vehicle", desc: "Motor, car, truck, etc."))
        models.append(CategoryData(image: UIImage(named: "icon")!, title: "Vehicle", desc: "Motor, car, truck, etc."))
        models.append(CategoryData(image: UIImage(named: "ico_devices")!, title: "Electronic devices", desc: "Smartphone, tablet, laptop, etc."))
        models.append(CategoryData(image: UIImage(named: "ico_house")!, title: "Properties", desc: "House, condo, land, etc."))
        models.append(CategoryData(image: UIImage(named: "ico_fan")!, title: "Furniture", desc: "Table, refridgerator, drawer, etc."))
        models.append(CategoryData(image: UIImage(named: "ico_paw")!, title: "Pet", desc: "Dog, cat, bird, etc."))
        models.append(CategoryData(image: UIImage(named: "ico_guitar")!, title: "Hobbies", desc: "Guitar, stickers, posters, etc."))
    }

}

extension CategoryTC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTVC
        cell.configure(with: models[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 79
    }
}
