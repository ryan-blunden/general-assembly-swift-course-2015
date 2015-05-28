//
//  KittensFilterViewController.swift
//  Kittens
//
//  Created by Ryan Blunden on 28/05/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

// Use types instead of passing around strings. SAFE!
enum KittenType:String {
  case Cute = "Cute"
  case Ragdoll = "Ragdoll"
}

class KittensFilterViewController:UIViewController {
  var kittenType:KittenType? = nil
  
  @IBOutlet weak var previousChoiceTextLabel: UILabel!
  let previousChoiceTextPrefix = "Previous Choice:"
  var previousChoiceText = ""
  
  override func viewDidLoad() {
    previousChoiceTextLabel.text = "\(previousChoiceTextPrefix) \(previousChoiceText)"
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let segueIdentifier = segue.identifier {
      switch segueIdentifier {
      case "cuteButton":
        kittenType = KittenType.Cute
        
      case "ragdollButton":
        kittenType = KittenType.Ragdoll
        
      case "clearFilterButton":
        kittenType = nil
        
      default:
        break
      }
    }
  }
}
