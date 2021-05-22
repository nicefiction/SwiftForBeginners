import Foundation


/**
 `2 Logical Operators`
 INTRO —In Swift , logic is represented by the `Boolean values`
 `true` and `false` . These `boolean values` are what allows us t
 o use `if statements` to execute code based on certain conditions .
 But sometimes a single check is not enough .
 We might want to execute a certain block of code
 if more than one condition is satisfied
 and for this we use `logical operators` .
 */
/**
 Swift comes with three logical operators :
 
 (`1`) The `And Operator` , `&&` :
 The logical `AND operator` creates a single logical expression
 where both logical conditions need to be `true` .
 */

3 > 2 && "A" == "A"

/**
 Both of these expressions evaluate to `true` .
 So , the entire statement is `true` .
 However , with the `AND operator` , if any one of them is `false` ,
 the entire expression is `false` .
 */

var temperature = 9


if temperature > 7 && temperature < 12 {
    
    print("Wear a scarf .")
}
// prints Wear a scarf .

/**
 Both logical conditions evaluate to `true` ,
 this makes the entire expression evaluate to `true` .
 
 `NOTE`:
 `Logical operators` are mostly used with `if statements` .
 */
/**
 (`2`) The `Or Operator` , `||` :
 The `OR operator` , just like the `AND operator` ,
 works on 2 logical expressions a and b .
 In this case , however , only one of them has to be `true`
 for the expression to be evaluated as `true` .
 */

var isRaining = true
var isSnowing = false

if isRaining || isSnowing {
    
    print("Wear your boots .")
}
// prints Wear your boots .

/**
 Notice that I am simply listing the variables
 — `isRaining` , `isSnowing` —
 as the expression .
 
 Typically , we put in a `logical expression` .
 Since our `isRaining` and `isSnowing` values
 are already `true` or `false` ,
 we can evaluate them directly . We can use them as expressions .
 */
/**
 (`3`) The `Not Operator` , `!` :
 The `NOT operator` is a `prefix operator` .
 It appears before its target .
 The `NOT operator` makes a `true statement`
 `false`
 and vice versa .
 */

if !isRaining {
    
    print("The sun is out !")
}
// prints nothing .

/**
 You should read this ...
 
 `if !isRaining`
 
 ... as _if it is not raining_ .
 We do not enter the body of code ...
 
 `print("The sun is out !")`
 
 ... because the expression ...
 
 `if !isRaining`
 
 ... evaluates to `false` ,
 _not true_ means `false` .
 
 `var isRaining = true`
 `!isRaining == false`
 
 Both the `AND` and `OR operators` work through
 what is called `short circuit evaluation` .
 These operators are lazy
 and would like to do the least amount of work possible .
 With the `AND operator` ,
 both conditions need to be `true`
 for the entire expression to be evaluated as `true` .
 If the first expression is `false` ,
 then there is no point checking the second expression
 because one `false` means the whole thing is `false` .
 This is exactly how the compiler works.
 If it encounters a `false` in an `AND expression` as the first one ,
 it won't even check the second expression .
 Similarly , with an `OR expression` ,
 if the first expression is `true`,
 the compiler won't bother to check the second one
 because one `true statement` is enough
 for the entire expression to `return true` .
 `Logical operators` can be _chained_ .
 It is not necessary to only evaluate 2 conditions :
 */

if isRaining || isSnowing && temperature < 9 {
    
    print("Wear your gloves .")
}
// prints Wear your gloves .

/**
 We can use parentheses to create `compound expressions` :
 */

if (isRaining || isSnowing) && temperature < 10 {
    
    print("Wear your gloves .")
}
// prints Wear your gloves .

/**
 In this case , the `AND operator` sees two expressions.
 One on its left ,
 `(isRaining || isSnowing)` ,
 and one on its right ,
 `temperature < 2` .
 Now , the one on its left is itself a series of two expressions ,
 `(isRaining || isSnowing)` ,
 that we are going to resolve down to one using the `OR operator` .
 `Compound expressions` make things unreadable though .
 So , it is best to keep it simple .
 */
