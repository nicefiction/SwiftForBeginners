import Foundation

/**
 `MODELLING FINITE DATA`
 INTRO — Now that we know the issues with using strings ,
 let’s rewrite our functions using enumerations .
 In this video , we’ll take a look at the basic syntax of an enum as well as the concepts behind it .
 */

// Let's try and solve the same problem but get rid of those strings altogether and use an enum :

enum Day {
    case monday , tuesday , wednesday , thursday , friday , saturday , sunday
}

/**
 Following the convention . We are going to use upper CamelCase to name enums .
 The convention is also to give enums ,
 in both structs and classes ,
 a singular name .
 Inside the body of the enum ,
 we define member values , or members of the enumeration .
 The convention is that the type name is UpperCased
 but all values inside the type are lowerCase .
 `NOTE` : Each member is defined using a
 case
 keyword ,
 which is the same keyword we use inside of a switch statement .
 */

func dayType(for day: Day)
    -> String {
    
    switch day {
    case Day.saturday , Day.sunday                                            : return "weekend"
    case Day.monday , Day.tuesday , Day.wednesday , Day.thursday , Day.friday : return "weekday"
    }
}

/**
 Unlike the last time , the argument type is not going to be String .
 This time we want to use our new custom type ,
 Day ,
 the enum we just created .
 The moment I put that dot and start typing ,
 Xcode starts auto completing for us .
 Because this is an actual type we defined with a set range of values ,
 the compiler knows the different options and presents them .
 It makes it impossible to make a mistake .
 `NOTE` : Notice how we refer to enum
 values .
 We don't create instances like structs or classes.
 Instead we simply use
 the type ,
 a dot,
 and then it is like we are accessing a property .  So ,
 Day.saturday
 to get these
 values .
 `NOTE` : We don't have a default case in the switch statement .
 I mentioned at the start of this course that enums are used to model
 a finite data set .
 Days of the week are a great example of this .
 There are seven values to this data set and it will never change .
 There will always only be seven values .
 The set contains a fixed number of values and it is this kind of data that an enum models .
 It seems like that is a limited use case , but in fact ,
 there are many ways in which data presents itself like this :
 Months of the year ,
 seasons ,
 compass directions ,
 turn by turn navigation directions ,
 all of these are obvious examples of fixed value data sets .
 But what about user state in an app ?
 Well , that is fixed too . The user is either logged in or logged out . That's two states .
 What about different reading modes in a book app ?
 Typically we have three reading modes and these are fixed as well :
 Night mode , regular , and light .
 The advantage of this is that the compiler can provide some checks for you .
 Because our Day enum can only ever be seven values ,
 by providing a return value for all seven cases of the enum ,
 the compiler knows this switch statement doesn't need a default
 because all the possible cases are taken care of .
 The switch statement is exhaustive ,
 that is , it covers all possible paths without the need for a default value .
 And how does it know how many paths there are ?
 We specify the type of the variable we are switching on in the argument over here ,
 */
// func dayType(for day: Day) { ... }
/**
 And since the compiler knows it is an enum , we don't have to worry about it .
 The compiler keeps a close eye on what we are doing . For example ,
 if I remove this Day.friday case in the switch statement of the dayType( ) function , the compiler immediately knows that all paths aren't considered ,
 and complains that the switch statement must be exhaustive .
 I can either ( A ) add back the Friday case or ( B ) add a default case to fix this .
 */
