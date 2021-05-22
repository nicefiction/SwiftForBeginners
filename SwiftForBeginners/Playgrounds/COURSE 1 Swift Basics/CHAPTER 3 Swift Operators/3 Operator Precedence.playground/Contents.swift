import Foundation


/**
 `3 Operator Precedence`
 INTRO —How do we know which operators get executed first
 when there is more than one in a single expression ?
 Swift has a set of rules , known as `operator precedence` ,
 that decides which code gets run first .
 In this video , we go over the precedence rules
 governing the operators we just learned .
 */
/**
 Some operators take higher precedence than others :
 
 `PRECEDENCE LEVEL 150`
 Multiplication : `*`
 Division         :` /`
 Remainder    : `%`
 
 `PRECEDENCE LEVEL 140`
 Addition        : `+`
 Substraction : `-`
 
 Swift assigns a priority or precedence to each of these operators .
 Those with the Higher Precedence are executed first .
 All these operators work from Left to Right .
*/
let y = 25 - 5 * 2 + 5 // 20
/**
 `STEP 1` : `5 * 2` is executed first because Multiplication has got _higher Precedence_ .
 `STEP 2` : `25 - 10` is executed second because Operators work from _Left to Right_ .
 `STEP 3` : Finally , `15 + 5` is executed , resulting in `20` , the correct answer .
 */
