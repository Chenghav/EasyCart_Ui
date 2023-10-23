//
//  ViewController.swift
//  Easycart
//
//  Created by Ly Chenghav on 3/10/23.
//

import UIKit
//import GoogleSignIn
//import FirebaseAuth
//import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet var viewMain: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        // handle signIn with google
        //        guard let clientID = FirebaseApp.app()?.options.clientID else {
        //            fatalError("No Client ID Found in Firebase configuration")
        //        }
        //
        //        let config = GIDConfiguration(clientID: clientID)
        //        GIDSignIn.sharedInstance.configuration = config
        
    }
    
    
    @IBAction func googleConection(_ sender: Any) {
        //        GIDSignIn.sharedInstance.signIn(withPresenting: self)
        //        { result, error in
        //            guard error == nil else {
        //                // ...
        //                print("error NIL")
        //                return
        //            }
        //            guard let user = result?.user,
        //                  let idToken = user.idToken?.tokenString
        //
        //            else {
        //                return
        //            }
        //            print("IDToken \(idToken) IDToken")
        //            print(user.userID)
        //            print(user.profile?.name)
        //            print(user.profile?.email)
        //            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
        //                                                           accessToken: user.accessToken.tokenString)
        //            print(user)
        //            Auth.auth().signIn(with: credential){_,_ in
        //                if let error = error {
        //                    print("Firebase Authentication Error: \(error.localizedDescription)")
        //                    return
        //                }
        //                else{
        //                    print("Hello1 \(credential) hello1")
        //                }
        //                return
        //            }
        //        }
        let storyboard = UIStoryboard(name: "Storyboard1", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "TabMainViewController")
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    
    
    
}

