/////////////////////////////////////////////////
///   Lesson 10 - Function Review Challenge   ///
/////////////////////////////////////////////////

import Foundation

// Complete these, in order, writing code under each TODO statement. 
// Each statement calls for a function to be written, write each of them and then immediately 
// call it after the function definition.


// 1) TODO: Define a function that prints "Hello World!"
func sayHelloWorld() {
  println("Hello World!")
}

sayHelloWorld()


// 2) TODO: Define a function that prints "Hello \(name)!" with name being passed in as a parameter.
func helloPerson(#name:String) {
  println("Hello \(name)")
}

helloPerson(name: "Jeremy")



// 3) TODO: Write a function that accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!".
func helloOptional(name:String?) {
  if let nameValue = name {
    println("Hello \(nameValue)")
  }
  else {
    println("Hello World!")
  }
}

helloOptional("Danny boy")


// 4) TODO: Write a function that is the same as 3), except that it RETURNS the string instead of printing it.
func helloReturn(name:String?) -> String {
  if let nameValue = name {
    return "Hello \(nameValue)"
  }
  else {
    return "Hello World!"
  }
}

println(helloReturn("Wendy"))


// 5) TODO: Create a function getTapPosition which returns a tuple with an x and y value (Int). Any valid Integer value is fine for the x and y values.
func getTapPosition() -> (x:Int, y:Int) {
  return (x:45, y:105)
}

let (x:Int, y:Int) = getTapPosition()
x
y



// 6) TODO: Create a joinStrings function that takes two strings and a third parameter that has a default value of ",". HINT: Look at the Apple Swift Tour guide on functions for an example if you get stuck.
func joinStrings(string1:String, string2:String, joinString:String = ",") -> String {
  return string1 + joinString + string2
}

joinStrings("Barry", "Dude")
joinStrings("Kelly", "Slater", joinString:"----")

