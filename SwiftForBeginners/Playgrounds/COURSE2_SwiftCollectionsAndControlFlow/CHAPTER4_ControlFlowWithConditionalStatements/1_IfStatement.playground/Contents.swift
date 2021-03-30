import Foundation


/**
 `CHAPTER 4`
 `Control Flow With Conditional Statements`
 INTRO CHAPTER 4 —Now that we know about `loops` ,
 let's look at the next set of `control flow statements` at our disposal
 — `condition statements` . We will take a look at
 `if` and `switch statements`
 along with a set of `logical operators`
 that allow for `compound expressions` .
 */



/**
 -> `1 If Statement`
 INTRO —The `if statement` is a `conditional statement`
 that allows you to change the flow of program execution
 based on certain conditions .
 */
/**
 It is useful to be able to evaluate some code
 based on a certain set of conditions ,
 as we just saw with the `while` and `repeat while loops` .
 The `while loops` , though ,
 are an all or nothing form of logic :
 _While the plane is taking off ,_
 _you have to have your seat belt fastened ._
 What about in situations where ,
 depending on a condition ,
 something happens ,
 but in the absence of that condition ,
 something else happens ?
 */

var temperature = 23


if temperature < 12 {
    print("It is cold . Wear a jumper .")
    
} else if temperature < 15 {
    print("It is chilly . Wear a sweater .")
    
} else {
    print("It is sunny . Wear a t-shirt .")
}

/**
 The compiler will keep checking each condition
 until one of them evaluates to `true` .
 If none of the list of branches evaluate to `true` ,
 then the `else clause` is executed by default .
 The way `if else statements` work , is ,
 that the moment any one of the conditions is evaluated to `true` ,
 then we stop checking completely ,
 and execute the statements within that clause .
    Our second option is to make our checks more robust ,
 and to do that,
 we are going to learn a few new operators .
 Let's do that in the next video .
 */
