import Foundation


/**
 `3 Switch Statements`
 INTRO —A `switch statement` can be thought of
 as the Swiss Army knife of `conditional statements`
 because it takes most of what we have learned so far
 and combines it all into a `single statement` .
 In this video , let's look at
 the syntax and some basic usage .
 */
/**
 The `switch statement` is an extremely powerful construct .
 A `switch statement` considers a `value`
 so that you can compare it against several different `matching patterns` .
 
 `switch value to consider {`
 
 `case value1 : Respond to value1`
 `case value2 : Respond to value2`
 `case value3 : Respond to value3`
 `default     : Do something else`
 `}`
 
 After the `switch` keyword
 we provide a `value` to consider ,
 then we start the body of the `statement` with braces .
 The body of a `switch statement` is made up of
 a bunch of different cases .
 Think of it this way ,
 let's say we had an `if statement` that had many clauses ,
 rather than have a lot of `else if statements` ,
 each `case` in a `switch statement`
 represents a particular path for the code .
 To match against a _case_ , we write the keyword `case`
 followed by the pattern that the value has to match .
 Following this , we place a _colon_ and the code to be executed .
 If none of the cases match , then we include a `default case` .
 `Switch statements` are really powerful
 so much so that we are only going to look at
 a small subset
 of what it can do for now .
 We need to learn certain other things about Swift
 before we can fully use it ,
 but let's start with a really simple example :
 */

let airportCodes: [String] = [
    
    "LGA", "LHR", "CDG", "HKG", "DXB"
]


for airportCode in airportCodes {
    
    switch airportCode {
    
    case "LGA" : print("New York")
    case "LHR" : print("London")
    case "CDG" : print("Paris")
    case "HKG" : print("Hong Kong")
    default    : print("Unknown airport code.")
    }
}

/**
 So now in this `loop` ,
 every time we go over the `array` ,
 we grab each value one at a time
 and assign it to the `airportCode constant` .
 The `switch statement` doesn't care about where this `value` comes from .
 All it cares about , is ,
 that it has a value
 that it can compare against different cases .
 
 `NOTE` :
 It is convention to name your `constant`
 the singular version of your array name ,
 
 `for airportCode in airportCodes { ... }`
 
 so that it is obvious to the reader of your code
 that this array contains many airport codes ,
 and when we iterate over each one ,
 we assign a single value to the `airportCode constant` .
 

 So far `switch statements` look oddly like an `if else statement`
 but with a lot more syntax .
 In the next video we'll look at
 how we can use the `switch statement`
 for a more complex `pattern matching` with very little extra code .
 */
