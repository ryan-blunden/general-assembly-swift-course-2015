//
//  SwiftyJSONViewController.swift
//  Recipes
//
//  Created by Ryan Blunden on 11/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

class SwiftyJSONViewController:UIViewController {
  
  // This means, set it to nil initially, but TRUST ME, by the time
  // someone goes to access it, it WON'T be nil.
  // USE WITH CAUTION!!!
  var newsArticle:Article! = nil
  
  @IBOutlet weak var newsArticleTitle: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let newsArticles = FakeNewsFeedManager().getAllArticles()
    
    if let firstNewsArticle = newsArticles.first {
      newsArticle = firstNewsArticle
      newsArticleTitle.text = newsArticle.title
    }
  }
  
  @IBAction func onButtonTapped(sender: AnyObject) {
    if newsArticle != nil {
      UIApplication.sharedApplication().openURL(NSURL(string:newsArticle.link)!)
    }
  }
}
