//
//  AppDelegate.swift
//  Recipes
//
//  Created by Ryan Blunden on 4/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    
    FakeNewsFeedManager().getAllArticles()
    
    return true
  }
}

