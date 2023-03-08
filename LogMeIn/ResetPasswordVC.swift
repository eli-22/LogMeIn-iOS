//
//  ResetPasswordVC.swift
//  Elise
//
//  Created by Elise on 9/26/22.
//

import UIKit

class ResetPasswordVC: UIViewController {

    var userList: [UserObject]!
    var userToUpdate: UserObject!
    
    @IBOutlet weak var securityQuestionLabel: UILabel!
    @IBOutlet weak var securityAnswerTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        securityQuestionLabel.text = userToUpdate.securityQuestion
        usernameTextField.text = userToUpdate.username
    }
    
    @IBAction func changePassword() {
        guard !securityAnswerTextField.text!.isEmpty,
              !usernameTextField.text!.isEmpty,
              !newPasswordTextField.text!.isEmpty,
              !confirmPasswordTextField.text!.isEmpty
        else {
            let alert = UIAlertController (
                title: "Missing Information",
                message: "Please complete all required fields.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard Validation.answerIsCorrect(userToUpdate, securityAnswerTextField.text!) else {
            let alert = UIAlertController (
                title: "Incorrect Answer to Security Question.",
                message: "Please try again.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard Validation.passwordsMatch(newPasswordTextField.text!, confirmPasswordTextField.text!) else {
            let alert = UIAlertController (
                title: "Passwords do not match.",
                message: "Please retype password.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        for i in 0..<userList.count {
            if userList[i].username == userToUpdate.username {
                userList[i].password = newPasswordTextField.text!
            }
        }
        performSegue(withIdentifier: "unwindFromReset", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindFromReset" {
            let loginVC = segue.destination as! LoginVC
            loginVC.userList = userList
            loginVC.userUpdated = userToUpdate
        }
    }
}

