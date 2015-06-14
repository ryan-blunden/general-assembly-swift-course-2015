//
//  ColouriseController.swift
//  Recipes
//
//  Created by Kate Lanyon on 14/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import UIKit

class ColouriseController: UIViewController
{
    @IBOutlet weak var cat: UIImageView!

    @IBOutlet weak var red: UISlider!

    @IBOutlet weak var green: UISlider!

    @IBOutlet weak var blue: UISlider!

    override func viewDidLoad() {
        updateColour()

        super.viewDidLoad()
    }
    
    @IBAction func colourChanged(sender: UISlider)
    {
        updateColour()
    }
    
    
    // set the image colour to the current value of the sliders
    func updateColour()
    {
        var colour = UIColor(red: CGFloat(red.value), green: CGFloat(green.value), blue: CGFloat(blue.value), alpha: 1)
        
        // IMPORTANT: for this to work the 'Render as' field in the image catalogue needs to be set to 'Template Image'
        cat.tintColor = colour;
    }
}
