//
//  WebViewController.swift
//  LovelyView
//
//  Created by Ryan Blunden on 4/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

class WebViewController: UIViewController {
  
  @IBOutlet weak var webView: UIWebView!
  
  var urlString = "https://generalassemb.ly/"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavBar()
    loadWebPage()
  }
  
  private func setupNavBar() {
    navigationController?.navigationBar.barTintColor = UIColor.greenColor()
  }
  
  func loadWebPage() {
    let url = NSURL(string: urlString)
    let request = NSURLRequest(URL: url!)
    webView.loadRequest(request)
  }  
}
