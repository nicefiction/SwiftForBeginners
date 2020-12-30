import Foundation


/**
 `3 Function Parameters`
 INTRO —Our function is quite limited
 because we have hardcoded values into it .
 We can make our functions more flexible
 by allowing us to pass in values when we call them .
 In this video , let's take a look at
 how we can add parameters to our existing function .
 */
/**
 A coffee maker takes two inputs , coffee and water .
 And then uses those inputs to make coffee .
 Just like the coffee maker , functions in Swift can take inputs as well .
 */
func area(length: Int ,
          width: Int) {
    
    let area = length * width
    
    print(area)
}


area(length : 10 ,
     width : 12)
/**
 The parentheses following a function name is used
 to provide a function with inputs :
 `func area(length: Int , width: Int) { ... }`
 These inputs that you see right here are called `parameters`.
 We are going to use the values that we pass into the function through the parameters .
 
 `NOTE` :
 When you specify an input for a function ,
 these inputs are called `parameters` :
 `func area(length: Int , width: Int) { ... }`
 When you provide an actual value for a parameter ,
 that specific value is then called an `argument` :
 `area(length : 10 , width : 12)`
 
 We have discussed , a few times now , what a function is .
 Let's see if this qualifies :
 
 1. _Does it consist of a sequence of instructions that carries out a specific task ?_
 Well , yes it does .
 Ours calculates the area given a length and a width :
 `func area(length: Int ,`
           `width: Int) {`
     
     `let area = length * width`
     
     `print(area)`
 `}`
 
 2. _Is it self contained ?_
 Yes , it is .
 `area(length : 10 , width : 12)`
 We can call this function as many times as we want ,
 and it is not tied to a particular room or measurement .
 
 
 `SWIFT DOCUMENTATION` :
 The `argument` label is used when calling the function ;
 each argument is written in the function call with its argument label before it .
 The `parameter` name is used in the implementation of the function .
 By default , parameters use their parameter name as their argument label .

 */
