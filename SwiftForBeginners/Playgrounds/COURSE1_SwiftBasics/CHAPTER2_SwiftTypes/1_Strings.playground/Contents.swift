import Foundation


/**
 `CHAPTER 2`
 `Swift types`
 INTRO CHAPTER 2 —Swift ,
 like many other programming languages ,
 distinguishes between the various types of variables
 like :
 Strings ,
 Integers ,
 Floats
 and Booleans .
 Discover what a type is
 and how we use different types when programming .
 */


/**
 `1 Strings`
 INTRO —One of the fundamental types you will work with
 when programming , is `String` .
 Strings represent text ,
 and since we use text a lot ,
 we will be using String all over the place .
 In this video ,
 we take a look at how we can create strings ,
 manipulate them ,
 and combine them in different ways .
 */
/**
 There are two ways we can create new strings using existing strings :
 `( 1 ) Concatenation`
 Concatenation uses the addition operator to add different Strings together .
 */
let country = ""
let state = ""
let city = ""

let concatenatedAddress = country + " , " + state + " , " + city
/**
 `NOTE`:
 `""` is an empty String.
 `" "` is an empty String with white space.
 Computers consider a white space
 which is an empty space here ,
 an actual thing .
 We need to be able to represent space in a computer as well .

 `NOTE` : You can only concatenate two Strings .
 You can’t concatenate a String with an Integer .
 Use String interpolation instead .
 
 
 `( 2 ) String interpolation`
 String interpolation is a way to construct a new String value
 from a mix of other Strings .
 */
let interpolatedAddress = "\(country) , \(state) , \(city)"
/**
 `NOTE`:
 With String Interpolation ,
 you can evaluate the contents of more than just Strings .
 */
let street = "SomeStreet"
let streetNumber = 1

let streetAddress = "\(streetNumber) , \(street)"
/**
 Teacher's Notes : `Multiple String Literals`:
 If you need a String that spans several lines ,
 use a multiline String literal
 —a sequence of characters surrounded by three double quotation marks .
 */
let quotation = """
The White Rabbit put on his spectacles . "Where shall I begin , please your Majesty ?" he asked .
"Begin at the beginning ," the King said gravely , "and go on till you come to the end ; then stop ."
"""
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
 `String( ... )`
 And we are going to specify that we want to round off
 whatever we put in bmiResult — a Float or a Double —
 to only two decimal places :
 `"%.2f"`
 */
