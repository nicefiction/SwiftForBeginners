import Foundation

/**
 `COURSE 2`
 `Swift Collections and Control Flow`
 INTRO —Dealing with groups of values is
 a fundamental aspect of programming
 and is achieved
 through the use of collection types .
 In this course
 we are going to take a look at
 Swift's two primary collection types
 — arrays and dictionaries .
 In addition , we will also look at
 how we can change the path of execution of our code
 by using several control flow statements .
 
 What you will learn :
 `•` Arrays
 `•` Dictionaries
 `•` For In , While , and Repeat While loops
 `•` If and Switch statements
 */



/**
 `CHAPTER 1`
 `Introduction to Collections`
 INTRO CHAPTER 1 — In the past
 we have only worked with
 a single item of data
 in a constant or a variable .
 There is much more to this of course ,
 and working with groups or collections of data
 is an important part of programming .
 In this set of videos ,
 we will look at
 the first fundamental type that we use in Swift
 to represent these collections : Arrays .
*/



/**
 `1 Arrays`
 INTRO —A collection is a data structure
 that can hold multiple values .
 In this video ,
 we are going to introduce the first collection type : `Array` .
 We will look at Array creation as well as structure .
 So far , we have learned about `single types` ,
 a `String` , an `Int` , and so on .
 _What if we wanted to work with multiple strings at once ?_
 In programming , a `collection` is a type
 that contains multiple values .
 In Swift there are three `collection types` :
 `arrays` ,
 `dictionaries` ,
 and `sets` .
 For this course ,
 we are only going to focus on `arrays` and `dictionaries` .
 Once we have a better grasp of the basics ,
 we will talk more about `sets` in the future .
 Let's start with `arrays` .
 When we learned about variables or constants ,
 we said that a variable should be thought of as a box with a name .
 Well , an array can be thought of as several of these boxes connected to one another ,
 and instead of a name ,
 they have a number associated with it .
 The first box in the array starts with the number `0` .
 Every box after that in an array is numbered sequentially .
 In addition , instead of each box having a name ,
 now the entire collection or the array has a single name .
 The formal definition of an `array` is
 that it is an < ordered list of values > .
 To create an `Array` ,
 all you need is a set of square brackets .
 
 `[]`
 
 A set of empty box brackets
 creates an empty array .
 To put items in the collection ,
 we add values in there ,
 separated by commas .
 Once we have this `Array` ,
 we can assign that `Array`
 to a variable named `toDoList`:
 */

let toDoList: [String] = [
    
    "Finish collections course" ,
    "Buy groceries" ,
    "Respond to emails"
]

/**
 We denoted our type here as an array of Strings .
 
 `let toDoList: [String] = [ ... ]`
 
 `NOTE`: You cannot mix types in a single array .
 This is part of Swift’s Philosophy of `type safety` .
 When you declare an array of Strings ,
 the compiler expects that there always will only be Strings .
 By restricting the array to a `single data type` ,
 we can write safer code
 in that we know what is in there at all times .
 
 `NOTE`: A `String literal` is some text inside of double quotes .
 */
