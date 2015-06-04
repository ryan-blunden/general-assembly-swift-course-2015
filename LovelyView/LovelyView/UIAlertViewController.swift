//
//  UIAlertViewController.swift
//  LovelyView
//
//  Created by Ryan Blunden on 4/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import UIKit

class UIAlertViewController: UIViewController {
  
  let message = "Hello GA iOS Class!"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavBar()
    displayMessage(message)
  }
  
  private func setupNavBar() {
    navigationController?.navigationBar.barTintColor = UIColor.blueColor()
  }
  
  func displayMessage(message:String) {
    let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
    alertViewController.addAction(UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default, handler: nil))
    presentViewController(alertViewController, animated: true, completion: nil)
  }  
}
