//
//  ProfileViewController.swift
//  swiftui-RealTimeChatApp
//
//  Created by Grids Jivapong on 24/2/2564 BE.
//
//  Controller and the profile view controller.

import UIKit
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn

// Config Log Out View
class ProfileViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    // Config Log Out Button View
    let data = ["Log Out"]
    // Config Table View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Config register Button View
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self

    }

}

// Extension Class Table View (delegate = UITableViewDelegate, dataSource = UITableViewDataSource)
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    // function sheet property
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        return cell
    } // end function property
    
    // function for logout (didSelectRowAt)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // pop up Alert
        let actionSheet = UIAlertController(title: "",
                                      message: "",
                                      preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Log Out",
                                      style: .destructive,
                                      handler: { [weak self] _ in
                                        
                                        guard let strongSelf = self else {
                                            return
                                        }
                                        // LogOut facebook
                                        FBSDKLoginKit.LoginManager().logOut()
                                        // LogOut google
                                        GIDSignIn.sharedInstance()?.signOut()
                                        
                                        do {
                                            // command signOut relete FirebaseAuth
                                            try FirebaseAuth.Auth.auth().signOut()
                                            
                                            let vc = LoginViewController()
                                            let nav = UINavigationController(rootViewController: vc)
                                            nav.modalPresentationStyle = .fullScreen
                                            strongSelf.present(nav, animated: true)
                                            
                                        } catch {
                                            
                                            print("Failled to log out")
                                            
                                        }
                                        
                                      }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        
        present(actionSheet, animated: true)
        
    } // end function logout
    
}
