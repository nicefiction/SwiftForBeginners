import Foundation


/**
 `4 Return Types`
 INTRO —The last piece to our function is the return value .
 Just as functions can take inputs
 they can return an output as wel l.
 In this video , let's take a look at how we can specify a function's return type .
 */
/**
 Just like a function can take an input ,
 it can also have an output ,
 and we specify this through a `return` type .
 */
func area(length: Int ,
          width: Int)
-> Int {
    
    let area: Int = length * width
    
    return area
}


let areaOfFirstRoom = area(length : 10 ,
                           width : 12)
let areaOfSecondRoom = area(length : 15 ,
                            width : 18)
/**
 To specify a return type for a function
 right after the closing parentheses ,
 you put a space ,
 and then we type out a return arrow .
 After this we specify the type of the return value .
 `func area(length: Int , width: Int) -> Int { ... }`
 Now that the function returns a value
 we can assign the result to a constant :
 `let areaOfFirstRoom = area(length : 10 , width : 12)`
 By specifying a return type ,
 the compiler can reduce the number of bugs in our code .
 In fact
 all functions are required to have a return type ,
 so that the compiler can perform these checks .
 But when we first declared the function `func area() {}` ,
 we didn't specify a return value ?
 So how did the compiler know then not to raise an error ?
 Even though we didn't declare a return type initially ,
 the function was still returning a value .
 A function that doesn't return a value
 has a special return type
 known as `Void` .
 `Void` indicates to the compiler
 that this function doesn't actually return anything .
 So if you do try to return something , it will raise an error .
 We can inspect this by writing out a quick function :
 */
func someFunction() {}
/**
 This function , like the first one we wrote ,
 has no return type specified in the declaration ,
 but in fact it does .
 The declaration we have now
 is the exact same as writing out something like this :
 */
func someFunction2() -> Void {}
/**
 The compiler knows that no return type
 automatically means a return type of Void .
 Void can actually be represented in three ways :
 */
func someFunctionA() {}
func someFunctionB() -> Void {}
func someFunctionC() -> () {}
/**
 All of these things mean the same thing .
 This function isn't returning any value .
 You might be confused as to why there are three ways of doing this .
 But as we learn more about Swift functions ,
 you'll come to see that each has their place .
 For now , we are going to use the first way
 by not specifying any type at all .
 
 We now know how to write out a basic function
 that takes a set of inputs
 and returns an output .
 This is pretty important and builds a foundation for a lot of things we are going to learn .
 For the most part , this is how we are going to use functions for a while .
 Functions can do a lot more in Swift ,
 but we don't need to know about those things just yet .
 */
