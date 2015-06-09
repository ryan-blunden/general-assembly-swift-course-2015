//
//  Alerts.swift
//  Recipes
//
//  Created by Ryan Blunden on 9/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

class Alerts {
  class func errorAlert(#viewController:UIViewController, message: String) {
    let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
    alertViewController.addAction(UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default, handler: nil))
    viewController.presentViewController(alertViewController, animated: true, completion: nil)
  }
}
