//: Playground - noun: a place where people can play

println("Welcome to the Playground!")




//////////////////////
///   VARIABLES    ///
//////////////////////


//--- let ---//

// `let` is for constants, meaning its value won't change. Ever!

let name = "Brad" // This is good
let otherName = String("Brad") // The String() is not neccesary


let explitlyTypedName:String = "Jess" // Explictly typed, not really neccesary

// Sometimes you don't know the value you need to assign when you create the variable
let nameTobeDefinedLater:String
// Different section of code...
nameTobeDefinedLater = "Barry"


//--- var ---//

// `var` is for when things need to change value
var currentlyLoggedInUserName = "Dan"
// Dan logs out...
currentlyLoggedInUserName = "Sally"

// We can assign the "values" of one variable to another
var x = 10
var y = x
x = 5
y // Y is 10 as `y = x` means "Take the value that x is and assign that vale to y". It doesn't bind y to x's value


//--- Type Casting ---//

//let age = Int("16") This doesn't work as Swift can't reliably convert any string to a integer
let ageString = String(33) // This is fine as an Integer knows how to convert itself to a string


//////////////////
///   TYPES    ///
//////////////////

var myBool = true // Or false

var myInteger = 12

var myDouble = 12.4

var myOtherDouble:Double = 12 // 12.0

var myFloat:Float = 3.14159265358979323846264 // Only prcise to 5 decimal points

//----------------------------------

/// Arrays ///
var photos = ["dog", "emu", "zebra", "cat", "fish"]
var weatherTemperatures = [15, 21, 18, 11, 10]


// Accessing elements
photos.first
photos[0] // Array indexes start from 0

photos.last
photos[count(photos) - 1]

// Manipulating arrays
let lastPhoto = photos.removeLast() // Removes the last element from the array and returns it
photos.append("elephant")
let elementToRemove = photos.removeAtIndex(0) // Remove an element at a specific index

// Sorting
photos.reverse() // Note that this doesn't change the array, it returns a reversed version of it
photos
photos.sort { $0 < $1 }
photos // Sort DOES change the array

// More info on Arrays - https://goo.gl/PIZyod

//----------------------------------

/// Dictionaries ///

// Arrays are great for a linear list of things.
// Dictionaries are great for a list of things identifiable by a name/label




// More info on Dictionaries - https://goo.gl/tLQAZG

//----------------------------------

/// Structs - for "structured" data ///
struct ScreenResolution {
  let width:Int
  let height:Int
  
  func pixels() {
    width * height
  }
  
  // These methods are equivalent, this one just explicitly states the
  // return type and includes the return statement
  func pixelsExplicit() -> Int {
    return width * height
  }
}
ScreenResolution(width: 640, height: 480).pixels()
ScreenResolution(width: 640, height: 480).pixelsExplicit()

//----------------------------------

/// Enums ///
// Use an enum when something has a limited set of values and can only be ONE of those values

// This is how we'd do it without an Enum
let highlyClassified = 1
let classified = 2
let restricted = 3
let open = 4

var jamesBondClearance1 = highlyClassified
if jamesBondClearance1 == highlyClassified {
  println("Access All Areas")
}


// What's icky about this is we've introduced four seperate variables that as far as Swift is concerned,
// having nothing to do with each other, yet, they are all options for the one thing, security access.

// Enums allow us to wrap this up into a single type.

enum SecurityClearanceLevel {
  case HighlyClassified // We don't care about the value, we just need a way to match on the chosen type later
  case Classified
  case Restricted
  case Open
}

var jamesBondClearance = SecurityClearanceLevel.HighlyClassified

// This enables our code to check against a defined type
if jamesBondClearance == .HighlyClassified {
  println("Access All Areas")
}
else {
  println("Access Denied")
}

// Let's use it in a struct
struct SecretAgent {
  let codeName:String
  let clerance:SecurityClearanceLevel
}

// Note: We don't need to put the `SecurityClearanceLevel` in front of .HighlyClassified
// as Swift knows that `clearance` is of type `SecurityClearanceLevel`
let bond = SecretAgent(codeName: "James Bond", clerance: .HighlyClassified)
if bond.clerance == .HighlyClassified {
  println("Welcome \(bond.codeName)")
}

//----------------------------------

/// Tuples ///
// Easily group related values to together

let screenCoordinate = (x:400, y:620)
screenCoordinate.x
screenCoordinate.y

// I would avoid this syntax, it's so easy to attach labels and it's much more explicit what value you're getting
let boxSize = (640, 480)
boxSize.0
boxSize.1


/// Classes - Your own custom types ///
// We'll cover this when we look at Object Oriented Programming
class UserAuthenticationManager {
  func authenticate(email:String, password:String) {
    // Do auth logic here
  }
}


// Types really come into their own when you start nesting them 
// Good but complex example - https://goo.gl/daxJIq

//----------------------------------


/////////////////////
///   OPTIONALS   ///
/////////////////////

var userMiddleName:String? = "Mark" // The ? means optionally nil
var thisIsSillyNil:String? = nil // Nil is the value in the absence of a value
// Another user comes along
userMiddleName = nil // Legal because its value can be nil

// Providing a default when accessing an optional that might be empty
var pleaseSpamMeDefault = true
var userSelectedDontSpamMe:Bool?
var spamMe = userSelectedDontSpamMe ?? pleaseSpamMeDefault

// Using ! means you're telling Swift you're 100% sure the boxed value is not nil. This is called "unwrapping" the optional.
// I would caution you using this unless you are 100% sure. Otherwise, use the tools Swift gives you to handle un-boxing of optional values


//print(userMiddleName!) // This stop the rest of the palyground from compiling (and would crash in a real app)


//--- Optionals in if statements ---//

// This is awkward
if userMiddleName != nil {
  println("User has a middlename: '\(userMiddleName!)")
}

// This is better!
// The `userHasMiddleName` is limited to the scope of the if statement and the `if let` syntax takes care of un-boxing the value for us.
userMiddleName = "Terrence"
if let userMiddleNameValue = userMiddleName {
  println("User has a middlename: '\(userMiddleNameValue)'")
}


//--- Optionals with case statements ---//

// .Some(let <varName>) lets us test whether the optional has a value

// Here is a struct that represents a user where `middleName` is optional
struct User {
  let firstName:String // These are the struct's "properties"
  let lastName:String
  let middleName:String?
  
  //NOTE: An initialiser is created for us automatically which sets of the properties of our struct
  
  func fullName() -> String {
    switch(middleName) {
    case .Some(let middleNameValue):
      return "\(firstName) \(middleNameValue) \(lastName)"
      
    default:
      return "\(firstName) \(lastName)"
    }
  }
}

let userWithMiddleName = User(firstName: "Olivia", lastName: "Newton", middleName: "John")
userWithMiddleName.fullName()

let userNoMiddleName = User(firstName: "Jack", lastName: "Sparrow", middleName: nil)
userNoMiddleName.fullName()

// We'll cover "Optional Chaining" later when we get into classes but for the impatient - https://goo.gl/vDrHkn
