import Foundation


/**
 `COURSE 7`
 `Protocols in Swift`
 INTRO —Called interfaces in other languages ,
 protocols define a blueprint of methods , properties , and other requirements
 that suit a particular task or piece of functionality .
 Protocols allow us to build flexible ,
 decoupled objects
 without the limitations of inheritance .
 In this course , we’ll learn
 how to write basic protocols in Swift ,
 how they are used in iOS development ,
 and how they lead better code reuse .
 
 What you will learn :
 `•` Protocol Syntax
 `• `Protocol as Types
 `•` Protocol Composition
 */


/**
 `CHAPTER 1`
 `Protocol Basics .`
 INTRO CHAPTER 1 — Protocols are used in many languages
 to model the interface of an object
 without thinking about the implementation details .
 While this seems odd , it allows us
 to build well thought out contracts between objects
 rather than diving into the nitty gritty first .
 In this set of videos ,
 we start by exploring the syntax of protocols
 and the different sets of relationships they can help us model .
 */
/**
 `1 What is a Protocol ?`
 INTRO —In this video ,
 we'll explore the conceptual basics of protocols
 with a somewhat real world analogy .
 */
/**
 Most businesses declare what they do up front and explicitly .
 I know for a fact that
 Starbucks , Dunkin' Donuts , or Tim Hortons will serve me a cup .
 Because by stating they are coffee shops ,
 I expect them to fulfill certain behaviours .
 I know that they have coffee bags available .
 And I know that , at minimum , they can brew me a cup of coffee .
 The knowledge of this minimum behaviour makes it easy for me
 to find a coffee shop every morning and get a cup of coffee .
 Similarly , when building software ,
 one of the cornerstones of Object-Oriented Programming is
 being able to define a set of behaviours expected of objects in a particular situation .
 Just like the coffee shop , we'd like to have some way to guarantee
 that our objects model the attributes and behaviours , that is ,
 have the properties and methods that we expect them to have .
 And this is where protocols come in .
 In other languages ,
 protocols are called _interfaces_ .
 But the concept is the same .
 They define a blueprint of
 methods ,
 properties ,
 and other requirements
 that suit a particular task or piece of functionality .
 It allows us to define a set of expected behaviours .
 Let's say that we are developing an app that allows some sort of social network .
 And we have different models that represent people in some way :
 User model , a Friend model , and so on .
 For each of these models , we want to be able to get the user or friend's full name .
 So let's write a protocol for that :
 */

protocol FullNameAble {
    
    var fullName: String { get }
}

/**
 We said that a protocol serves as
 a blueprint for some functionality or behaviour .
 This means that
 a protocol only describes
 what an implementation of this functionality looks like .
 But unlike a class or struct ,
 it does not provide an implementation .
 The line of code that we just added
 states that whatever type adopts this protocol ,
 must have a stored property called `fullName` that is of type `String` .
 Furthermore , we have stated that this property is only a gettable property . That is ,
 we can read the property ,
 but not set it after we have given it an initial value .
 */
