import Foundation

/**
 `INTRO CHAPTER 1`
 `INTRODUCTION TO ENUMERATIONS`
 Swift allows us to compose custom data types
 and in this course we take a look at a new language feature
 - enumerations ,
 that allows us to model related sets of data .
 We’ll cover the syntax of enums ,
 how we can add members for each data point
 and how we can associate information with each member .
 */



/**
 `1. THE PROBLEM WITH PRIMITIVES`
 INTRO — In this video we build a simple function
 that tells us whether it is the weekend or not .
 Before we actually implement a solution with enumerations ,
 we take a look at what can go wrong when we use strings as values .
 */
/**
 An enum is a construct in Swift
 that allows us to model
 ( 1 ) a finite grouping of data
 or ( 2 ) a group of related types .
 Enums in Swift are very flexible .
 They resemble objects and concepts .
 We have talked about modelling data . And so far ,
 we have used both objects and collections to do that .
 There is a certain kinds of data though where these solutions aren't ideally suited .
 And this is data that is a fixed set of values .
 Let's look at an example .
 */

// Let's say we want to model a typical week for something like a calendar app :

let week: [String] = [
    "Monday" , "Tuesday" , "Wednesday" , "Thursday" , "Friday" , "Saturday" , "Sunday"
]

/**
 Based on what we know , an array seems like the best choice here .
 An object won't work . We won't be creating instances of Monday , for example .
 We just need a value to indicate what day of the week it is .
 Now , let's try to use this data in some way .
 Let's say this calendar app of ours turns off notifications on the weekend
 so that we can enjoy life .
 Well , to do that , we need to know whether it is a weekday or weekend , right ?
 `NOTE` : In a more realistic scenario ,
 we would have an object handling all of this functionality ,
 figuring out what type of day it is,
 but we are going to keep the example lean :
 */

func dayType1(for day: String)
    -> String {
    
    var dayType: String = ""
    if day == "Saturday" || day == "Sunday" {
        dayType = "weekend"
    } else {
        dayType == "weekday"
    }
    
    return dayType
} // SOLUTION 1 OLIVIER


func dayType2(for day: String)
    -> String {
    
    let dayType: String = day == "Saturday" || day == "Sunday" ? "weekend" : "weekday"
    
    return dayType
} // SOLUTION 2 OLIVIER


func dayType3(for day: String)
    -> String {
    
    switch day {
    case "Monday" , "Tuesday" , "Wednesday" , "Thursday" , "Friday" : return "weekday"
    case "Saturday" , "Sunday"                                      : return "weekend"
    default                                                         : return "This is not a valid day in the Western calendar ."
    }
} // SOLUTION PASAN


/**
 Okay , this path we're taking though is fraught with peril .
 One thing you will learn with experience is that
 using strings as values , in cases like these , as a value to determine the next step in our process is
 a terrible decision .
 
 So we have our first function .
 Let's write another . Again ,
 this will be a trivial function that doesn't really do much other than illustrate our example :
 */

func isNotificationMuted1(for daytype: String)
    -> Bool {
    
    return (daytype == "weekend") ? true : false
} // SOLUTION OLIVIER


func isNotificationMuted2(on dayType: String)
    -> Bool {
    
    if dayType == "weekend" {
        return true
    } else {
        return false
    }
} // SOLUTION PASAN


let today = dayType1(for : "Sunday")
isNotificationMuted1(for : today)


/**
 This seems to work , right ? 
 Using strings like this is risky because a simple spelling error , a typo ,
 leads to mistakes all over the place .
 Mistakes that are often quite hard to catch .
 What if instead of mistakenly typing the days over here ,
 I had typed it out incorrectly in the actual array ?
 Now , everywhere I am using the array , there are going to be errors .
 And the worst part is ,
 even though Swift is a strict language and we expect the compiler to help us out ,
 in this case ,
 because we are using strings ,
 and it can’t figure out whether this is a right day or not ,
 the compiler can't help us .
 So how can we solve this ? On to the next video .
 */
