import Foundation


/**
 `2 Functions in Code`
 INTRO —Now that we understand functions conceptually,
 let's take a look at the syntax in Swift .
 */
/**
 Declaring a function :
 */
func area() {
    
    let length: Int = 10
    let width: Int = 12
    
    let area = length * width
    
    print(area)
}
/**
 A function is a unit of code that performs a specific task ,
 in this case calculating the area .
 Calling a function :
 */
area()
/**
 Rather than writing these exact same lines of code over and over again ,
 `let length: Int = 10`
 `let width: Int = 12`
 `let area = length * width`
 `print(area)`
 we can simply write out the function name —`area()`— to execute the lines of code .

 Functions are really useful
 because it allows us to create blocks of code
 that encapsulate certain functionality that we can reuse as many times as we want
 without having to write more code .
 Unfortunately there is a limitation with our code.
 You'll notice that every time we call the function ,
 the value of area is always 120 square meters ,
 because the values for the length and width are hard coded ,
 `let length: Int = 10`
 `let width: Int = 12`
 meaning that they cannot be changed .
 What if we wanted to calculate the area for a different room ?
 Let's check that out in the next video .
 */
