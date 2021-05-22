import Foundation


/**
 `2 Modifying a Dictionary`
 INTRO —Much like an `Array` ,
 we can also modify the contents of a `Dictionary` .
 Rather than using `index values` however ,
 let's take a look at how we can add , update , or delete values using keys .
 */

// let airportCodes: [String : String] = [
var airportCodes: [String : String] = [

    "LGA" : "La Guardia" ,
    "LHR" : "Heathrow" ,
    "CDG" : "Charles de Gaulle" ,
    "HKG" : "Hong Kong International" ,
    "DXB" : "Dubai International"
]

/**
 `2.1 Reading from a Dictionary`:
 Like an `Array` , a `Dictionary` also uses _subscripting_ to read values .
 But instead of passing in an `index` ,
 we use a `key` to get a `value` out of the `Dictionary` :
 */

airportCodes["LGA"] // "La Guardia"

/**
 We start with the name of the collection —`airportCodes` .
 Next ,
 the subscripting syntax requires
 that we start with a square bracket
 Because a dictionary uses a set of _key value pairs_ ,
 we can use the `key` to refer to a `value` .
 */
/**
 `2.1 Updating a Dictionary`:
 What if we wanted to add new _key value pairs_
 to a `Dictionary`
 that we have already created ?
 */

airportCodes["SYD"] = "Sydney Airport"

/**
 First we start with the dictionary that we want to add information to — `airportCodes`.
 And then , like an Array , we use `subscripting notation` .
 And , instead of assigning something to an index value ,
 we assign something to a `key` — `"SYD"` .
 
 `GOTCHA`: This will create an error
 because our `Dictionary` is assigned to the `constant airportCodes` — `let airportCodes` .
 We need to change the constant to a variable , `var airportCodes` .
 
 `NOTE` : If we use a key that already exists ,
 and assign a value ,
 we end up updating an existing key value pair .
 
 As we have seen with Arrays ,
 `subscripting notation` isn't the only way we can peek inside the collection .
 Swift has some built in methods
 to use with Dictionaries , as well :
 */

// To add or update a key value pair in a Dictionary :

airportCodes.updateValue("Dublin International Airport" ,
                         forKey : "DUB")

/**
 This method is actually quite nice :
 If the `key` already exists ,
 it goes ahead and updates the `value` that we provide .
 If the `key` doesn't exist ,
 it ends up creating a new pair .
    To remove a `key value pair` from a dictionary ,
 there are two ways we can do this :
 We can either use ( 1 ) subscript notation
 or ( 2 ) we can use a method .
 ( 1 ) When we use a subscript notation ,
 it is no different than actually updating a value :
 */

// 1. Remove a `key value pair` using subscript notation :

airportCodes["DXB"] = nil

/**
 In every programming language ,
 there exists a type to represent _nothingness_ ,
 or the absence of values ,
 and in Swift this is `nil` .
 By assigning `nil` to the `key` — `“DXB` ",
 we are telling Swift
 that we want the value for `“DXB”` to be _nothing_ .
 This tells Swift that we want to get rid of the `key value pair` altogether .
 */

// 2. Remove a `key value pair` using a method :

airportCodes.removeValue(forKey : "CDG")



/**
 OLIVIER :
 */

// To create an empty dictionary :

let emptyDictionary: [String : String] = [:] // [:]
let anotherEmptyDictionary = Dictionary<String , String>() // [:]
let yetAnotherEmptyDictionary = [String : String]() // [:]
