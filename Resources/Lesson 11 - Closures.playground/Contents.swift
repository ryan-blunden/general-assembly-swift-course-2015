////////////////////////////
///   CLOSURS PLAYGROUND ///
////////////////////////////

// Helpful article: http://airspeedvelocity.net/2014/06/11/a-basic-tutorial-on-functions-and-closures-in-swift/


// 1. Functions can be assigned to variables and passed in and out of other functions as arguments, just as an Int or a String can be.

func sayHello(name:String) {
  println("Hello \(name)!")
}

// This assigns the function you just declared
// to a variable.  Note the absence of () after the
// function name.
let sayhelloFuncRef = sayHello

// Now you can call that function using your variable.
sayhelloFuncRef("Ryan")

sayHello("Ryan")

// You can also write a function that takes a function as an argument
func useFunction(funcParam: () -> () ) -> Bool {
  funcParam()
  
  return true
}

func intReturnBool(age:Int) -> Bool {
  return true
}

//{ (Parameters) -> ReturnType in

useFunction({ () -> () in
  println("hello World")
})


// You can call this new function passing in either
// the original function:
//useFunction(sayHello)
//
//// or the variable
//useFunction(sayhelloFuncRef)


// 2. Functions can “capture” or "enclose the scope of" variables that exist outside of their local scope.

let outerScopeVar = 25

func captureOuterScopeVar() {
  var localVar = "Hey"
  println("OuterScopeVar is: \(outerScopeVar)")
}
captureOuterScopeVar()


// 3. There are two ways of creating functions: with the func keyword, or with { }. Swift calls the latter “closure expressions”.

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// Backwards sort using function reference
func backwards(s1: String, s2: String) -> Bool {
  return s1 > s2
}

var reversed = sorted(names, backwards)

struct User {
  let name:String
}

let user1 = User(name: "Barry")
let user2 = User(name: "Dan")

let usersReversed = sorted([user1, user2], { (u1:User, u2:User) -> Bool in
  return u1.name > u2.name
})

func sortAlphabetical(s1:String, s2:String) -> Bool {
  return s1 > s2
}

//class UserManager {
//  let users:[User]
//  
//  
//  
//  func reverseUsers() {
//    
//  }
//}

// Backwards sort using "closure expression"
reversed = sorted(names, { (s1: String, s2: String) -> Bool in
  return s1 > s2
})


// 1) SWIFT BLOCKS (CLOSURES) SYNTAX


//{ (Parameters) -> ReturnType in
//    ...
//}
