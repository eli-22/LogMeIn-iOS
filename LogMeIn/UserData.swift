//
//  UserData.swift
//  Elise
//
//  Created by Elise on 9/26/22.
//

import Foundation

struct UserObject: Equatable, Comparable, CustomStringConvertible {
    var firstName: String = ""
    var lastName: String = ""
    var username: String = ""
    var password: String = ""
    var securityQuestion: String = ""
    var securityAnswer: String = ""
    
    var description: String {
        return "\(firstName) \(lastName) \n"
    }
    
    mutating func changePassword(from password: String, to newPassword: String) {
        if self.password == password {
            self.password = newPassword
        }
    }
    
    static func == (lhs: UserObject, rhs: UserObject) -> Bool {
        return (lhs.username == rhs.username)
    }
    
    static func < (lhs: UserObject, rhs: UserObject) -> Bool {
        return lhs.username < rhs.username
    }
}
