import Foundation

/**
 `COURSE 8`
 `ERROR HANDLING IN SWIFT`
 INTRO —An undeniable fact of software development , is ,
 that bugs will crop in your code
 and lead to undesirable outcomes.
 Error handling is the process
 of anticipating a certain class of bugs and writing code to handle them.
 */
/**
 `ERROR HANDLING`
 INTRO CHAPTER 1 — In this course ,
 we take a look at the built in language constructs in Swift to handle errors
 including modelling our own errors ,
 throwing errors from functions
 and more .
 We also look at how Objective-C handles errors
 and what this means to us as Swift developers .
 */
/**
 `1 Types of Errors`
 INTRO — Before we dive into actually writing any error handling code ,
 it helps to define and categorize the types of errors
 that we can encounter when writing code .
 */
/**
 Being a good developer means that you can not only write code ,
 but that you can write correct bug free code .
 So far in our efforts to learn the Swift language , we have made one big assumption , that our code is error free .
 Writing code that is completely free of errors is very difficult , if not impossible .
 But we can take steps to ensure that our code contains as few errors as possible .
 This process is known as error handling . And in this short course ,
 we are going to take a look at the built-in language constructs for error handling in Swift :
 */
/**
 Error Handling
 • Error protocol
 • throw / throws
 • try
 • do
 • catch
 */
/**
 Before we talk about error handling , let's talk about errors themselves .
 What are errors ?
 An error is essentially any code that produces
 an incorrect or unexpected result ,
 or causes your program to behave in an unintended manner .
 There are different kinds of errors that can occur within your code
 and a good way to group these errors
 is based on how you , the programmer , is expected to react to them .
 Let's start with the simplest of errors , typically called , Domain Errors .
 */
/**
 `Domain Errors` :
 We often run into domain errors when we want to covert between Strings and Integers .
 For instance , we could ask customers to input weight or distance into an app .
 And this data may be input as a String in a text field .
 Swift's Int type has an init( ) method
 and we can pass in String values as arguments to convert them into Integers .
 For example , we could do something like this :
 `Int.init("1")`
 This takes the number represented as a String and converts it to a valid Integer value .
 The acceptable domain of values , that is ,
 the values that we can enter into this init( ) method and get an Integer back ,
 are String values that represent a number .
 So what if we put a word into this init( ) method ? What happens then ? :
 `Int.init("a")`
 Because the value we put in ,
 is outside of our acceptable range of values or the domain ,
 we call this a domain error .
 Swift views these types of errors as simple errors ,
 where halting the program execution is a little over the top .
 So instead Swift deals with domain errors by using optionals .
 Through the use of a failable initializer ,
 Swift can easily handle the domain error by returning nil .
 From there , we have the use of a variety of constructs
 like guard ,
 if let ,
 and optional chaining
 to handle the nil value appropriately
 and continue our program execution .
 Domain errors occur in many places and we have seen few examples of them already .
 Both incorrect input and nonexistent data raise domain errors ,
 that Swift can handle through the use of optional values .
 While we haven't explicitly called them domain errors ,
 we have gotten some practice handling them .
 And we'll continue to get more as we build more apps and write more code .
 */
/**
 Right now , we are talking about errors
 by grouping them into how you react to the error occurring .
 But there is a more common grouping of errors :
 
 1 Compiler Errors
 2 Runtime Errors
 */
/**
 1 `COMPILER ERRORS`
 1.1 `Domain errors`
 We have talked about compiler errors before .
 These are errors that the Swift compiler raises as it parses or reads your code ,
 and prevents it from running .
 Since optionals have great compiler support ,
 domain errors can be considered as compiler errors in some cases .
 */
/**
 2 `RUNTIME ERRORS`
 There are errors however that the compiler cannot catch
 and only occur when you run your program and hit a particular line of code .
 These are called runtime errors ,
 and we can react to them in two ways depending on what kind of error occurred :
 ( A ) A recoverable error ,
 and ( B ) unrecoverable errors, or failures .
 ( A ) `Recoverable errors`
 We'll spend most of our time talking about recoverable errors .
 ( B ) `Unrecoverable errors`
 These are of two types ,
 B.1 `Logic errors` that can occur from a programmer's mistake .
 B.2 `Universal errors` where we cannot anticipate the error occurring .
 Because neither of these unrecoverable errors can be really guarded against ,
 we typically crash in these occasions and deal with it in different ways .
 So let's focus on runtime errors that we can recover from .
 Because these errors can occur in many different situations ,
 let's look at a few examples and build up some good error handling code in the process .
 */
