import Foundation


/**
 `CHAPTER 3`
 `Swift Operators`
 INTRO CHAPTER 3 — Often times we need to manipulate data in some ways ,
 either by combining or deducting values with one another .
 To achieve this
 we use operators .
 You are probably familiar with operators from your time spent in math class
 and while they are similar to their counterparts ,
 operators in programming do a bit more .
 In this set of videos ,
 we'll look at binary operators like _addition_ and _subtraction_ ,
 that act on two targets ,
 as well as unary operators that act on one .
 */


/**
 `1 Arithmetic Operators`
 INTRO —We'll start working with operators that we are most familiar with
 - addition ,
 subtraction
 and other basic math-y stuff .
 */
/**
 An operator is a special symbol or phrase that you used to check , change or combine values .
 Operators can be separated into three categories :
 ( 1 ) `Unary Operators` . These operate on a single target .
 ( 2 ) `Binary Operators` . These operate on a two targets .
 ( 3 ) `Ternary Operators` . These operate on a three targets .
 We'll start with `binary operators` because they are ones we are most familiar with .
 */
1 + 1
/**
 Binary operators operate on two targets . In this case , our two targets are numbers
 that we add together .
 The values that operators affect are called `operands` . So in our case ,
 the two numbers `1` are called `operands`,
 a combination of an `operator` with `operands` is called an `expression`.
 
 There are many binary operators
 most of which you are familiar with from basic math :
 ( 1 ) Addition operator `+`
 ( 2 ) Subtraction operator `-`
 ( 3 ) Division operator `/`
 ( 4 ) Multiplication operator `*`
 ( 5 ) Remainder operator `%`
 
 Here is how the Remainder operator works .
 To calculate 9 % 4,
 you first work out how many 4s will fit inside 9 .
 You can fit two 4s inside 9 ,
 and the remainder is 1 .
 In Swift , this would be written as :
 */
9 % 4 // returns 1
/**
 To determine the answer for a % b ,
 the `%` operator calculates the following equation
 and returns remainder as its output :
 `a = (b * some multiplier) + remainder`
 
 `NOTE` : While the point of this operator may seem silly ,
 it is actually quite useful .
 9 % 4 // remainder 1, Now we know that 9 is an uneven number .
 8 % 4 // remainder 0 , Now we know that 8 is an even number .
 9 * 4.2 // error , You cannot mix types when using one of the Arithmetic Operators .
 */
// 9.0 % 4.2 // ERROR : '%' is unavailable: For floating point numbers use truncatingRemainder instead .
