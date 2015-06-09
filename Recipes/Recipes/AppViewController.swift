//
//  AppViewController.swift
//  Recipes
//
//  Created by Ryan Blunden on 4/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import UIKit

class AppViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      setupNavBarInUINavigationController()
    }
  
  private func setupNavBarInUINavigationController() {
    // Setup default NavBar styles
    navigationBar.barTintColor = UIColor.darkGrayColor()
    navigationBar.tintColor = UIColor.whiteColor()

    navigationBar.titleTextAttributes = [
      NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 21)!, // font size
      NSForegroundColorAttributeName: UIColor.whiteColor(), // font color
    ]
  }
}
