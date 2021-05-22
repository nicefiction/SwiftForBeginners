import Foundation


/**
 `4 Unary Operators`
 INTRO —We just learned about a whole bunch of `binary operators`
 — those that work with _two operands_ .
 In this video ,
 let’s take a look at `unary operators`
 — those that work with _one operand only_ .
 */
/**
 Unary operators work with only one operand :
 */
var levelScore = 0
levelScore = levelScore + 1
levelScore += 1 // OR : levelScore = levelScore + 1
levelScore -= 1
/**
 Remember ,
 that the assignment operator can update the value of an existing variable .
 So , here ...
 */
levelScore += 1 // levelScore = levelScore + 1
/**
 ... we are taking the old value of `levelScore` , which is `0` , adding `1` to it
 and then assigning the resulting value , `1` , back to `levelScore `itself .
 This pattern of adding something to a variable
 and assigning the updated result to the same variable
 is common enough that we have a dedicated operator ,
 the `unary plus operator` .
 
 `NOTE` : Just like the increment operator , the `unary plus operator` .
 We have a `decrement operator` that decreases the value by `1` .
 `levelScore -= 1`
 
 Now there is only one more `unary operator` in swift ,
 and that is the `not operator` .
 A `not operator` negates a value , or simply put ,
 it gives you the opposite of it .
 */
let on = true
let off = !on
/**
 We get the opposite of `true` by using the `not operator` .
 */

