//
//  LoginViewController.swift
//  ToDo
//
//  Created by Ryan Blunden on 28/04/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

let EMAIL_MIN_LENGTH = 8
let PASSWORD_MIN_LENGTH = 8

class LoginViewController: UIViewController, UITextFieldDelegate {
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  let authDataManager:AuthDataManager
  
  required init(coder aDecoder: NSCoder) {
    authDataManager = AuthDataManager()
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    title = "ToDo App"
    
    activityIndicator.stopAnimating()
    styleLoginButton()
  }
  
  func styleLoginButton() {
    loginButton.layer.cornerRadius = 5.0
    loginButton.layer.masksToBounds = true
  }
  
  // Login form API
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    switch(textField) {
    case emailTextField:
      emailTextField.resignFirstResponder()
      passwordTextField.becomeFirstResponder()
      
    case passwordTextField:
      passwordTextField.resignFirstResponder()
      doLogin()
      
    default:
      break
    }
    
    return true
  }
  
  @IBAction func onLoginButtonTapped(sender: AnyObject) {
    doLogin()
  }
  
  
  // MARK: Form validation and processing
  
  func isLoginFormValid() -> Bool {
    return count(emailTextField.text) > EMAIL_MIN_LENGTH && count(passwordTextField.text) >= PASSWORD_MIN_LENGTH
  }
  
  
  // MARK: Login processing
  
  func doLogin() {
    if(!isLoginFormValid()) {
      displayMessage("Email or password is invalid")
    }
    else {
      setLoginFormState(false)
      authDataManager.processLogin(emailTextField.text, password:passwordTextField.text) { (result) -> Void in
        if(result) {
          self.displayMessage("Successfully logged in!")
        }
        else {
          self.displayMessage("Sorry, a matching email and/or password was not found in our system.")
        }
        
        self.setLoginFormState(true)
      }
    }
  }
  
  func setLoginFormState(enabled: Bool) {
    emailTextField.enabled = enabled
    passwordTextField.enabled = enabled
    loginButton.enabled = enabled
    
    if(enabled) {
      activityIndicator.stopAnimating()
    }
    else {
      activityIndicator.startAnimating()
    }
  }
  
  
  // MARK: Present feedback to user
  
  func displayMessage(message:String) {
    let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
    alertViewController.addAction(UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default, handler: nil))
    presentViewController(alertViewController, animated: true, completion: nil)
  }
  
}