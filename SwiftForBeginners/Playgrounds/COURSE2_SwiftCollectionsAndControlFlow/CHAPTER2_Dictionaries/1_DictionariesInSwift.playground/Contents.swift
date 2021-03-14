import Foundation


/**
 `CHAPTER 2`
 `Dictionaries in Swift`
 INTRO CHAPTER 2 —The second collection we are going to look at is
 a `Dictionary` . In contrast to an `Array` — which is an ordered list —
 the `Dictionary type` works on the premise of `key value pairs`
 much like a real dictionary .
 */
/**
 `1 Introduction to Dictionaries`
 To understand what a `Dictionary` does ,
 let's look at an actual dictionary .
 A real dictionary is a reference that contains words in a language .
 To understand what a word means ,
 you look up a word
 and then read the meaning provided beside it .
 As an example ,
 you could look up the word _bread_
 and see that its meaning is food made by baking a mixture of flour , water , and yeast .
 If you think of the word _bread_ as a `key` ,
 and the meaning as a `value` .
 A `Dictionary` is comprised of a set of `key value pairs` .
 This is basically what a Swift Dictionary is .
 A set of key value pairs .
 Let's see what this means in code .
 */

let airportCodes: [String : String] = [

    "LGA" : "La Guardia" ,
    "LHR" : "Heathrow" ,
    "CDG" : "Charles de Gaulle" ,
    "HKG" : "Hong Kong International" ,
    "DXB" : "Dubai International"
]

/**
 We are creating a `Dictionary` by using a set of square brackets ,
 just like an Array :
 
 `let airportCodes: [String : String] = [ ... ]`
 
 We are creating a `Dictionary`
 ( 1 ) to store these `key value pairs` ,
 and ( 2 ) assign them to a `constant` , called `airportCodes` .
 
 `NOTE`: Like we did with the `Array` ,
 actually (`A`) creating a `Dictionary`,
 and then (`B`) assigning it to a `constant`,
 those are two separate things .
 
 Just like with an `Array` ,
 the type is a high level look
 in what is in the Dictionary .
 
 `let airportCodes: [String : String] = [ ... ]`
 
 So the type over here is
 `String` for the `key`
 and `String` for `value` .
 And we read this as _String to String_ .
 So this is a _Dictionary of type String to String_ .
 Because our type is `String to String` ,
 the keys have to be Strings
 and the values have to be Strings as well .
 
 `NOTE`: You do not need to explicitly mention the type .
 Swift can infer that for you :
 
 `"LGA" : "La Guardia" , ...`
 
 The colon tells Swift
 that what is on the left is the `key` ,
 and on the right is the `value` .
 
 `TIP`: If you ever want to look at a type ,
 you can check it
 by holding the OPTION key on your keyboard ,
 which then gives you this question mark as you hover over things .
 And then we click on `airportCodes` ,
 you will see the type listed exactly how we wrote it .
 
 The difference between an `Array` and a `Dictionary` , is ,
 that an `Array` simply takes a _list of values_ ,
 whereas a `Dictionary` takes a _key and a value pair_ .
 Dictionaries — unlike Arrays — do not preserve any order .
 In an Array , when we add new items ,
 they are always added to the end of the list
 unless we `insert()` it .
 And whatever way we add it ,
 whether we `insert()` or `append()` ,
 that order is maintained .
 Dictionaries don't care about that ,
 and store things in whatever order they please .
 The reason for that is
 because we don't need any order
 to refer to any of the values .
 The rule of thumb , when you are writing code , is ,
 if the order of what you are storing matters to you ,
 then don't use a `Dictionary` .
 */
