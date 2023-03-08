//
//  ChangePasswordVC.swift
//  Elise
//
//  Created by Elise on 10/2/22.
//

import UIKit

class ChangePasswordVC: UIViewController {
    
    var userList: [UserObject]!
    var currentUser: UserObject?
    
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    @IBOutlet weak var changePasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changePasswordPressed(_ sender: Any) {
        guard !oldPasswordTextField.text!.isEmpty,
              !newPasswordTextField.text!.isEmpty,
              !confirmNewPasswordTextField.text!.isEmpty
        else {
            let alert = UIAlertController (
                title: "Missing Information",
                message: "Please complete all required fields.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard currentUser?.password == oldPasswordTextField.text! else{
            let alert = UIAlertController (
                title: "Incorrect password.",
                message: "Please retype your old password.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard Validation.passwordsMatch(newPasswordTextField.text!, confirmNewPasswordTextField.text!) else {
            let alert = UIAlertController (
                title: "Passwords do not match.",
                message: "Please retype password.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        for i in 0..<userList.count {
            if userList[i] == currentUser {
                userList[i].password = newPasswordTextField.text!
            }
        }
        
        let alert = UIAlertController (
            title: "Success!",
            message: "Password changed successfully.",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alert, animated: true, completion: nil)
        performSegue(withIdentifier: "unwindFromChangePassword", sender: nil)
        oldPasswordTextField.text = ""
        newPasswordTextField.text = ""
        confirmNewPasswordTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindFromChangePassword" {
            let loginVC = segue.destination as! LoginVC
            loginVC.userList = userList
        }
    }
}
