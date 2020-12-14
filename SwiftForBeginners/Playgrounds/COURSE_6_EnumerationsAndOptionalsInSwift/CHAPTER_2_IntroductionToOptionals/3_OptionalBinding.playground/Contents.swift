import Foundation

/**
 `3 Optional Binding`
 INTRO —Using force unwrapping clearly won’t work because it leads to very dangerous code .
 In this video, we take a look at our first safe alternative - optional binding using if let syntax .
 */
/**
 The safe way
 and the correct way
 to unwrap things , is ,
 using optional binding .
 And there are two ways we can do this
 depending on how we want to think about our code .
 When we learned about dictionaries in Swift ,
 I mentioned that dictionaries always return an optional value .
 This is because when we asked for a particular value using a key ,
 there is a chance this key might not exist .
 And rather than crashing ,
 we safely return nil using an optional .
 We can verify this by creating a simple Dictionary :
 */
let airportCodes: [String : String] = [
    "CDG" : "Charles De Gaule"
]

let newYorkAirport = airportCodes["JFK"] // returns nil
/**
 You can see in the results area
 that the return value is nil .
 If we inspect the type
 by holding down the OPTION key and clicking on the constant — newYorkAirport — ,
 you will see that this is an optional String .
 Let's say we had no idea what was in the airportCodes dictionary .
 We just knew it contained different airport codes
 and we want the full name for the code JFK .
 Again , we have absolutely no idea whether JFK exists as a key or not in this dictionary . The first way we can write it is this :
 */
if
    let _newYorkAirport = airportCodes["JFK"] {
    print(_newYorkAirport)
} else {
    print("The airport does not exist in out database .")
}
/**
 This is called optional binding .
 We use optional binding to find out if an optional contains a value .
 If this value exists , then we bind that value to a temporary local constant or variable
 that only exists inside the if statement . So in this case ,
 if the airportCodes dictionary contains a key equal to JFK ,
 then that value is pulled out from the dictionary .
 Now that value is an optional ,
 the optional is then automatically unwrapped for you
 and the value inside that String is then assigned to _newYorkAirport .
 Again , _newYorkAirport is a temporary constant ,
 it is a local constant
 that only exists inside the if statement .
 In this way , we can write code that only works if the optional value is not nil .
 The code won't crash ,
 because we only step into the body of the if statement
 when we have a value .
 When the value is nil , we step into the else clause .
 `NOTE` : The local constant — _newYorkAirport — is just a String , it is not an optional String
 because it has been unwrapped for us .
 Whereas the earlier one we created was an optional String . You can verify this by OPTION clicking on the constant .
 The difference here between what we did earlier ,
 force unwrapping ,
 and optional binding , is ,
 that with optional binding ,
 you let the compiler worry about doing the unwrapping for you .
 We are not forcing that value out of the optional .
 */
/**
 You can include many optional binds in one if statement . For example ,
 we could be building a weather app
 and be pulling some data from a web service that gives you weather information :
 */
let weatherDictionary: [String : [String : String]] = [
    "Current" : ["Temperature" : "20"] ,
    "Daily" : ["Temperature" : "25"] ,
    "Weekly" : ["Temperature" : "22"]
]
/**
 This represents a hypothetical weather forecast object .
 You have keys—"Current" weather, "Daily" weather and "Weekly"— that identify a time frame for the weather .
 Now using this key ,
 */
let daily = weatherDictionary["Daily"]
/**
 we get back an optional dictionary .
 This is a nested dictionary .
 So when you use the key "Daily" , for example ,
 the value you get back is another dictionary ,
 If we OPTION click on daily ,
 you'll see that the type is an optional dictionary .
 What if we wanted to get the temperature for the "Daily" forecast ?
 */
// Swift 1 Legacy Code :
if
    let _daily = weatherDictionary["Daily"] {
    if
        let _temperature = _daily["Temperature"] {
        
        print("The daily temperature is \(_temperature) .")
    }
}
/**
 We use optional binding to get this optional dictionary out ,
 unwrap it ,
 and assign it to _daily .
 So , _daily now is a dictionary .
 `NOTE` : _daily is not an optional dictionary .
 It only exists
 ( 1 ) if the "Daily" key of weatherDictionary["Daily"] returns an accurate value
 and ( 2 ) it exists only inside the if statement .
 */
/**
 We want to get the "Temperature" from this dailyWeather dictionary :
 */
// if let dailyTemperature = dailyWeather["Temperature"]
/**
 Now again ,
 since this
 */
// "Daily" : ["Temperature" : "25"]
/**
 from let weatherDictionary: [String : [String : String]]
 is also a dictionary ,
 and remember dictionaries return optional values ,
 by using the "Temperature" key in _daily["Temperature"] ,
 we get an optional value back
 if that key exists .
 But because we are using an if let statement
 if that value does exist ,
 we are going to unwrap it ,
 and then bind it to _temperature , which is a String .
 Now this works
 but it is kind of ugly .
 If we have data that is nested a few levels deep,
 we have to keep writing subsequent if let statements and you end up with something like this :
 */
/*
if let _a = a {
    if let _b = b {
        if let _c = c {
            if c != 0 {
                print("\((_a + _b) / _c)")
            }
        }
    }
}
*/
/**
 If you look sideways ,
 it looks like a pyramid
 and the community came up with a name for this  , the optional pyramid of doom .
 In Swift 1 ,
 this is how we did things and everyone hated it .
 Swift 2 onwards , things improved .
 And thankfully this is not the case . So we can rewrite this code :
 */
if
    let _daily = weatherDictionary["Daily"] ,
    let _temperature = _daily["Temperature"] {
    print("The daily temperature is \(_temperature) .")
}
/**
 We are adding multiple checks to one if let statement
 where each check ,
 each subsequent check
 relies on the one before it passing .
 So , in this case , if the "Daily" key does not exist , and therefore , we get nil back ,
 we won't even try and check for this _daily value .
 So , this — weatherDictionary["Daily"] — has to succeed first before we can even get to _daily["Temperature"] .
 `NOTE` : Notice that the value from using the "Daily" key
 is assigned to the _daily temporary constant .
 And we can use the _daily temporary constant as a dictionary in the next logical optional bind .
 So, for this statement
 */
// let _temperature = _daily["Temperature"] { ... }
/**
 we can use this constant — let _daily — if it succeeds .
 Pretty nifty .
 */
/**
 So to recap ,
 force unwrapping
 very bad .
 Choice number one :
 an optional bind using an if let .
 Now there are some downsides to this approach . We will tackle that in the next video .
 */
