//
//  FakeNewsFeedManager.swift
//  Recipes
//
//  Created by Ryan Blunden on 11/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation

struct Article {
  let title:String
  let link:String
}

// This "Fake" news manager fakes a JSON network request to focus on how to use SwiftyJSON
class FakeNewsFeedManager {
  private var newsFeed:JSON = nil

  private func fetchJSON() -> JSON? {
    // Let's pretend we've got some JSON data from the internet
    // An array with a single news article
    var newsArtileEntryJSONString = "[{\"title\":\"The Mystery Of The Brand-New Bay Bridge's Corroded Steel\",\"link\":\"http://on.digg.com/1GrArOp\",\"author\":\"\",\"publishedDate\":\"Thu, 11 Jun 2015 02:18:02 -0700\",\"contentSnippet\":\"It isn’t enough for the bridge to survive the next quake; it must function immediately after.\",\"content\":\"It isn’t enough for the bridge to survive the next quake; it must function immediately after.\",\"categories\":[]}]";
    
    // SwiftyJSON expects an NSData object so let's turn our JSON string into NSData
    let jsonData = newsArtileEntryJSONString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    
    if jsonData != nil {
      return JSON(data: jsonData!)
    }
    else {
      return nil
    }
  }
  
  func getAllArticles() -> [Article] {
    // Fetch JSON
    let json = fetchJSON()
    
    // Define our (empty) array of articles
    var newsArticles:[Article] = []
    
    // Check if the json we fetched is not nil (maybe the network was down?)
    if json != nil {
      // if we have json, iterate through each news article entry
      for (key: String, articleJSON: JSON) in json! {
        
        // To be SAFE, we check that the json has a title and link using SwiftyJSON's nifty API
        if let title = articleJSON["title"].string, let link = articleJSON["link"].string {
          
          // We've got a title and link String so add the Article to the list
          newsArticles.append(Article(title: title, link: link))
          
        }
      }
    }
    
    // Return the news articles we found
    return newsArticles
  }
}
