//
//  RecipeDataManager.swift
//  Recipes
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
      Recipe(title: "UINavigationBar", description: "Understanding its various properties", segue:Constants.segueToUINavigationBar),
      Recipe(title: "UIAlertViewController", description: "How to show alerts", segue:Constants.segueToAlertViewController),
      Recipe(title: "UIScrollView", description: "Providing view scrolling behaviour", segue:Constants.segueToScrollView),
      Recipe(title: "UIWebView", description: "Loading a webpage inside your app", segue:Constants.segueToUIWebView),
      Recipe(title: "UIWebView Local File", description: "Loading a local webpage inside your app", segue:Constants.segueToUIwebViewLocal),
      Recipe(title: "Async Image Loading", description: "Downloading an image in the background", segue:Constants.seguetoAsyncImageViewController),
      Recipe(title: "Generic local web view", description: "Set up a local web view using interface builder", segue:Constants.segueToGenericWebViewLocal)
    ]
  }
  
  func findAll() -> [Recipe] {
    return recipes
  }
}
