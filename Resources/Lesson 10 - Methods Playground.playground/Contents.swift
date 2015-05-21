//////////////////////////////
///   METHODS PLAYGROUND   ///
//////////////////////////////

import Foundation

/// METHODS - THEY HAVE THEIR OWN SET OF RULES ///

class Person {
  
  var firstName:String
  var lastName:String
  
  init(firstName firstNameValue:String, lastName lastNameValue:String) {
    firstName = firstNameValue
    lastName = lastNameValue
  }
  
  func description() -> String {
    return firstName + " " + lastName
  }
}

let theDude = Person(firstName: "The", lastName: "Dude")
println(theDude.description())

//
//  // 1) Standard version
//  func updateName(name aName:String) {
//    name = aName
//    printTextLabelValue()
//  }
//  
//  // 2) Awkward version: It's only clear when calling this that the first param is first name, ONLY because we can see lastName come after it
//  func updateFullName(firstName:String, lastName:String) {
//    name = "\(firstName) + \(lastName)"
//    printTextLabelValue()
//  }
//  
//  // 3) Proper naming design makes the awkwardness go away (and is influence by Objective-C naming conventions)
//  func updateFullNameWithFirstName(firstName:String, lastName:String) {
//    name = "\(firstName) + \(lastName)"
//    printTextLabelValue()
//  }
//  
//  // 4) An other option: If you don't like the above, you can force the inclusion of the parameter name
//  func updateFullName2(#firstName:String, lastName:String) {
//    name = "\(firstName) + \(lastName)"
//    self.printTextLabelValue() // self means "this" instance
//  }
//  
//  private func printTextLabelValue() {
//    println("Name: \"\(name)\"")
//  }
//  
//  class func someTypeMethod() {
//    println("I can be called directly on the class")
//  }
//}

// THIS CODE BELOW WILL LIKELY NOT EXECUTE DUE TO THIS PLAYGROUND BEING NO FUN!


//let dude1 = Person(name: "Barry")
//
//// Invalid syntax, Swift doesn't want us having an external param name for the first parameter
////dude1.updateName(name:"Ryan")
//dude1.updateName(name:"Dan")
//
//// NOTE: Confusingly, init functions DO have to have the parameter name of the first argument specified (see line 27)
//
//// Swift and method call design
//// This is awkward as it's only clear when calling this that the first param is first name, ONLY because we can see lastName come after it
//dude1.updateFullName("James", lastName: "Brown")
//
//// Nicer version - The end of the method name informs what the first param is
//dude1.updateFullNameWithFirstName("Charles", lastName: "Dickens")
//
//// Another version
//dude1.updateFullName2(firstName: "Kathy:", lastName: "Sierra")
//
//// Private access - the `printTextLabelValue` method is private, this would not compile
////dude1.printTextLabelValue()
//
//// Type methods
//Person.someTypeMethod()
