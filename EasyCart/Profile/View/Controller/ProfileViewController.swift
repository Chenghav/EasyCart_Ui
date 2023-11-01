//
//  ProfileViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 7/10/23.
//

import UIKit
import FittedSheets
import Alamofire
import Kingfisher

class ProfileViewController: UIViewController,Demoable {

    // MARK:  - Array Data -
    var section1 = [Section1]()
    var section2 = [Section]()
    var section3 = [Section3]()
    
    let url = URL(string: "http://110.74.194.123:6969/api/v1/user/userprofile")!
    let headers: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJseWNoZW5naGF2c2xveUBnbWFpbC5jb20iLCJpYXQiOjE2OTg2NTAyODUsImV4cCI6MTY5ODczNjY4NX0.Kam8A3U2JSjNcp-AP4vSzbR-9IcnVK9nz36UsfT7BFM"]
    var user: [Payload] = []
    var test : Payload?
    var FetchingData: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView1: UIImageView!
    
    // MARK:  - Life Cycle -
    override func  viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: "TableViewCell")
        tableView.register(LogOutTableViewCell.nib(), forCellReuseIdentifier: "LogOutTableViewCell")
        tableView.register(Section1TableViewCell.nib(), forCellReuseIdentifier: "Section1TableViewCell")
        section1 = Section1s
        section2 = Sections
        section3 = Section3s
        tableView.reloadData()
        getProfileData()
    }
    func getProfileData() {
        AF.request(url, method: .get, headers: headers).validate().responseJSON { response in
            if let jsonData = response.data {
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(userProfile.self, from: jsonData)
                    
                    DispatchQueue.main.async {
//                        self.user.append(object.payload)
                        self.title = object.payload.name
                        self.tableView.reloadData()
                        self.FetchingData = false
                    }
                } catch {
                    print(error.localizedDescription)
                    self.FetchingData = false
                }
            } else if let error = response.error {
                print(error.localizedDescription)
                self.FetchingData = false
            }
        }
    }

    }


// MARK:  - UITableViewDataSource and UITableViewDelegate -
extension ProfileViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return section1.count
        } else if section == 1 {
            return section2.count
        } else if section == 2 {
            return section3.count
            
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection = indexPath.section
        if currentSection == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Section1TableViewCell", for: indexPath) as! Section1TableViewCell
            cell.config(with: section1[indexPath.row])
            cell.selectionStyle = .none
            return cell
        } else if currentSection == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.setUp(with: section2[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }else if currentSection == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogOutTableViewCell", for: indexPath) as! LogOutTableViewCell
            cell.setUp(with: section3[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentIndex = indexPath.section
        if currentIndex == 2 {
            ProfileViewController.openDemo(from: self, in: nil, btnName: "Log out", titleLab1: "Log out of EasyCart?")
        }else if currentIndex == 0 {
            if let nextController = storyboard?.instantiateViewController(identifier: "ConnectBankViewController") as? ConnectBankViewController {
                navigationController?.pushViewController(nextController, animated: true)
            }
        }else if currentIndex == 1 {
            if indexPath.row == 4 {
                
            }else {
                if let nextController = storyboard?.instantiateViewController(identifier: "AllitemViewController") as? AllitemViewController {
                    if indexPath.row == 0 {
                        nextController.selectedIndex = 0
                    } else if indexPath.row == 1 {
                        nextController.selectedIndex = 3
                    } else if indexPath.row == 2 {
                        nextController.selectedIndex = 1
                    } else if indexPath.row == 3 {
                        nextController.selectedIndex = 2
                    }
                    navigationController?.pushViewController(nextController, animated: true)
                }
            }
            
        }
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let currentSections = indexPath.section
            if currentSections == 0 {
                return 64
            }else if currentSections == 1{
                return 74
            }else {
                return 34
            }
        }
    struct userProfile: Codable {
        let payload: Payload
        let message: String
        let code: Int
        let error: Bool
        let date: String
    }

    struct Payload: Codable {
        let id: Int
        let name, email, password, phoneNumber: String
        let profilePhoto: String
        let status: Bool
        let googleLink, maplink, createDate, shopAdress: String
    }
}




