//
//  EditProfileViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 8/10/23.
//

import UIKit
import Alamofire

class EditProfileViewController: UIViewController,Demoable{
    
    let url = URL(string: "http://110.74.194.123:6969/api/v1/user/userprofile")!
    let headers: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJseWNoZW5naGF2c2xveUBnbWFpbC5jb20iLCJpYXQiOjE2OTg2NTAyODUsImV4cCI6MTY5ODczNjY4NX0.Kam8A3U2JSjNcp-AP4vSzbR-9IcnVK9nz36UsfT7BFM"]
    var user: Payload?
    var FetchingData: Bool = false
    
    // MARK:  - Properties -
    var FirstSec  = [FirstSection]()
    var SecondSec = [SecondSection]()
    var ThirdSec  = [ThirdSection]()
    
    // MARK:  - Outlets -
    @IBOutlet weak var backBtnStyle : UIButton!
    @IBOutlet weak var tableView    : UITableView!
    
    // MARK:  - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        backBtnStyle.contentHorizontalAlignment = .left
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.register(FirstEditSectionTableViewCell.nib(), forCellReuseIdentifier: "FirstEditSectionTableViewCell")
        tableView.register(SecondSectionTableViewCell.nib(), forCellReuseIdentifier: "SecondSectionTableViewCell")
        tableView.register(ThirdCellsTableViewCell.nib(), forCellReuseIdentifier: "ThirdCellsTableViewCell")
        tableView.register(UINib(nibName: "ThirdSectionTableViewCell", bundle: nil), forCellReuseIdentifier: "ThirdSectionTableViewCell")
        FirstSec  = firstSection
        SecondSec = secondSection
        ThirdSec  = thirdSection
        tableView.reloadData()
        getProfileData()
    }
    
    // MARK:  - Outlet Actions -
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    func getProfileData() {
        AF.request(url, method: .get, headers: headers).validate().responseJSON { response in
            if let jsonData = response.data {
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(userProfile.self, from: jsonData)
                    
                    DispatchQueue.main.async {
//                        self.user.append(object.payload)
                        self.user = object.payload
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
extension EditProfileViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return FirstSec.count
        } else if section == 1 {
            return SecondSec.count + ThirdSec.count
        } else if section == 2 {
            return 1
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstEditSectionTableViewCell", for: indexPath) as! FirstEditSectionTableViewCell
            if indexPath.row == 0 {
                cell.FirstLab.text  = "Name"
                cell.SecondLab.text = user?.name
            }else if indexPath.row == 1{
                cell.FirstLab.text  = "Email"
                cell.SecondLab.text = user?.email
            }else if indexPath.row == 2{
                cell.SecondLab.text = user?.phoneNumber
                cell.FirstLab.text  = "Phone No."
            } else if indexPath.row == 3 {
                let passwordLength = user?.password.count ?? 0
                let maskedPassword = String(repeating: "*", count: min(passwordLength, 10))
                cell.SecondLab.text = maskedPassword
                cell.FirstLab.text  = "Password"
                cell.SecondLab.textColor = .black
            }else if indexPath.row == 4 {
                cell.SecondLab.text = user?.googleLink
                cell.FirstLab.text  = "Google Link"
                cell.SecondLab.textColor = #colorLiteral(red: 0.5210024118, green: 0.2106079459, blue: 0.9001228213, alpha: 1)
            }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let currentIndex = indexPath.row
            if currentIndex < SecondSec.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SecondSectionTableViewCell", for: indexPath) as! SecondSectionTableViewCell
                cell.AddressDetail.text = user?.shopAdress
                cell.selectionStyle = .none
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdCellsTableViewCell", for: indexPath) as! ThirdCellsTableViewCell
                cell.Linked.text = user?.maplink
//                cell.setUps(with: ThirdSec[currentIndex - SecondSec.count])
                cell.selectionStyle = .none
                return cell
            }
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdSectionTableViewCell", for: indexPath) as! ThirdSectionTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2 && indexPath.row == 0 {
            EditProfileViewController.openDemo(from: self, in: nil,btnName: "Delete", titleLab1: "Delete your account?")
        }else if indexPath.section == 1 && indexPath.row == 1{
            EditProfileViewController.openDemo(from: self, in: nil,btnName: "confirm", titleLab1: "unlink your address?")
        }else if indexPath.section == 0 && indexPath.row == 4{
            EditProfileViewController.openDemo(from: self, in: nil,btnName: "Disconnect my social login", titleLab1: "Disconnect your social login")
                    }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentRow = indexPath.row
        if indexPath.section == 0 {
            return 50
        }else if indexPath.section == 1 {
            if currentRow == 0 {
                return 106
            }else if currentRow == 1 {
                return 50
            }
        }else if indexPath.section == 2 {
            return 44
        }
        return 0
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


