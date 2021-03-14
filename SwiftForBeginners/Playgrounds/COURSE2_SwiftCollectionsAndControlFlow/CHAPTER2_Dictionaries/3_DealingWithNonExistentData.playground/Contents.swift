import Foundation


/**
 `3 Dealing With Non-Existent Data`
 INTRO —Sometimes we might try to access
 a `value` using an `index`
 that does not exist in an `Array`
 or a `key`
 that does not exist in a `Dictionary` .
 Let's see what happens in such situations .
 */

var airportCodes: [String : String] = [

    "LGA" : "La Guardia" ,
    "LHR" : "Heathrow" ,
    "CDG" : "Charles de Gaulle" ,
    "HKG" : "Hong Kong International" ,
    "DXB" : "Dubai International"
]

/**
 Let's try to get a `value` out of the `Dictionary`
 when a `key` does not exist :
 */

let orlandoAirport = airportCodes["MCO"] // nil

/**
 Our `Dictionary` does not contain
 the airport code for `"Orlando International Airport"`,
 which is `"MCO"` .
 Now rather than crashing,
 as was the case with an `Array` ,
 we just get a `value` of `nil` assigned to the `orlandoAirport constant` .
 
 `NOTE`: We’ll spend a lot of time learning about `Optionals` later ,
 but your take away from this video should be two things :
 
 (`1`) `Arrays` will always crash if you use an `index value` that does not exist .
 (`2`) `Dictionary keys` , however , always return an `optional value` .
 
 An `optional value` can either be `nil`,
 if the value does not exist ,
 or it contains the `String` .
 This is beneficial because if the `key` exists , then everything works ,
 but if it doesn't , well , we don't crash . We just get `nil` back and that is a lot safer .
 */
