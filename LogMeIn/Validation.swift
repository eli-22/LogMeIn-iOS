//
//  Validation.swift
//  Elise
//
//  Created by Elise on 10/2/22.
//

import Foundation

class Validation {
    
    static func isValidUser(_ username: String, _ password: String, _ list: [UserObject]) -> Bool {
        for user in list {
            if user.username == username && user.password == password {
                return true
            }
        }
        return false
    }
    
    static func isExistingUsername(_ list: [UserObject], _ textInput: String) -> Bool {
        for user in list {
            if user.username == textInput {
                return true
            }
        }
        return false
    }
    
    static func passwordsMatch(_ password: String, _ retypePassword: String) -> Bool {
        if password == retypePassword {
            return true
        } else {
            return false
        }
    }
    
    static func answerIsCorrect(_ user: UserObject, _ securityAnswer: String) -> Bool {
        if securityAnswer == user.securityAnswer {
            return true
        } else {
            return false
        }
    }
}
