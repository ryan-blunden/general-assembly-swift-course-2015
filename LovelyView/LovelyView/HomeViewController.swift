//
//  HomeViewController.swift
//  LovelyView
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
    
    setupNavBar()
    
    recipes = RecipeDataManager.sharedManager.findAll()
  }
  
  private func setupNavBar() {
    // Change (effectively), the background colour of the UINavigationBar
    navigationController?.navigationBar.barTintColor = UIColor.darkGrayColor()    
    
    // Set the properties for the back button displayed on the next level screens
    let backItem = UIBarButtonItem(title: "Custom Back Text", style: .Plain, target: nil, action: nil)
    navigationItem.backBarButtonItem = backItem
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
}
