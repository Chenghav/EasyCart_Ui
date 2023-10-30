//
//  ViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 3/10/23.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import Firebase

class ViewController: UIViewController, UINavigationBarDelegate {
    
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet var viewMain: UIView!
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        //        navigationController?.navigationBar.delegate = self
        let topColor = #colorLiteral(red: 0.9333333333, green: 0.8980392157, blue: 0.9843137255, alpha: 1)
        let bottomColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewMain.bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        viewMain.layer.insertSublayer(gradientLayer, at: 0)
        googleBtn.layer.borderWidth = 1
        googleBtn.layer.borderColor = #colorLiteral(red: 0.8596773744, green: 0.8627685905, blue: 0.8701456189, alpha: 1)
        googleBtn.layer.masksToBounds = true
        googleBtn.layer.cornerRadius = 10
        googleBtn.tintColor = UIColor.white
        
        //         handle signIn with google
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No Client ID Found in Firebase configuration")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
    }
    
    // MARK: - Outlet Actions -
    @IBAction func googleConection(_ sender: Any) {
        
        // Create and start the activity indicator
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self)
        { result, error in
            
            defer {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
            
            guard error == nil else {
                // Handle error condition
                print("Google Sign-In Error: \(error!)")
                return
            }
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
                    
            else {
                return
            }
            
            guard let userName = user.profile?.name else { return }
            guard let email = user.profile?.email else { return }
            guard let password = user.userID else { return }
            guard let photoProfile = user.profile?.imageURL(withDimension: 200)?.absoluteString else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,                                                 accessToken: user.accessToken.tokenString)
            // call register endPoint
            let register = RegisterModel(userName: userName, email: email, password: password, phoneNumber: "null", address: "null", photoProfile: photoProfile, role: "USER", googleLink: "google.com", maplink: "null")
            APIManager.shareInstant.RegisterAPI(register: register) {
                (isSuccess) in
                if isSuccess {
                    let storyboard = UIStoryboard(name: "Storyboard1", bundle: nil)
                    let secondViewController = storyboard.instantiateViewController(withIdentifier: "TabMainViewController")
                    secondViewController.modalPresentationStyle = .fullScreen
                    self.present(secondViewController, animated: true, completion: nil)
                } else {
                    print("error")
                }
            }
            
            
            Auth.auth().signIn(with: credential){_,_ in
                if let error = error {
                    print("Firebase Authentication Error: \(error.localizedDescription)")
                    return
                }
                else{
                    print("credential \(credential)")
                }
                return
            }
        }
    }
}

