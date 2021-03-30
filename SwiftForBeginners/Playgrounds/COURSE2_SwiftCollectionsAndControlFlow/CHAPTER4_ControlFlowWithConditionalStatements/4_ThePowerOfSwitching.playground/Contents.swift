import Foundation
import GameKit


/**
 `4 The Power of Switching`
 INTRO —`Switch statements` can do much more than a single match
 and in this video , let's take a look at
 how we can match against multiple patterns .
 */
/**
 Okay , so far
 even though what we did was pretty cool ,
 what we have here is
 mostly just an if statement
 with different keywords .
 So each of these cases is an `if else` .
 So why can't we just use an `if statement` ?
 Well , let's see how `switch statements` really shine
 by adding a few more values to the array .
 These new additions are the second international airports in
 London , New York , and Paris respectively :
 */

let airportCodes: [String] = [
    
    "LGA", "LHR", "CDG", "HKG", "DXB" , "LGW" , "JFK" , "ORY"
]


for airportCode in airportCodes {
    
    switch airportCode {
    
    case "LGA" , "JFK" : print("New York")
    case "LHR" , "LGW" : print("London")
    case "CDG" , "ORY" : print("Paris")
    case "HKG"         : print("Hong Kong")
    default            : print("Unknown airport code.")
    }
}

/**
 Each case can match against multiple values .
 If the value that we are considering is either `"LGA"` or `"JFK"` ,
 then print `"New York"` .
 */
/**
 But let's take this a step further :
 
 `import GameKit`
 */

var randomTemperature: Int = GKRandomSource.sharedRandom().nextInt(upperBound : 100)


switch randomTemperature {

case 0..<32   : print("It is freezing cold . Stay inside .")
case 32..<45  : print("It is quite cold . Wear a jumper .")
case 45..<70  : print("It is rather chilly outside . Wear a light sweater .")
case 70...100 : print("It is warm outside. Wear a T-shirt.")
default       : print("It is baking hot. Stay inside .")
}

/**
 Isn't that awesome ,
 a `switch statement` can match on more than just a single value .
 Hopefully , this glimpse into the flexibility of the `switch statement`
 should show you
 why they are preferred over `if statements` :
 
 `1.` A switch statement lets you switch on a range of values .
 `2.` A switch statement combines multiple pattern matches in a concise syntax .
 `3.` A switch statement can infer the type being switched on
     and provides compiler checks .
 `4.`A switch statement requires you to be exhaustive
     and consider every path your code can take .
 */
