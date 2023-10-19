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
        
//        models.append(CategoryData(image: UIImage(named: "ico_drinks")!, title: "Vehicle", desc: "Motor, car, truck, etc."))
//        models.append(CategoryData(image: UIImage(named: "icon")!, title: "Vehicle", desc: "Motor, car, truck, etc."))
//        models.append(CategoryData(image: UIImage(named: "ico_devices")!, title: "Electronic devices", desc: "Smartphone, tablet, laptop, etc."))
//        models.append(CategoryData(image: UIImage(named: "ico_house")!, title: "Properties", desc: "House, condo, land, etc."))
//        models.append(CategoryData(image: UIImage(named: "ico_fan")!, title: "Furniture", desc: "Table, refridgerator, drawer, etc."))
//        models.append(CategoryData(image: UIImage(named: "ico_paw")!, title: "Pet", desc: "Dog, cat, bird, etc."))
//        models.append(CategoryData(image: UIImage(named: "ico_guitar")!, title: "Hobbies", desc: "Guitar, stickers, posters, etc."))
        
        if let imageDrinks = UIImage(named: "ico_drinks") {
            models.append(CategoryData(image: imageDrinks, title: "Vehicle", desc: "Motor, car, truck, etc."))
        }

        if let imageIcon = UIImage(named: "icon_1") {
            models.append(CategoryData(image: imageIcon, title: "Vehicle", desc: "Motor, car, truck, etc."))
        }

        if let imageDevices = UIImage(named: "ico_devices_1") {
            models.append(CategoryData(image: imageDevices, title: "Electronic devices", desc: "Smartphone, tablet, laptop, etc."))
        }

        if let imageHouse = UIImage(named: "ico_house_1") {
            models.append(CategoryData(image: imageHouse, title: "Properties", desc: "House, condo, land, etc."))
        }

        if let imageFan = UIImage(named: "ico_fan") {
            models.append(CategoryData(image: imageFan, title: "Furniture", desc: "Table, refrigerator, drawer, etc."))
        }

        if let imagePaw = UIImage(named: "ico_paw") {
            models.append(CategoryData(image: imagePaw, title: "Pet", desc: "Dog, cat, bird, etc."))
        }

        if let imageGuitar = UIImage(named: "ico_guitar") {
            models.append(CategoryData(image: imageGuitar, title: "Hobbies", desc: "Guitar, stickers, posters, etc."))
        }

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
