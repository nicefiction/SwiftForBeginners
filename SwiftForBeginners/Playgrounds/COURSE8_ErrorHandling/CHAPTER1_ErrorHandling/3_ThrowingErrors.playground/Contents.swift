import Foundation

/**
 `3 Throwing Errors`
 INTRO —For a function to return an error ,
 it needs to be marked with a special keyword .
 In this video we look at how we can throw errors .
 */
/**
 Errors in our code occur when we try to do some work
 and work is always done in a function .
 By default a function doesn't raise or throw an error .
 And this makes sense because not all functions contain code that can result in an error condition .
 When we specifically want to indicate that our function contains code
 that can result in an error ,
 we indicate this in the signature of the function with the keyword
 throws .
 So now that we have a function that can throw an error ,
 let's throw one :
 */
struct Friend {
    var name: String
    var age: String
    var address: String?
}


enum FriendError: Error {
    case invalidData
}


func newFriend(from dictionary: [String : String])
throws -> Friend {
    
    guard
        let _name = dictionary["name"] ,
        let _age  = dictionary["age"]
    else { throw FriendError.invalidData }
    
    let address = dictionary["address"]
    
    return Friend(name : _name ,
                  age : _age ,
                  address : address)
}
/**
 In the guard statement ,
 we are checking to see that name and age are actual values that we retrieve from the dictionary
 using a set of keys ,
 `let _name = dictionary["name"]` ,
 `let _age  = dictionary["age"]`
 If we use the keys and don't get values back , that is ,
 we get nil back for any of those ,
 then we are going to step into the else clause .
 That is because this dictionary does not contain the data we need .
 So at this point , from our perspective , an error has occurred .
 So rather than returning nil , we can throw an error :
 `throw FriendError.invalidData` .
 If we are throwing an error ,
 throws
 is always added in the function declaration
 after the parameter list
 and before the return type .
 
 `NOTE` : It is important to note that a function or method
 cannot throw an error
 unless explicitly indicated using the
 throws
 keyword .
 With the addition of this keyword
 throws ,
 the compiler knows that an error can occur inside this function .
 Note the distinction here ,
 a function indicates that it throws an error by using the keyword
 throws
 with an s .
 But to actually throw an error at any point inside the function , we use
 throw ,
 without the s .
 
 Now instead of returning a nil value ,
 we are throwing an error .
 As you will soon discover ,
 this is more informative
 because of the way errors are handled by the system .
 
 `NOTE`:
 In a previous course we learned about control transfer statements
 like
 return ,
 break , and so on .
 It is important to note , that like the return statement ,
 when you hit a throw statement ,
 you exit the current scope .
 In our case , if we hit ,
 `throw FriendError.invalidData`
 we exit the function completely .
 */
/**
 So now we have a throwing function that throws an error .
 How do we use it ?
 Because a throwing function can end in an error ,
 we can't call it like we do in a regular function .
 Because of the throwing function can fail ,
 we need to try and call it .
 We do this using the keyword
 try .
 So first ,
 let’s make up some fake dictionary that we can use that does not contain the data that we need :
 */
let response: [String : String] = [
    "name" : "Dorothy" ,
    "age" : "17" ,
    "address" : "Oz"
]
/**
 To use the func newFriend( ) now ,
 and create an instance of Friend ,
 we need to use the
 try
 keyword :
 */
//do {
//    try newFriend(from: response)
//} catch {
//    throw FriendError.invalidData
//}
let dorothy = try newFriend(from : response)

print(dorothy)
/**
 When you have a line of code with the keyword try , the code
 `print(dorothy)`
 after this line of code here
 `let dorothy = try newFriend(from : response)`
 may not be executed
 depending on the result of calling func friend( ) .
 When we use the try keyword , this line of code
 `let dorothy = try newFriend(from : response)`
 and any lines following the try statement
 `print(dorothy)`
 they are only executed if calling func friend( ) succeeds .
 If I edit a key in our response dictionary , ...
 */
let response2: [String : String] = [
    "ame" : "Dorothy" ,
    "age" : "17" ,
    "address" : "Oz"
]
/**
 ... so that the guard check in the friend( ) function fails , ...
 */
let dorothy2 = try newFriend(from : response2)
/**
 ... then the print statement
 */
print(dorothy2)
/**
 won't be executed . Instead ,
 the function throws an error , fails ,
 and the try keyword
 prevents the subsequent lines of code from executing .
 */

/**
 `ASIDE : Angela Yu [ Module 8 , Error Catching in Swift 4 ]`
 There is a way to get the meaning of the error code you get in the debug console .
 After crashing the app in the simulator ,
 copy the code in the debug console .
 Open your browser ,
 and surf to `osstatus.com` .
 Paste the code in the search field .
 */

/**
 We can improve our code using enum functionality to provide more information .
 So while things go wrong — and we know that something went wrong —
 we don't know exactly what went wrong .
 So , let’s modify our Error type and add an associated value of type String :
 */
enum FriendError2: Error {
    case invalidData(String)
}
/**
 And now when something goes wrong , ...
 */
func newFriend2(from dictionary: [String : String])
throws -> Friend {
    
    guard
        let _name = dictionary["name"]
    else {
        throw FriendError2.invalidData("The name is missing .")
    }
    
    guard
        let _age = dictionary["age"]
    else {
        throw FriendError2.invalidData("The age is missing .")
    }
    
    let address = dictionary["address"]
    
    return Friend(name : _name ,
                  age : _age ,
                  address : address)
}
/**
 ... we know what the point of failure is .
 Associated values with an enum allow us to provide more meaning and context .
 Not only do we know what kind of error occurred ,
 but we can also understand why ,
 and where that error occurred as well .
 This makes sense . If something goes wrong and an error is thrown ,
 we don't want our code to continue as if nothing happened .
 
 But what do we do in a case like this where the error is thrown ?
 How do we react to the error being thrown
 and what sort of path does our code follow after this ?
 Let's handle that aspect in the next video .
 */
/**
 `NOTE` : Now before we conclude though ,
 there are some important comments I should make to clarify how these functions work .
 The throw keyword right here
 `throw FriendError.invalidData("Name is missing.")`
 always takes an argument .
 This means that you cannot simply specify
 throw
 or saying you want to throw an error without indicating what actual error you want to throw .
 Also , Swift keeps track of the
 throws
 keyword in the function declaration
 just like it does a return type . If a function is not indicated to be a throwing one ,
 trying to throw an error from within leads to a compiler error .
 Okay , let's move on to dealing with the errors that we have thrown .
 */
