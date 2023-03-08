//
//  SignUpVC.swift
//  Elise
//
//  Created by Elise on 9/26/22.
//

import UIKit

class SignUpVC: UIViewController {
    
    var userList: [UserObject] = initializeClientArray()
    var userCreated = UserObject()
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    @IBOutlet weak var securityQuestionTextField: UITextField!
    @IBOutlet weak var securityAnswerTextField: UITextField!
    
    @IBOutlet weak var submitUserData: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createNewUser(_ sender: UIButton) {
        guard !firstNameTextField.text!.isEmpty,
              !lastNameTextField.text!.isEmpty,
              !usernameTextField.text!.isEmpty,
              !passwordTextField.text!.isEmpty,
              !retypePasswordTextField.text!.isEmpty,
              !securityQuestionTextField.text!.isEmpty,
              !securityAnswerTextField.text!.isEmpty else {
            let alert = UIAlertController (
                title: "Missing Information",
                message: "Please complete all required fields.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard Validation.passwordsMatch(passwordTextField.text!, retypePasswordTextField.text!) else {
            let alert = UIAlertController (
                title: "Passwords do not match.",
                message: "Please retype password.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard !Validation.isExistingUsername(userList, usernameTextField.text!) else {
            let alert = UIAlertController (
                title: "User \"\(usernameTextField.text!)\" already exists.",
                message: "Please choose a different username.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let newUser = UserObject(
            firstName: firstNameTextField.text!,
            lastName: lastNameTextField.text!,
            username: usernameTextField.text!,
            password: passwordTextField.text!,
            securityQuestion: securityQuestionTextField.text!,
            securityAnswer: securityAnswerTextField.text!)
            userCreated = newUser
            userList.append(newUser)
        
        performSegue(withIdentifier: "unwindFromSignUp", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindFromSignUp" {
            let loginVC = segue.destination as! LoginVC
            loginVC.userList = userList
        }
    }
}
    
    
