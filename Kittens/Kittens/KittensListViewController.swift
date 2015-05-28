//
//  KittensListViewController.swift
//  Kittens
//
//  Created by Ryan Blunden on 28/05/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

class KittensListViewController:UIViewController {
  let filterKittenTextPrefix = "Filtering Kittens by:"
  var filterKittenText = ""
  var kitenFilterType:KittenType? = nil
  
  @IBOutlet weak var filterTextLabel: UILabel!
  @IBOutlet weak var cuteTextLabel: UILabel!
  @IBOutlet weak var ragdollTextLabel: UILabel!
  
  @IBOutlet weak var cuteView: KTDesignableView!
  @IBOutlet weak var ragdollView: KTDesignableView!
  
  override func viewDidLoad() {
    navigationItem.setHidesBackButton(true, animated: false)
    styleKittenViewLabels(cuteTextLabel)
    styleKittenViewLabels(ragdollTextLabel)
  }
  
  override func viewWillAppear(animated: Bool) {
    updateUI()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let kittensFilterViewController = segue.destinationViewController as? KittensFilterViewController {
      kittensFilterViewController.previousChoiceText = filterKittenText
    }
  }
  
  @IBAction func unwindToKittensListViewController(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let kittensFilterViewController = segue.sourceViewController as? KittensFilterViewController {
      if let kittenType = kittensFilterViewController.kittenType {
        kitenFilterType = kittenType
        filterKittenText = kittenType.rawValue
      }
      else {
        filterKittenText = "None"
        kitenFilterType = nil
      }
    }
  }
  
  // MARK: Private methods
  
  private func styleKittenViewLabels(label:UILabel) {
    label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
    label.layer.borderWidth = 1
    label.layer.borderColor = UIColor.lightGrayColor().CGColor
  }
  
  private func updateUI() {
    if let validKittenFilterType = kitenFilterType {
      switch validKittenFilterType {
      case .Cute:
        cuteView.hidden = false
        ragdollView.hidden = true
        
      case .Ragdoll:
        cuteView.hidden = true
        ragdollView.hidden = false
        
      default:
        break
      }
    }
    else {
      cuteView.hidden = false
      ragdollView.hidden = false
    }
    filterTextLabel.text = "\(filterKittenTextPrefix) \(filterKittenText)"
  }
}