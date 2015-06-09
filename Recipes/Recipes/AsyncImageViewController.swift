//
//  AsyncImageViewController.swift
//  Recipes
//
//  Created by Ryan Blunden on 9/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import UIKit

class AsyncImageViewController: UIViewController {
  
  let syncImageURL = NSURL(string:"http://www.publicdomainpictures.net/pictures/50000/velka/sunset-background-1371188975Z2h.jpg")!
  let asyncImageURL = NSURL(string:"http://www.publicdomainpictures.net/pictures/50000/velka/sunset-in-antique-1373292453xCD.jpg")!
  
  @IBOutlet weak var imageView: UIImageView!

  @IBAction func onSyncButtonTapped(sender: AnyObject) {
    let data = NSData(contentsOfURL: syncImageURL)
    if let imageData = data {
      imageView.image = UIImage(data: imageData)
    }
    
  }
  
  @IBAction func onAsyncButtonTapped(sender: AnyObject) {
    // The request for our image
    let imageRequest = NSURLRequest(URL: asyncImageURL)
    
    // The operation queue our completionHandler closure will be called on upon completion
    // Apple states that calling any UIKit API must be done on the main thread (mainQueue)
    let mainQueue = NSOperationQueue.mainQueue()
    
    NSURLConnection.sendAsynchronousRequest(imageRequest, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
      // If error is nil, everything is good and we have our image data
      if error == nil {
        self.imageView.image = UIImage(data: data!)
      }
        // Otherwise something went wrong
      else {
        Alerts.errorAlert(viewController: self, message: "Error downloading image: \(error.localizedDescription)")
      }
    })
  }
}
