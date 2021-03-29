import Foundation


/**
 `3 While and Repeat While`
 INTRO —Sometimes we need to perform a set of actions
 _while_ a condition is `true` .
 We don't have a predefined number of times ,
 we just know that until the condition stops being `true` ,
 we keep carrying out the action .
 In Swift this kind of logic is modelled with a set of `while` loops .
 */
/**
 A `while loop` performs a set of statements
 until a condition becomes `false` .
 */

let toDo: [String] = [
    
    "Swift" , "SwiftUI" , "Combine" , "100 days of SwiftUI"
]


var arrayIndex: Int = 0


while arrayIndex < toDo.count {
    
    print("To Do item \(arrayIndex + 1) : \(toDo[arrayIndex])")
    
    arrayIndex += 1
}
/* prints
 
 To Do item 1 : Swift
 To Do item 2 : SwiftUI
 To Do item 3 : Combine
 To Do item 4 : 100 days of SwiftUI
 */

/**
 `STEP 1`
 
 `var arrayIndex = 0`
 
 We start with an `arrayIndex`
 to keep track of the number of times we evaluate the loop .
 This is necessary
 so that we don't infinitely loop over .
 
 
 `STEP 2`
 
 `while arrayIndex < toDo.count`
 
 For the condition of the loop ,
 we'll say that we want to keep going
 until `arrayIndex` is one less than the number of items in the array .
 
 `NOTE`: since `arrayIndex` values start at `0`,
 the last element has an `index value` that is always `count - 1`.
 So by saying , go until the `arrayIndex` is less than `count` ,
 we won't ever have an `arrayIndex` value that's equal to `count` ,
 and cause an `index out of bounds error` .
 
 
 `STEP 3`
 
 `index += 1`
 
 `GOTCHA`:
 Before we print out each task using the index and the array ,
 I want to guarantee that I don't loop infinitely .
 So I'll write the code to increment index first .
 This is a good habit to get into .
 It is quite easy to forget
 that you may not be providing code
 to eventually lead to a `false` condition .
 
 
 `STEP 4`
 
 `print("To Do item \(arrayIndex + 1) : \(toDo[arrayIndex])")`
 
 We print out each task using the index and the array .
 */
/**
 Along with the `while loop` ,
 there is a counterpart called `repeat while` .
 There is a difference between the `while` and `repeat while loop` :
 
 `while condition {`
 
    `statements`
 `}`
 
 In a standard `while loop` ,
 the condition that we provide is checked first ,
 then the code in the body is executed .
 
 `repeat {`
 
    `statements`
 `} while condition`
 
 In a `repeat while loop` ,
 the statements in the body are executed first,
 then the condition is evaluated .
 The difference is subtle .
 But with the `repeat while loop` ,
 even if your condition evaluates to `true` at the beginning ,
 you are ensured to get one pass through the body of the loop .
 Let's see what this is like in a playground .
 We are going to write two identical loops
 using the two variations
 so we can see the difference :
 */

var counter: Int = 1


while counter < 1 {

    print("I am inside the while loop ." , "\nCounting : \(counter)")
    counter += 1
}
// prints nothing

/**
 `TIP` :
 So again ,
 we’ll always change the condition first
 by incrementing the `counter` .
 This will prevent the app from crashing .
 
 Now , if I let this run ,
 you'll see that the `counter` can't be less than `1` .
 This condition is `true` already ,
 so we never go into the body .
 So none of the contents of the `while loop` are evaluated .
 Let's do the same thing again with the `repeat while loop` :
 */

repeat  {
    
    print("I am inside the repeat while loop ." , "\nCounter : \(counter)")
    counter += 1
    
} while counter < 1
// prints
// I am inside the repeat while loop .
// Counter : 1

/**
 Our `string literal` is printed now .
 
 It basically comes down to this .
 If you want to repeat a certain activity a number of times
 until some condition becomes `false` ,
 then you use the `while loop` .
 If you have the same criteria ,
 but you always want the body of the loop to be evaluated at least once
 regardless of whether the condition is `true` or `false`,
 then you use the `repeat while loop` instead .
 
 
 And that is it `for loops` .
 */
