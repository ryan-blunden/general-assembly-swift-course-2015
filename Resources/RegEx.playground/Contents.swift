//: Playground - noun: a place where people can play

import UIKit

func isValidEmail(email:String) -> Bool {
  let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9._-]+\\.[A-Za-z]{2,4}"
  
  let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
  return emailTest.evaluateWithObject(email)
}

isValidEmail("ryan.blunden@gmail.com")
