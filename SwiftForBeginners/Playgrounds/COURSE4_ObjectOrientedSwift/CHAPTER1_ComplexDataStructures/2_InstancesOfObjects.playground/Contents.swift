import Foundation


/**
 `2 Instances of Objects`
 INTRO —Using the blueprint we created ,
 we can create individual copies of the `struct` to work with .
 These copies are known as `instances`
 and allow us to associate specific values with the object to encapsulate data .
 */

struct Point {
    
    let x: Int
    let y: Int
}


let coordinatePoint = Point(x : 0 , y : 1)
coordinatePoint.x

/**
 When we declare the `struct Point` .
 What we are essentially doing , is ,
 creating a blueprint .
 This `struct` doesn't have any values associated with it
 because it doesn't represent anything concrete .
 What it does represent , is ,
 a blueprint from which we can create many different coordinate Points .
 We are creating an `instance` of the `struct Point` :
 
 `let coordinatePoint = Point(x : 0 , y : 1)`
 
 This `struct` ...
 
 `struct Point {`
 
    `let x: Int`
    `let y: Int`
 `}`
 
 ... is the blueprint,
 and by passing in different values ...
 
 `let coordinatePoint = Point(x : 0 , y : 1)`
 
 ... we can create different end results .
 The title for this course is `Object Oriented Programming` .
 And that refers to a programming paradigm
 or a style of programming
 where we model data in what we call `objects` .
 These `objects` are `data structures`
 that contain pieces of information .
 A `struct` is an `object` in this sense
 because it is a `data structure`
 that contains information
 in the form of `stored properties`.
 The main reason we do this , is ,
 because we can `encapsulate data` .
 That sounds complicated , so let me explain .
 When we simply declared constants up here ...
 */

let x1 = 0
let y1 = 0

/**
 ... to store the `x` and `y` coordinates ,
 there was no meaningful way to indicate
 that those pieces of data were tied together .
 And that `x1` didn't mean anything without the `y1` in this context .
 By creating an `object` called `Point`
 and adding `stored properties` ,
 
 `struct Point {`
 
    `let x: Int`
    `let y: Int`
 `}`
 
 we have indicated that this data
 — the `x` and `y` coordinate — work together ,
 they are a unit .
 These properties don't exist outside the scope of the `struct` ,
 and to use them,
 we need a valid `instance` :

 `let coordinatePoint = Point(x : 0 , y : 1)`
 
 Let's recap what we just covered ,
 `object oriented programming` , is a style of programming
 wherein we model information into `data structures` or `objects` .
 One particular kind of `object` — we’ll take a look at others — is a `structure` .
 We create a `structure` using the keyword `struct`
 and to this container we can add information in the form of `stored properties` .
 A `stored property` has syntax similar to
 when we normally declare `constants` or `variables` :
 */

struct Human {
    
    let name: String
    let age: Int
}

/**
 `NOTE`: Earlier , we learned about `type inference` in Swift
 and how the compiler could figure out what type your data was .
 This made it unnecessary to specify the type explicitly
 and we could omit it if we wanted to . With `stored properties` ,
 even though they just look like `variables` or `constants`
 that rule does not apply
 and we are required to give it a type . _Why is this ?_
 Well , when we declare `stored properties` ,
 we don't give it any initial values
 so the compiler cannot infer what the type should be .
 We specify the type , so that , when we do eventually create an instance
 and assign a value to the `property` ,
 the compiler can ensure that we only accept a value
 that matches the type that we want .
 Using this blueprint
 we can then create an instance :
 */

let dorothy = Human(name : "Dorothy" , age : 17)

/**
 This looks very similar to a `function` with `parameters` and `arguments`
 and really that is all it is .
 
 `NOTE` : There is some work going on behind the scenes
 to take these `parameters` and assign it to our `stored properties` .
 We'll call that _compiler magic_ for now
 but we are going to implement it ourselves later .
 */
