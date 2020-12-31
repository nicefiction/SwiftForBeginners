import Foundation


/**
 `4 Returning Complex Values`
 INTRO —We often would like to return more than one value from a function call ,
 and in Swift we can achieve this
 using a construct known as a `tuple` .
 In this video , we modify our function
 to return both the carpetColor as well as the price .
 */
/**
 Functions in Swift can return multiple values
 and they do this using a construct known as a Tuple .
 A Tuple is simply
 a set of values
 wrapped in parenthesis .
 Tuples are an interesting little construct ,
 and we can use them in quite a few ways . But for now ,
 we'll limit that to functions ,
 we don't want to overwhelm ourselves .
 */
func areaWith(length: Int ,
              width: Int)
-> Int {
    
    let areOfRoom = length * width
    
    return areOfRoom
}


func carpetCostHaving(length: Int ,
                      width: Int ,
                      colorOfCarpet color: String = "Tan")
-> (Int , String) {
    
    // Gray carpet:       $1 / sq ft
    // Tan carpet:        $2 / sq ft
    // Deep blue carpet:  $4 / sq ft
    var price: Int = 0
    let areaOfRoom = areaWith(length : length ,
                              width : width)
    
    
    switch color {
    
    case "Gray" : price = areaOfRoom * 1
    case "Tan"  : price = areaOfRoom * 2
    case "Blue" : price = areaOfRoom * 4
    default     : price = 0
    }
    
    
    return (price , color)
}


let result = carpetCostHaving(length : 20 ,
                              width : 10)
result.0 // We get the price .
result.1 // We get the color .
/**
 Like an Array or a Dictionary
 the type of the Tuple is the type of the values that it contains .
 We want the Tuple to act as a container for our compound value .
 We want to return the price ,
 which in this example is an Integer
 and the color
 which is a String .
`func carpetCostHaving(length: Int ,`
                      `width: Int , `
                      `colorOfCarpet color: String = "Tan")`
 `-> (Int , String) { ... }`
 Since the return type is a Tuple
 containing an Int first , and then a String ,
 let's return first the price , followed by the color :
 `return (price , color)`
 Since we are returning a value from this function ,
 let's actually assign this value
 the result of the function call
 to a constant :
`let result = carpetCostHaving(length : 10 , width : 20)`
 
 `NOTE`:  You'll notice now in the results area ,
 rather than just 750 ,
 the value printed is 750
 and then Tan inside a set of parentheses .
 But there's also a .0 and a .1 in there .
 When you create this compound value using a Tuple ,
 you can use .0 , .1 , and so on , to access the values that are inside .
 This works somewhat similarly to Array indexes
 and you can think of a Tuple as more or less a fixed length Array .
 `result.0`
 `result.1`
 This is both convenient in that we can easily get the value out
 but it is also inconvenient in that this `.0` and `.1` names aren't meaningful .
 The good thing is
 that a Tuple allows us to name our values that we stored inside .
 And we do this when we declare a return type for the function :
 */
func carpetCostHaving2(length: Int ,
                       width: Int ,
                       colorOfCarpet color: String = "Tan")
-> (carpetPrice: Int , carpetColor: String) {
    
    // Gray carpet:       $1 / sq ft
    // Tan carpet:        $2 / sq ft
    // Deep blue carpet:  $4 / sq ft
    var price: Int = 0
    let areaOfRoom = areaWith(length : length ,
                              width : width)
    
    
    switch color {
    
    case "Gray" : price = areaOfRoom * 1
    case "Tan"  : price = areaOfRoom * 2
    case "Blue" : price = areaOfRoom * 4
    default     : price = 0
    }
    
    
    return (price , color)
}


let result2 = carpetCostHaving2(length : 10 ,
                                width : 5)
result2.0
result2.1
result2.carpetPrice
result2.carpetColor
/**
 Much like we do for the parameters ,
 we simply give them labels :
 `func carpetCostHaving(length: Int ,`
                       `width: Int , `
                       `colorOfCarpet color: String = "Tan")`
  `-> (carpetPrice: Int , carpetColor: String) { ... }`
 We can use the `result2` constant to actually query the price :
 `result2.carpetColor`
 `NOTE` : You can still use the `.0` and `.1` or the index values .
 */
