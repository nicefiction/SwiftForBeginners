import Foundation
import UIKit

/**
 `INTRO CHAPTER 3`
 `OBJECTS AND OPTIONALS`
 Now that we know a bit about both enumerations and optionals,
 let's take a look at some topics at the intersection of the two.
 In addition, we'll look at some features in Swift
 that make it much easier to work with both enums and optionals
 including things like pattern matching
 and the nil coalescing operator .
 */
/**
 `1 Enumerations with Raw Values`
 INTRO — Earlier we saw
 how enumeration members can contain associated values .
 Enums have one more trick up their sleeves
 and in this video we take a look at
 how we can provide a default value to an enum member using raw values .
 */
/**
 Earlier , we took a break from enums but we weren't actually done with that .
 We needed to know about optionals before we could learn about this one last bit .
 Just as a recap ,
 an enum member can declare
 that it stores associated values of different types as we did over here :
 */
enum ColorComponent {
    case rgb(red: CGFloat , green: CGFloat , blue: CGFloat , alpha: CGFloat)
    case hsb(hue: CGFloat , saturation: CGFloat , brightness: CGFloat , alpha: CGFloat)
    
    func color()
    -> UIColor {
        
        switch self {
        case .rgb(red : let red ,
                  green : let green ,
                  blue : let blue ,
                  alpha : let alpha) : return UIColor(red : red / 255.0 ,
                                                      green : green / 255.0 ,
                                                      blue : blue / 255.0 ,
                                                      alpha : alpha)
        case .hsb(hue: let hue ,
                  saturation : let saturation ,
                  brightness : let brightness ,
                  alpha : let alpha) : return UIColor(hue : hue / 360.0 ,
                                                      saturation : saturation / 100.0 ,
                                                      brightness : brightness / 100.0 ,
                                                      alpha : alpha)
        }
    }
}

let rgb = ColorComponent.rgb(red : 100.0 ,
                             green : 50.0 ,
                             blue : 25.0 ,
                             alpha : 1.0)
rgb.color()

/**
 We have a ColorComponent enum that has two cases .
 Each case can store a set of different values .
 These values can be different for each instance ,
 and we can use these values to do some work
 like we have done in the color( ) method .
 */
/**
 There is another aspect to enums ,
 and it is that enum members can come populated with default values .
 These values are called raw values ,
 and they are all of the same type .
 Let’s model a cash register
 and we want to denote the different types of coins we can accept .
 All currencies have a defined set of denominations .
 And in the US coins are four different kinds :
 */

enum Coin {
    case penny
    case nickel
    case dime
    case quarter
}

/**
 So here we have an enum with different members to represent the different kinds of coins .
 And we can add member methods to the enum to do various things with it .
 Okay so next ,
 let's create an array of values of the Coin enum :
 */

let coins: [Coin] = [
    .penny , .nickel , .nickel , .dime , .penny , .penny , .quarter
]

/**
 We give the array a specific type , Coin . If I were to remove this ,
 then it is harder for the compiler to figure it out . It wouldn't know what .penny is .
 Next , we want to write a function
 that calculates the sum of all the coins in the array :
 */

func sum(of coins: [Coin])
-> Double {
    
    var total: Double = 0.00
    
    for coin in coins {
        switch coin {
        case .penny : total += 0.01
        case .nickel : total += 0.05
        case .dime : total += 0.10
        case .quarter : total += 2.25
        }
    }
    
    return total
}

sum(of: coins)

/**
 We want to iterate over the coins array
 and add the value of each coin to the total figure .
 Now this works,
 but as always it is not the best way to do things .
 These coins up over here . . .
 */
/*
for coin in coins {
    switch coin {
    case .penny : total += 0.01
    case .nickel : total += 0.05
    case .dime : total += 0.10
    case .quarter : total += 0.25
    }
}
 */
/**
  . . . always have the same value .
 .penny is always 1 cent , the value of coins don't change .
 In situations like this , where we want our enum members to always have a default value ,
 we can give them raw values .
 These raw values all have to be the same type
 and we specify the type in the enum declaration :
 */

enum CoinRV: Double {
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.10
    case quarter = 0.25
}


func sumRV(of coins: [CoinRV])
-> Double {
 
    var total: Double = 0.00
    
    for coin in coins {
        total += coin.rawValue
    }
    
    return total
}

/**
 We access enums raw values
 using the rawValue property
 to get that underlying member value .
 */
/**
 `NOTE` : ( ! ) It is important to know that raw values
 are not
 associated values :
 1. You use raw values
 when you always want an enum member to have a default value .
 Associated values on the other hand
 are set
 when you create the enum .
 Associated values can be different values
 for every instance .
 2. The second important thing to note , is ,
 that rawValues can only be
 String ,
 Character ,
 Integer ,
 or Floating-point number types .
 So custom types will not work here ,
 just the primitive swift types .
 Custom types do work with associated values though .
 */
/**
 When you use raw values with an underlying type of ( A ) Int
 or ( B ) String ,
 they get some special behaviour .
 `( A ) Using raw values with an underlying type of Int` :
 Let's look at another example here .
 Now typically we associate numbers with days of the week :
 */

enum Day: Int {
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    case sunday = 7
}

/**
 But there is an easier way to do this
 because as I just mentioned ,
 enums with integer raw values get some nice behaviour :
 */

enum Day2: Int {
    case monday = 1 , tuesday , wednesday , thursday , friday , saturday , sunday
}

let friday = Day.friday.rawValue
let saturday = Day2.saturday.rawValue

/**
 You'll see that it says 5 in the results area .
 This is because integer raw values are auto incrementing .
 If you specify the first value ,
 swift increments and assigns this value to each successive case .
 This just makes it easier to declare .
 */
/**
 `( B ) Using raw values with an underlying type of String` :
 With an enum with String raw values ,
 if we don't specify any default values ,
 swift provides one automatically . For example ,
 if you are coming from a web development background ,
 you know about various HTTP methods .
 These are ways that we can interact with services on the web
 and we'll learn more about this later on .
 We can model these different methods HTTP methods as enum members :
 */

enum HTTP: String {
    case post
    case get
    case put
    case delete
}

HTTP.delete.rawValue

/**
 Notice here that we don't have any raw value .
 What we get in the results area is a String literal that represents the case name .
 With strings ,
 if you specify a String as a raw value
 and then don't provide a value ,
 you get the name of the enum member as a String by default .
 */
