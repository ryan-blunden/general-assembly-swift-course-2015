//
//  RecipeDataManager.swift
//  LovelyView
//
//  Created by Ryan Blunden on 4/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation

class RecipeDataManager {
  private var recipes:[Recipe]
  
  static let sharedManager:RecipeDataManager = RecipeDataManager()
  
  init() {
    recipes = []
    loadRecipes()
  }
  
  func loadRecipes() {
    recipes = [
      Recipe(title: "UIAlertViewController", description: "How to show alerts", segue:Constants.segueToAlertViewController),
      Recipe(title: "UIScrollView", description: "Providing view scrolling behaviour", segue:Constants.segueToScrollView),
      Recipe(title: "UIWebView", description: "Loading a webpage inside your app", segue:Constants.segueToUIWebView)
    ]
  }
  
  func findAll() -> [Recipe] {
    return recipes
  }
}
