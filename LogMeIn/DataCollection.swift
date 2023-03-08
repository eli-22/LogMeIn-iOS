//
//  DataCollection.swift
//  Elise
//
//  Created by Elise on 9/27/22.
//

import Foundation
    
    var currentUserList: [UserObject] = [
        UserObject(
            firstName: "Jane",
            lastName: "Doe",
            username: "jane",
            password: "qwerty",
            securityQuestion: "What is your favorite color?",
            securityAnswer: "blue"),
        UserObject(
            firstName: "John",
            lastName: "Doe",
            username: "john",
            password: "1234",
            securityQuestion: "What is your pet's name?",
            securityAnswer: "Spot")]

    func initializeClientArray() -> [UserObject] {
        return currentUserList
    }
