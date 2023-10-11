//
//  ExploreViewController.swift
//  Easycart
//
//  Created by PVH_002 on 4/10/23.
//

import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Register the ExploreTableViewCell
        tableView.register(UINib(nibName: "ExploreTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    
    
}

extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
}

extension ExploreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExploreTableViewCell
        
        if indexPath.section == 0 {
            
        } else if indexPath.section == 1 {
            cell.exploreImgCard
            print("")
        }
        
        return cell
    }
}

