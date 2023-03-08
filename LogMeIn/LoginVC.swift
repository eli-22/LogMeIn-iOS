//
//  ViewController.swift
//  Elise
//
//  Created by Elise on 9/26/22.
//

import UIKit

class LoginVC: UIViewController {
    
    var userList: [UserObject] = initializeClientArray()
    var userToUpdate: UserObject?
    var userUpdated: UserObject?
    var currentUser: UserObject?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearText()
    }
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToTabBar" {
            let tabBar = segue.destination as! UITabBarController
            let userListVC = tabBar.viewControllers![0] as! ListOfUsersVC
            userListVC.userList = userList
            let changePasswordVC = tabBar.viewControllers![1] as! ChangePasswordVC
            changePasswordVC.userList = userList
            changePasswordVC.currentUser = currentUser
        }
        if segue.identifier == "loginToReset" {
            let resetPasswordVC = segue.destination as! ResetPasswordVC
            resetPasswordVC.userList = userList
            resetPasswordVC.userToUpdate = userToUpdate
            
        }
    }

    @IBAction func signUpPressed(_ sender: Any) {
        performSegue(withIdentifier: "loginToSignUp", sender: nil)
    }
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        guard Validation.isExistingUsername(userList, usernameTextField.text!) else {
            let alert = UIAlertController (
            title: "Unrecognized Username",
            message: "Please enter your username to retrieve your security question.",
            preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        for user in userList {
            if usernameTextField.text == user.username {
                userToUpdate = user
            }
        }
        performSegue(withIdentifier: "loginToReset", sender: nil)
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        if Validation.isValidUser(usernameTextField.text!, passwordTextField.text!, userList) {
            for i in 0..<userList.count {
                if userList[i].username == usernameTextField.text! {
                    currentUser = userList[i]
                }
            }
            performSegue(withIdentifier: "loginToTabBar", sender: nil)
        } else {
            let alert = UIAlertController (
            title: "Incorrect Username or Password",
            message: "Username and password do not match.",
            preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func clearText() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

