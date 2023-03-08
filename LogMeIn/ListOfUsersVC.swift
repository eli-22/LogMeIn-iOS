//
//  ListOfUsersVC.swift
//  Elise
//
//  Created by Elise on 9/26/22.
//

import UIKit

class ListOfUsersVC: UIViewController {
    
    var userList: [UserObject]!
    
    @IBOutlet weak var listOfUsersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        displayUsers(userList)
    }
    
    func displayUsers(_ users: [UserObject]) {
        let allUsers = users
        var displayString = ""
        for user in allUsers {
           displayString += "\n\(user.description)"
        }
        listOfUsersLabel.text = displayString
    }
}
