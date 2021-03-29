import Foundation


/**
 `2 Looping over ranges`
 INTRO —A `range` represents
 a series of numbers with a start and an end .
 Ranges are often used in conjunction with `for in loops`
 to write quick and convenient code .
 */
/**
 Sometimes , we want to express a range of values
 so that we can do things a certain number of times .
 In Swift
 we can express a `range` with two kinds of operators :
 
 (`1`) The first operator is called
 the `closed range operator` :
 */

1...5

/**
 A `closed range operator`,
 creates a range of values
 that includes the values 1 and 5 .
 
 (`2`) The second operator is called
 a `half open range operator` :
 */

1..<5

/**
 If we use the `half open range operator` ,
 we would get the numbers `1` , `2` , `3` , and `4` in our range .
 Both these operators can be used in conjunction with a `for in loop`
 to execute whatever code we want a certain number of times :
 */


for number in 1...5 {
    
    print("\(number) * 5 = \(number * 5)")
}
/* prints
 
 1 * 5 = 5
 2 * 5 = 10
 3 * 5 = 15
 4 * 5 = 20
 5 * 5 = 25
 */

// ANGELA YU :

for number in (1...5).reversed() {
    
    print(number)
}
/* prints
 5
 4
 3
 2
 1
 */


for evenNumber in 1...10 where evenNumber % 2 == 0 {
    
    print("Even number : \(evenNumber)")
}
/* prints
 
 Even number : 2
 Even number : 4
 Even number : 6
 Even number : 8
 Even number : 10
 */
