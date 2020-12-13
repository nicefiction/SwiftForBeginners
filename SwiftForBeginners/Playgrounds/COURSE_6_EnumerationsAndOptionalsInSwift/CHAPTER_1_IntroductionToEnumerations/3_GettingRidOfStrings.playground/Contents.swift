import Foundation

/**
 `GETTING RID OF STRINGS`
 INTRO —  We got rid of some instances of strings in our function
 but there is still room for improvement . In this video ,
 we clean up both functions so there’s no room for error .
 After that
 we take a look at some of the language features
 that make enums easier to read and express .
 */
/**
 In the last video , we replaced the array of strings with an enum
 that was more clear and concise .
 */
enum Day {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}


func dayType(for day: Day)
    -> String {
    
    switch day {
    case Day.saturday , Day.sunday                                            : return "weekend"
    case Day.monday , Day.tuesday , Day.wednesday , Day.thursday , Day.friday : return "weekday"
    }
}
/**
 But our function still returns a string , which is then used again in another function.
 We're repeating the same kind of mistake here that we tried to eliminate in the last video. There are only two possible values that can ever be returned,
 either ( 1 ) a day is a weekday or ( 2 ) it is a weekend.
 This data set is another great candidate for an enum :
 */
enum DayType {
    case weekday
    case weekend
}

// Because we're not returning strings anymore , let's change the return type to DayType :

func dayType(for day: Day)
    -> DayType {
    
    switch day {
    case Day.saturday , Day.sunday                                            : return DayType.weekend
    case Day.monday , Day.tuesday , Day.wednesday , Day.thursday , Day.friday : return DayType.weekday
    }
}

/**
 Now , we don't have a single string literal in this function ,
 and there is barely any room for mistakes .
 Let's tackle that second function , and this one's even easier :
 */

func isNotificationMuted(for daytype: DayType)
    -> Bool {
    
    return daytype == DayType.weekend ? true : false
} // SOLUTION OLIVIER


func isNotificationMuted(on type: DayType)
    -> Bool {
    
    switch type {
    case DayType.weekend : return true
    case DayType.weekday : return false
    }
} // SOLUTION PASAN


/**
 Earlier when we were talking about switch statements ,
 I said that we were only touching the tip of the proverbial iceberg .
 And that it was capable of so much more .
 Now we're going to start seeing that ,
 switch statements are really made to go with the enums .
 Because the switch statement can infer the range of values ,
 we don't have to worry about default clauses ,
 and not accounting for a particular path in our code .
 Let's take a look at what we have done here ,
 we took a dataset up at the top there was an array of strings .
 And two functions that accepted strings to build some functionality .
 This way was quite error prone ,
 because one mistake in writing out those strings and everything comes to a crashing halt .
 We have replaced this with two custom enums ,
 and now everything is much more elegant .
 We can't make mistakes because Xcode goes on to autocomplete
 and the compiler help automatically weed those things out .
 This is pretty important ,
 a lot of app crashing errors are caused by using Strings to specify values .
 */
/**
 There are a couple things we can make a bit nicer in our code ,
 syntactical sugar if you will :
 */
/**
 We don't need to write out the word case every time :
 */
enum DaySG {
    case monday , tuesday , wednesday , thursday , friday , saturday , sunday
}


enum DayTypeSG {
    case weekday , weekend
}

/**
 This is the exact same as writing every single one out on an individual line .
 `NOTE` : I like to keep things separate though
 so I do like them on separate lines with individual case statements .
 */
/**
 Because we have specified that the parameter day inside the dayType( ) function will be of type Day ,
 we don't have to write out Day.saturday inside the body of the function
 We can simply emit the Day and do . . .
 */

func dayTypeSG(for day: Day)
    -> DayType {
    
    switch day {
    case .saturday , .sunday : return .weekend
    default                  : return .weekday
    }
}

/**
 And the compiler can figure it out ,
 because the compiler knows that this case is a potential option when switching on day which is of type Day .
 It figures out that these are valid values ,
 it figures out that .saturday really means Day.saturday .
 When we first learned about type inference and implicit versus explicit types ,
 I mentioned I would bring it up again when it was relevant . Well it's quite relevant here ,
 we wrote code that is actually quite nice and readable .
 We switch on a day
 and if the day is .saturday or .sunday
 we return .weekend .
 That is very readable .
 */
/**
 Since only two values returned .weekend
 and then every other value in the Day enum returns .weekday ,
 we can simply get rid of all this and make it the default case :
 */

func isNotificationMutedSG(for daytype: DayType)
    -> Bool {
    
    return daytype == .weekend ? true : false
}


let day = dayTypeSG(for : .sunday)
let notification = isNotificationMuted(for : day)

print("Today is \(day) , my notifications are muted : \(notification)")



/**
 `ASIDE`:
 There is one thing I should mention before I end this video .
 You'll notice that I have written four functions in total :
 */
 // func dayType(for day: String) -> String { ... }
 // func isNotificationMuted(on dayType: String) -> Bool { ... }
 // func dayType(for day: Day) -> DayType { ... }
 // func isNotificationMuted(on type: DayType) -> Bool { ... }
 /**
 You may have noticed in previous lessons,
 that sometimes we type things with the same name and we got an error .
 So how are we doing it over here ?
 This is a feature of Swift
 called `function or method overloading`,
 where you can have two functions that have the same name
 as long as they take different parameter types .
 So in reality ,
 they are two different functions .
 */
