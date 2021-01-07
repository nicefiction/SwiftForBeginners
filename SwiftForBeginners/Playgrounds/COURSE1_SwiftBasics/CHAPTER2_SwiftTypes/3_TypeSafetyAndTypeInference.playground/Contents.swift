import Foundation


/**
 `3 Type Safety and Type Inference`
 INTRO —We mentioned at the start of this course that Swift was
 a safe language .
 What makes it safe ?
 Let's find out !
 */
/**
 Swift is a statically typed language .
 In Swift ,
 once you declare a variable or a constant
 to be of a particular type
 it is always that type .
 The reason for this is , that the compiler can then perform checks for you
 and make sure you are not making any mistakes .
 This helps us of void errors early on
 and reduce the number of bugs in our code . For example ,
 let's say we have a form in our app
 and we asked for a user's zip code
 and were expecting an integer value to come out of that .
 Well , because we can only accept an integer value ,
 we can make sure that the user does not type anything else that does not pass in , floating point value for example .
 This work that the compiler does is known as `type checking` .
 
 `Type Safe Language`
 Swift encourages programmers to be clear
 about the types of values their code can work with :
 */
let name: String = "Dorothy"
let age: Int = 17
let isFromOz: Bool = true
