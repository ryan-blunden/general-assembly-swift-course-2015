//
//  LocalWebView.swift
//  Recipes
//
//  Created by Kate Lanyon on 9/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

class UILocalWebView : UIWebView {
    
    @IBInspectable var webFile: String = "";
    @IBInspectable var webDir: String = "web";
    @IBInspectable var fileExtension: String = "html";
}