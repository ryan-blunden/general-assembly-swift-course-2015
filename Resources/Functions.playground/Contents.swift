//: Playground - noun: a place where people can play

import Foundation

//////////////////////////////////////////////////////////////////
///   Nested example with a function that returns a function   ///
//////////////////////////////////////////////////////////////////


func helloWorldFunctionGenerator() -> (() -> String) {
  func hello() -> String {
    return "hello"
  }
  
  func world() ->String {
    return "world"
  }
  
  return { hello() + " " + world() }
}

// helloWorldFunctionGenerator returns a function that takes no params but returns a string
let helloWorldFunc:() -> String = helloWorldFunctionGenerator()

// Now let's call our function
helloWorldFunc()