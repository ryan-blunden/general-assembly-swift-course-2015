////////////////////////////
///   CLOSURS PLAYGROUND ///
////////////////////////////

// Helpful article: http://airspeedvelocity.net/2014/06/11/a-basic-tutorial-on-functions-and-closures-in-swift/


// 1. Functions can be assigned to variables and passed in and out of other functions as arguments, just as an Int or a String can be.

// This is a function that takes an Int and prints it.
func sayHello(name:String) {
  println("Hello \(name)!")
}

// This assigns the function you just declared
// to a variable.  Note the absence of () after the
// function name.
let sayhelloFuncRef = sayHello

// Now you can call that function using your variable.
//sayhelloFuncRef()

// You can also write a function that takes a function as an argument
func useFunction(funcParam: (name:String) -> () ) {
  funcParam(name:"Ryan")
}

// You can call this new function passing in either
// the original function:
useFunction(sayHello)

// or the variable
useFunction(sayhelloFuncRef)


// 2. Functions can “capture” variables that exist outside of their local scope.

let outerScopeVar = 25

func captureOuterScopeVar() {
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

// Backwards sort using "closure expression"
reversed = sorted(names, { (s1: String, s2: String) -> Bool in
  return s1 > s2
})
