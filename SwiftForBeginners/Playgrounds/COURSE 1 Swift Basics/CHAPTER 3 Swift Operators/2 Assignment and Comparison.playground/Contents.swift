import Foundation


/**
 `2 Assignment and Comparison`
 INTRO —When manipulating different types of data ,
 it is often useful to compare them to one another before we do any work .
 Swift comes with a bunch of great assignment operators that we can use
 to compare objects in different ways .
 */
var a = "a"
var b = "b"
/**
 The `assignment operator` denoted by the equal to symbol
 initializes
 or updates
 the value of one operand ,
 let’s say `a` in this case with the value of operand `b` .
 */
a = b
/**
 Along with the assignment operator ,
 we also have `comparison operators` .
 Comparison operators are `binary operators`
 and are used to compare the identity of two values .
 They return a boolean value that is either `true` or `false`
 depending on the result of the evaluation .
 There are four of comparison operators that we should be concerned with for now :
 */
1 == 2 // Equal to
1 != 2 // Not Equal to
1 > 2  // Greater than
1 < 2  // Smaller than
1 >= 2 // Greater than or Equal to
1 <= 2 // Smaller than or Equal to
/**
 `NOTE` : This works also , for example ,
 */
"a" < "b" // returns true
 /**
 because `a` comes before `b` in the alphabet .
 This is really useful because it can be used to sort a set of Strings alphabetically .
 
 `GOTCHA` : It is not as simple as it seems
 because of how characters are represented in Swift . For example ,
 try comparing an upper case A to a lower case b ,
 the results may surprise you , and that is , because under the hood ,
 these characters are stored as complex numerical values .
 It is those numerical values that are being compared .
 
 `NOTE`: There are a few more `binary operators`
 but they operate on types that we don't know just yet . So we'll tackle those in the future when we need .
 */

