//: Playground - noun: a place where people can play

import UIKit


////////////////////////
///   CONTROL FLOW   ///
////////////////////////

// Two main structures for reacting to the state of your code
//  - if/else if/else
//  - switch

//--- If, else if, else ---//

// Testing an optional before we use it
var optionalName:String? = "The Dude"

// Version 1 - if let syntax
if let nameValue = optionalName {
  println("Use the unwrapped value from optionalName: '\(nameValue)'")
}
else {
  println("No value for `nameValue`")
}

// Vesion (Try to avoid)
if optionalName != nil {
  println(optionalName!) // Unbox optionalName's value now that we know it's safe to do so
}

// Version 1 is the preferred way to do this as it's safer and `nameValue` scope is limited to the if statement

// Examplple of multiple in a statement conditions

// && means AND = all statements must evaluate to true

var mealOfChampions = ["meat pie", "tomato sauce"]
if contains(mealOfChampions, "meat pie") {
  println("Ripper")
}
  // Even though this is also true, Swift will stop looking for options as soon as it finds an option that returns true
else if contains(mealOfChampions, "meat pie") && contains(mealOfChampions, "tomato sauce") {
  println("You bloody ripper")
}
else {
  println("Rabbitfood...again.")
}

// || neans OR = if any of the statements are true
var menu = ["pizza", "chicken parma"]
if contains(menu, "sushi") || contains(menu, "chicken parma") {
  println("Let's eat here")
}


// You can combine && and ||
var restaurant = (food:"cheap", drinks:"fully licensed", style:"chinese", location:"close")
if (restaurant.food == "cheap" && restaurant.drinks == "BYO") || restaurant.location == "close" {
  println("Let's go here")
}

// Sometimes if/else else gets out of hand

enum Direction {
  case North
  case South
  case East
  case West
}

let walkingDirection = Direction.East

// This works but it's a bit hard to read
if walkingDirection == .North {
  println("Walking North")
}
else if walkingDirection == .South {
  println("Walking South")
}
else if walkingDirection == .East {
  println("Walking East")
}
else {
  println("Walking West")
}

// Switch statements to the rescue!


//------------------------------------------


//--- Switch ---//

switch walkingDirection {
case .North:
  println("Walking North")
  
case .South, .East, .West:
  println("Not walking North")
}

// Switch statements must be exaustive (covers all options)
switch walkingDirection {
case .North:
  println("Walking North")
  
// Without this, Swift would complain
default:
  println("Not walking North")
}


// Switch statements can do more than straight up matching
var planeSeatNumber = (row:19, seat:"A")

// The `_` means you don't care about that value

switch planeSeatNumber {
case (_, "C"):
  println("Scored a window seat")
  
case (19, "A"):
  println("Isle seat near the back")

default:
  println("Enjoy your flight")
}


//------------------------------------------


//////////////////////
///   ITERATING   ///
/////////////////////

// for, for in, for (x, y) in, while

// Arrays
let temperatures = [23, 20, 18, 15, 14, 10, 0]

for temperature in temperatures {
  if temperature <= 10 {
    println("Freezing")
  }
  else {
    println("Not too bad")
  }
}

let leadingGoalKickers = [
  "Joshua Kennedy": 22,
  "Josh Bruce": 17,
  "Jay Schulz": 16
]

for (name, goals) in leadingGoalKickers {
  println("Player \(name) has kicked \(goals) so far this season.")
}
println("GO THE HAWKS!!!!") // This just here because


// Iterating over a list of user defined things
struct User {
  let email:String
  let password:String
}

var users = [User]()

users.append(
  User(email: "dude@gmail.com", password: "dude")
)
users.append(
  User(email: "henry@hotmailcom", password: "cottensox")
)


// Doing simple user authentication
var enteredEmail = "dude@gmail.com"
var enteredPassword = "dudes"

// Presume we won't find a match
var userAuthenticated = false

for user in users {
  if enteredEmail == user.email && enteredPassword == user.password {
    userAuthenticated = true
    break // This means stop the for loop as we don't need to continue
  }
}

if userAuthenticated {
  println("Access granted")
}
else {
  println("Access denied")
}


// Jumping a bit ahead, but doing the same thing via array filtering
if let user = (users.filter { $0.email == enteredEmail && $0.password == enteredPassword }).first {
  println("Access granted to \(user.email)")
}
else {
  println("Access denied")
}
