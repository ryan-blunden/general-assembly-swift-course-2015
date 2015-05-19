//////////////////////////////
///   METHODS PLAYGROUND   ///
//////////////////////////////

import Foundation
import UIKit


/// METHODS - THEY HAVE THEIR OWN SET OF RULES ///

class NameViewController:UIViewController {
  
  let nameLabel:UILabel!
  
  // Custom initialiser
  required init() {
    
    // Add a text label to our View Controller's view progammatically
    nameLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
    
    // We must call the designated initialiser
    super.init(nibName: nil, bundle: nil)
  }
  
  // Sub-classes are required to implement this method if they add a new designated initialiser
  required init(coder aDecoder: NSCoder) {
    nameLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
    super.init(nibName: nil, bundle: nil)
  }
  
  // The `override` keyword explicitly declares that you're overriding a function from a Super class (parent class)
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // 1) Standard version
  func updateName(name:String) {
    nameLabel.text = name
    printTextLabelValue()
  }
  
  // 2) Awkward version: It's only clear when calling this that the first param is first name, ONLY because we can see lastName come after it
  func updateFullName(firstName:String, lastName:String) {
    nameLabel.text = "\(firstName) + \(lastName)"
    printTextLabelValue()
  }
  
  // 3) Proper naming design makes the awkwardness go away (and is influence by Objective-C naming conventions)
  func updateFullNameWithFirstName(firstName:String, lastName:String) {
    nameLabel.text = "\(firstName) + \(lastName)"
    printTextLabelValue()
  }
  
  // 4) An other option: If you don't like the above, you can force the inclusion of the parameter name
  func updateFullName2(#firstName:String, lastName:String) {
    nameLabel!.text = "\(firstName) + \(lastName)"
    self.printTextLabelValue() // self means "this" instance
  }
  
  private func printTextLabelValue() {
    let nameLabelValue = nameLabel!.text
    println("Name Label: \"\(nameLabelValue)\"")
  }
  
  class func someTypeMethod() {
    println("I can be called directly on the class")
  }
}

// THIS CODE BELOW WILL LIKELY NOT EXECUTE DUE TO THIS PLAYGROUND BEING NO FUN!


let nameViewController = NameViewController()

// Invalid syntax, Swift doesn't want us having an external param name for the first parameter
//nameViewController.updateName(name:"Ryan")
nameViewController.updateName("Dan")

// NOTE: Confusingly, init functions DO have to have the parameter name of the first argument specified (see line 27)

// Swift and method call design
// This is awkward as it's only clear when calling this that the first param is first name, ONLY because we can see lastName come after it
nameViewController.updateFullName("James", lastName: "Brown")

// Nicer version - The end of the method name informs what the first param is
nameViewController.updateFullNameWithFirstName("Charles", lastName: "Dickens")

// Another version
nameViewController.updateFullName2(firstName: "Kathy:", lastName: "Sierra")

// Private access - the `printTextLabelValue` method is private, this would not compile
//nameViewController.printTextLabelValue()

// Type methods
NameViewController.someTypeMethod()
