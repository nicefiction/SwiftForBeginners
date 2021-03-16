import Foundation


/**
 `COURSE 4`
 `Object-Oriented Swift`
 INTRO —We have been working with
 simple _primitive values_ so far
 but now it is time to upgrade our skills !
 Swift allows you to create _custom data types_
 using `structures` and `classes` .
 Both `structs` and `classes` achieve the same goal
 — they allow you to create custom data types
 to (`A`) store
 and (`B`) pass data around
 in your code ,
 but they do this in different ways .
 In this course ,
 we take a look at
 how to create custom objects ,
 how to store and manipulate the data in these objects
 and how to create instances of them to work with .
 
 What you will learn :
 `•` Structures
 `•` Classes
 `•` Inheritance
 `•` Value types
 `•` Reference types
 */



/**
 `CHAPTER 1`
 `Complex Data Structures`
 INTRO CHAPTER 1 —We are going to try our hand at
 modelling a simple tower defence game .
 The simplest data point that we need to model is a `Point`
 and in the first set of videos ,
 we will look at
 how a `structure` makes it really easy to model a coordinate point .
 We will look at creating instances of _points_ using this blueprint
 as well as writing methods to work on the data stored in an instance .
*/



/**
 `1 Introduction to Structs`
 INTRO —In this course ,
 we are going to model
 a simple tower defence game .
 We will start by using the knowledge we already have
 - using `primitive data types` , `collections` , and `tuples` .
 This way has its limitations ,
 and we will take a look at
 how `structs` make it much more elegant
 to implement `custom data types` .
 */
/**
 We have worked with `Strings` ,
 numbers in the form of `Int` , `Doubles`, and `Float` ,
 collections such as `Array` and `Dictionary` ,
 and logic in the form of `Boolean true` and `false` .
 These types have served us well
 and enabled us to write plenty of code .
 But there comes a time
 when the built in types don't model data well enough for us .
 For example , when I think of my fellow teacher Ben ,
 I don't think of Ben as
 a `constant` called _name_
 with a `String` value _Ben_ ,
 an integer variable for his age , and so on .
 These individual types allow us to create data points
 to model different aspects of Ben
 but individually they don't make much sense .
 Ben's name and age are a part of who Ben is ,
 not a random data point .
 Luckily for us ,
 swift allows us to create complex and custom data types .
 Let's imagine we are building a game .
 We need to figure out a way
 to store the location or coordinate information
 where either a tower or an enemy is .
 Without this information ,
 we can't really proceed and model anything else .
 Let's try and store this information
 using the knowledge we currently have :
 
 `SOLUTION 1` :
 We could declare two constants `x1` and `y1` to store a coordinate .
 */

let x1 = 0
let y1 = 0

/**
 These two values together
 represent a single coordinate point .
 And this works ,
 but we need these two data points to be related to one another
 because by themselves , they only paint half the picture .
 
 `SOLUTION 2` :
 We could use a `Tuple` to return multiple values .
 */

let coordinatePoint: (x: Int , y: Int) = (x : 0 , y : 0)

coordinatePoint.x // 0
coordinatePoint.y // 0

/**
 We can use a `Tuple`
 to combine these numbers
 into one single compound value .
 I can then assign names to these values ,
 so that we can refer to them easily .
 This seems to work ,
 but we are going to be dealing with
 lots of different coordinates all over our map ,
 locations where the enemies are
 and where the towers are placed , and so on .
 
 `SOLUTION 3` :
 We could store different values like this in an `Array`
 but that is also inconvenient
 because there is no meaningful way
 to understand what point is associated with a particular enemy .
 
 `SOLUTION 4` :
 We could also do this with a `Dictionary` ,
 where let's say , an enemy is the `key` ,
 and then we have `values` for points and things on that
 but that still is cumbersome .
 
 `SOLUTION 5`  :
 So , to do this , we are going to create a `custom type`
 using a `construct` known as a `structure` .
 A `structure` — or `Struct` — is a flexible data type
 that allows you
 to group together
 related values
 and model them
 as a unit .
 We are going to create a `Struct`
 to model a point on our map :
 */

struct Point {
    
    let x: Int
    let y: Int
}

/**
 `Point` is the name of our custom data type .
 */

let point = Point(x : 0 , y : 1)

/**
 This looks like a function
 that takes an argument for `x` and `y` .
 A `Struct` can define constants or variables ,
 
 `let x: Int`
 `let y: Int`
 
 which we call `properties`
 to store values.
 More specifically , they are called `stored properties` .
 
 `NOTE` : Notice that we are not assigning any value to `x `and `y` ,
 and that is okay .
 */
