//
//  UIWebViewControllerLocalFileViewController.swift
//  Recipes
//
//  Created by Ryan Blunden on 9/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import UIKit

class UIWebViewControllerLocal: UIViewController {
  
  @IBOutlet weak var webView: UIWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let url = NSBundle.mainBundle().URLForResource("about", withExtension: "html", subdirectory: "web")
    if url != nil {
      webView.loadRequest(NSURLRequest(URL: url!))
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    setupNavBar()
  }
  
  private func setupNavBar() {
    navigationController?.navigationBar.barTintColor = UIColor.purpleColor()
  }
}
