//
//  AuthDataManager.swift
//  ToDo
//
//  Created by Ryan Blunden on 28/04/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation

struct Login {
    let email:String
    let password:String
}

var LOGINS:[Login] = []

class AuthDataManager {
    init() {
        loadAuthorisedUsers()
    }
    
    func loadAuthorisedUsers() {
        LOGINS.append(Login(email: "j.ive@apple.com", password: "applecar"))
    }    
    
    func processLogin(email: String, password:String, completion:(result: Bool) -> Void) {
        
        // TODO: Move the username and password matching to a data manager, this is not the controller's job!
        dispatch_async(dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.value), 0)) {
            var authResult = false
            
            // See if user matches supplied credentials
            for user in LOGINS {
                if user.email == email && user.password == password {
                    authResult = true
                    break
                }
            }
            
            // Simulate delay
            let delayInSeconds = 2.0
            let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSeconds * Double(NSEC_PER_SEC)))
            dispatch_after(popTime, dispatch_get_main_queue()) {
                completion(result:authResult)
            }
        }
    }
}