//
//  UIWebViewControllerLocalFileViewController.swift
//  Recipes
//
//  Created by Ryan Blunden on 9/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import UIKit

class UIWebViewControllerLocalWebView: UIViewController {
  
  @IBOutlet weak var webView: UILocalWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let url = NSBundle.mainBundle().URLForResource(webView.webFile, withExtension: webView.fileExtension, subdirectory: webView.webDir)
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
