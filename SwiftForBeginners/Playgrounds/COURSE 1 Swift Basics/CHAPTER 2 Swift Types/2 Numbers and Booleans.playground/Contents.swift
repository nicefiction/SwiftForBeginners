import Foundation


/**
 `2 Numbers and Booleans`
 INTRO —Besides text ,
 the most common piece of information we work with on a day to day basis is
 numbers .
 In programming there are several different ways we can express numeric data
 and in this video
 we take a look at the various Swift types
 — `Int` ,
 `Double` ,
 and `Float` —
 that let us do so .
 */
/**
 `2.1 Integers`
 `ANGELA YU` : 
 Instead of writing `height * height` ,
 one could write the Integer to the power of 2  :
 */
let height: Int = 5

let heightHeigt = pow(Decimal(height) , 2)
print(heightHeigt)

/**
 `2.2 Floating point numbers`
 In Swift floating point numbers are represented by two different types :
 `Double` and `Float` .
 A `Double` can represent a value having at least 15 decimal digits
 while a `Float` can be as little as 6 decimal digits .
 The two different types , again ,
 have to do with the size of the number
 and how they are stored in memory .
 An Apple's guidance on the matter ,
 and basically all you need to know for now , is ,
 to use the `Double` type ,
 unless you specifically need `Float` .
 
 `2.3 Boolean`
 Booleans are represented and written with the keywords `true` and `false` ,
 but it is actually a binary value under the hood .
 Now binary means that it is either a `1` or a `0` .
 Swift actually reads that as a `1` for `true` or a `0` for `false`.
 */


/**
 `TEACHER’S NOTES` :
 ( A ) You can declare
 multiple constants
 or multiple variables
 on a single line ,
 separated by commas :
 */
var x = 0.0 , y = 1.0 , z = 2.0
/**
 You can define
 multiple related variables
 of the same type
 on a single line ,
 separated by commas ,
 with a single type annotation
 after the final variable name :
 */
let blue , green , red: String


/**
 `ANGELA YU` : 
 There are different ways of converting data into Strings .
 To round off a Double , or Float to two decimal places :
 */
let bmiResult = 23.1234567
String(format : "%.2f" ,
       bmiResult)

print(bmiResult) // returns "23.12"
/**
 We are expecting the format to be expressed as a String :
 `format : "%.2f"`
 And we are going to specify that we want to round off
 whatever we put in bmiResult — a Float or a Double —
 to only two decimal places :
 `"%.2f"`
 */
