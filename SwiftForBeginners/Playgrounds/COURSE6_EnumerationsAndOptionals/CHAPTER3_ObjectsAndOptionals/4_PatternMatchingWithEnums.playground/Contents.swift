import Foundation

/**
 `4 Pattern Matching With Enums`
 INTRO —Pattern matching in Swift lets you compare different values
 to execute code based on certain conditions .
 We took a look at basic pattern matching in previous courses
 but with enums we can take this a step further .
 */
/**
 To round things up,
 let's look at one final topic that involves both enums and optionals ,
 and that is pattern matching .
 We have learned about pattern matching before ,
 although we didn't call it that specifically ,
 when we use switch statements .
 We can switch on a value ,
 and then provide cases to match the value against ,
 we are providing a pattern to match it against .
 Enums allow us to take this to a whole new level
 because enums are made of different cases themselves .
 */

enum Coin: Double {
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.10
    case quarter = 0.25
}


let wallet: [Coin] = [
    .penny , .penny , .penny , .penny , .nickel , .nickel , .nickel , .nickel , .nickel , .nickel , .nickel , .dime , .dime , .dime , .quarter , .quarter , .quarter , .dime , .nickel , .nickel
]


func calculateTotalAmount(of coins: [Coin])
-> Double {
    
    var total: Double = 0.00
    
    
    for coin in wallet {
        switch coin {
        case .penny   : total += 0.01
        case .nickel  : total += 0.05
        case .dime    : total += 0.10
        case .quarter : total += 0.25
        }
    }
    
    return total
}


calculateTotalAmount(of : wallet)


/**
 Now , let's say we wanted to count the number of quarters in my wallet :
 */

func calculateTotalAmountOfQuarters(from coins: [Coin])
-> Double {
    
    var totalFromQuarters: Double = 0.00
    
    for coin in wallet {
        switch coin {
        case .quarter : totalFromQuarters += 0.25
        default       : continue
        }
    }
    
    return totalFromQuarters
}


calculateTotalAmountOfQuarters(from : wallet)

/**
 `ASIDE` :
 Like return,
 continue
 is a control transfer statement .
 The continue statement tells a loop to stop what it is doing ,
 and start again at the beginning of the next iteration through the loop .
 So , all we are doing , is ,
 jumping to the next value in the for loop .
 */
/**
 Simple enough , right ? Well ,
 this kind of code tends to come up often .
 So in Swift , we have some nice syntactic sugar around this :
 */
var totalAmountOfQuartersInWallet: Double = 0.00


for case .quarter in wallet {
    totalAmountOfQuartersInWallet += 0.25
    print("The total amount of quarters in the wallet is \(totalAmountOfQuartersInWallet) .")
}

print("The total amount of quarters in the wallet is \(totalAmountOfQuartersInWallet) .")

/**
 The power of cases have been extended to if statements as well .
 With enums,
 for loops and if statements become even more powerful
 because not only can you write code that is exactly what you want to do ,
 but you can do it in a much more readable manner :
 */
var totalAmountInWallet: Double = 0.00

for coin in wallet {
    if case .penny = coin {
        print("You have a penny .")
        totalAmountInWallet += 0.01
    } else if case .dime = coin {
        print("You have a dime .")
        totalAmountInWallet += 0.10
    }
}

print("Your wallet has a sum of \(totalAmountInWallet) $ pennies and dimes in your wallet ")
/**
 Most of this is syntactical sugar . Again ,
 they're just nice wrappers around stuff that you already know .
 You could have easily used the equality operator
 to compare the value to nickel or dime for each case ,
 and then executed some code .
 */
/**
 The interesting thing here is ,
 remember how we said optionals are just enums under the hood with a none and a some case ?
 */
//enum Optional {
//    case some(String)
//    case none
//}
/**
 Now because they are just enums , we can use this same type of syntax ,
 if case and for case ,
 with an optional
 to unwrap the value .
 So , for example :
 */
let someOptional: Int? = 42


if case .some(let someLocalConstant) = someOptional {
    print(someLocalConstant)
}
/**
 This is actually not such great syntax ,
 but this is essentially what if let is doing  when you write it .
 if let is just comparing
 if the associated value in the some case
 is not an optional , and then it binds that ,
 so you can use it .
 Since if let is a lot nicer to read , we are just going to use that .
 I just want to connect the dots for you , and show you what is going on .
 */
