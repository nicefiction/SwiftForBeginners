import Foundation


/**
 `3 Default Values`
 INTRO —If we have a function parameter that often set to
 a particular value ,
 we can specify a default value to save us some typing .
 In this video
 we add a default value to a parameter
 and take a look at how this changes the function behaviour .
 */
let secondLength = 15
let secondWidth = 22
let areaOfSecondRoom = secondLength * secondWidth


func carpetCost(havingArea area: Int ,
                colorOfCarpet color: String)
-> Int {
    
    // Gray carpet:       $1 / sq ft
    // Tan carpet:        $2 / sq ft
    // Deep blue carpet:  $4 / sq ft
    var price: Int = 0
    
    
    switch color {
    
    case "Gray" : price = area * 1
    case "Tan"  : price = area * 2
    case "Blue" : price = area * 4
    default     : price = 0
    }
    
    
    return price
}


carpetCost(havingArea : areaOfSecondRoom ,
           colorOfCarpet : "Blue")
/**
 `NOTE` : For the sake of simplicity again ,
 we are passing in the color as a String for now .
 `func carpetCost(havingArea area: Int , colorOfCarpet color: String) { ... }`
 `NOTE` : We assume that we are always going to be passing it in as a lowercase String .
 Now in real code ,
 because this is a String ,
 and it can be written as an uppercase string ,
 we would need to check for both .
 In fact there are better ways of doing this ,
 but we'll get there one day .
 
 What if we only wanted to interact with `carpetCost()` directly ?
 And by that I mean ,
 what if we don't want to first calculate the area
 and then pass that value to a second function ?
 No problem .
 We can easily get this done
 because we can call one function from inside another function :
 */
func areaWith(length: Int ,
              width: Int)
-> Int {
    
    let areaOfRoom = length * width
    
    return areaOfRoom
}


func carpetCostHaving(length: Int ,
                      width: Int ,
                      colorOfCarpet color: String)
-> Int {
    
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
    
    
    return price
}


carpetCostHaving(length : 20 ,
                 width : 10 ,
                 colorOfCarpet : "Tan")
/**
 Rather than calling the `calculate area( )` function
 with hard coded values outside of this function , as we had earlier .
 `let secondLength = 15`
 `let secondWidth = 22`
 `let areaOfSecondRoom = secondLength * secondWidth`
 `carpetCost(havingArea : areaOfSecondRoom , colorOfCarpet : "Blue")`
 We are passing in the arguments for the parameters to the `carpetCostHaving( )` function
 through to the `areaWith()` function :
 `let areaOfRoom = areaWith(length : length , width : width)`
 Now ,
 in this hypothetical scenario ,
 it is very rare that our contractor is asked to install a carpet color other than tan .
 Turns out everybody just wants a tan carpet .
 So having to input the value tan nine times out of ten ,
 is kinda cumbersome .
 We can solve that problem though ,
 because function parameters can take default values .
 We are going to actually assign a default value to the `color` constant :
 */
func carpetCostHaving2(length: Int ,
                       width: Int ,
                       colorOfCarpet color: String = "Tan")
-> Int {
    
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
    
    
    return price
}
/**
 _So how does this change things ?_
 So , when we start typing out the function , `carpetCostHaving2` ,
 Xcode's autocomplete presents us with a few results .
 Now before we just had one result .
 Now we have two results ,
 and you'll notice an interesting thing .
 The first result is the one that we expected just like before
 where we have an argument specification for `length` , `width` , and the `color` .
 But in the second one , `colorOfCarpet` is omitted . If we select this one ,
 we are basically telling Swift that we want to accept that default value for carpetColor .
 Now if we use the first one ,
 we are saying that we want to specify the carpet color directly and not use the default .
 */
carpetCostHaving2(length : 10 ,
                  width : 20)
