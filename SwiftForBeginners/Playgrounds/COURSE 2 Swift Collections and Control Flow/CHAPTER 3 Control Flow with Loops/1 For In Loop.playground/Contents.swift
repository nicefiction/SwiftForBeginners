import Foundation


/**
 `CHAPTER 3`
 `Control Flow With Loops`
 INTRO CHAPTER 3 —In computer programming ,
 the order in which lines of code are evaluated
 can be altered by what are known as `control flow statements` .
 There are two kinds of statements :
 (`1`) `conditional statements`
 that determined whether code should be executed or not ,
 and (`2`) `loops` ,
 which indicate how many times we should execute a block of code .
 In this set of videos , we'll start by looking at
 the various types of loops at our disposal .
 */



/**
 `1 For In Loop`
 INTRO —Going through an array
 and performing some task on each item in the array
 is a very common task
 and Swift has a built in control flow mechanism
 called a `for in loop` .
 In this video , let's take a look at
 the syntax of a `for in loop` ,
 break it apart
 so we can understand
 what is going on
 and then get in some practice using it .
 
 */

let toDo: [String] = [
    
    "Swift" , "SwiftUI" , "Combine" , "100 days of SwiftUI"
]


for task in toDo {
    
    print(task)
}
/* prints
 
 Swift
 SwiftUI
 Combine
 100 days of SwiftUI
 */

/**
 We are taking each item out of the `toDo Array`
 and assigning it to a `constant` called `task`.
 `toDo` is the `Array` we want to loop through .
 We specify the collection we want to work with .
 
 `NOTE`:
 Swift does not make you write` for let task` .
 You just have a short form to refer to it .
 
 A `for in loop` can be broken down into a distinct set of steps :
 
 `STEP 1` :
 First , the loop tracks how many items there are in the `toDo Array` .
 It can do this by checking its `count property` .
 
 `STEP 2` :
 Then we create a `variable` called `task` ,
 and reset it to `0` .
 
 `STEP 3` :
 Using this `index value` of `0` ,
 we retrieve the first element in the `array`,
 and assign it to a `constant` .
 In our case , the `constant` is named `task`.
 
 `STEP 4` :
 Then inside the body of the loop ,
 we do whatever we want with that `constant task` ,
 in our case , we simply print it .
 
 `STEP 5` :
 Once all the code in the body of the loop is executed ,
 we go back to the top ,
 add `1` to the `variable` , and start over .
 We do this over and over
 until we reach the end .
 We keep doing this
 until the `value` of `task` is one less than the number of items in the array :
 
 `task.count - 1`
 
 So , every time at the end of the loop body , the compiler asks ,
 is this the end of the loop ? As in ,
 is task one less than the value returned by the count method ?
 If not , execute the loop again . If yes , stop .
 Iterating over an array
 and executing some code on each item in the array , t
 he action we just undertook is the most common use for a `for loop` .
 This process is also called _looping over an array_ .
 */
