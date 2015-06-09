//
//  HomeViewController.swift
//  Recipes
//
//  Created by Ryan Blunden on 4/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
  private var recipes:[Recipe] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    
    recipes = RecipeDataManager.sharedManager.findAll()
  }
  
  override func viewWillAppear(animated: Bool) {
    setupNavBar()
  }
  
  private func setupNavBar() {
    navigationController?.navigationBar.barTintColor = UIColor.darkGrayColor()
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipes.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let recipe = recipes[indexPath.row]
    var tableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "")
    tableViewCell.textLabel?.text = recipe.title
    tableViewCell.detailTextLabel?.text = recipe.description
    return tableViewCell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let recipe = recipes[indexPath.row]
    performSegueWithIdentifier(recipe.segue, sender: self)
  }
    
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let identifier = segue.identifier {
      switch identifier {
        case Constants.segueToAboutWebView:
        if let aboutViewController = segue.destinationViewController as? UIWebViewControllerLocalGeneric {
            aboutViewController.webFile = "about"
        }
        
        case Constants.segueToContactWebView:
        if let aboutViewController = segue.destinationViewController as? UIWebViewControllerLocalGeneric {
            aboutViewController.webFile = "contact"
        }
        
        default:
         return
      }
    }
  }
}
