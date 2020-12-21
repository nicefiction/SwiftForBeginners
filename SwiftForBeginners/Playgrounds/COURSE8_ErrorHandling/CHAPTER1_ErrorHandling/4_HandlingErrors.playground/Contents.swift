import Foundation

/**
 `4 Handling Errors`
 INTRO —Now that we have thrown an error we need to be able to handle it gracefully
 so that our program execution does not halt .
 */
/**
 Our code has now encountered an error we need to handle .
 In Swift processing an error , involves ,
 first catching it ,
 and then handling it ,
 and we do this using
 a do catch statement .
 */
struct Friend {
    var name: String
    var age: String
    var address: String?
}


enum FriendError: Error {
    case invalidData(String)
}


func newFriend(from dictionary: [String : String])
throws -> Friend {
    
    guard
        let _name = dictionary["name"]
    else {
        throw FriendError.invalidData("The name is missing .")
    }
    
    guard
        let _age = dictionary["age"]
    else {
        throw FriendError.invalidData("The age is missing .")
    }
    
    let address = dictionary["address"]
    
    return Friend(name : _name ,
                  age : _age ,
                  address : address)
}


let response = [
    "name" : "Dorothy" ,
    "age" : "17" ,
    "address" : "Oz"
]
/**
 Let's get rid of the last two lines of code that we wrote here :
 */
// let dorothy = try newFriend(from : response)
/**
 Instead , we are going to write
 a do catch statement .
 Inside the do statement ,
 we add any functions that can throw errors .
 Along with the calls to the throwing functions ,
 we add any code
 that depends on these throwing functions being successfully executed .
 Let's say we had a function to send a message to a friend :
 */
func send(message: String ,
          to friend: Friend) {}
/**
 We don't care about the body of this function .
 All we care about is that
 upon creating an instance of Friend ,
 we want to send a message to this friend .
 So , for func send( ) to work ,
 obviously the creation of a Friend has to succeed :
 */
do {
    let dorothy = try newFriend(from : response)
    send(message : "Hello world" ,
         to : dorothy)
}
/**
 Inside the do clause
 we first make a call to the throwing function
 using the keyword
 try
 like we did earlier  .
 We use
 try ,
 because , remember ,
 `func newFriend(from dictionary: [String : String]) throws -> Friend  { ... }`
 is a throwing function .
 If this code works ,
 `let dorothy = try newFriend(from : response)`
 any other code that we want executed
 that is dependent on this working ,
 `let dorothy = try newFriend(from : response)`
 we can add inside the do clause as well :
 `send(message : "Hello world" , to : dorothy)`
 So , obviously ,
 sending a message to this friend is only going to happen
 if we can actually create the friend . So in here ,
 `do { ... }`
 the do clause contains our happy path of code .
 What happens though if the throwing function returns an error ?
 If an error is thrown from code inside a do clause .
 The error is propagated to its outer scope
 until it is handled by a catch clause .
 This is why we mark throwing functions with the keyword try .
 It allows the compiler to know that if this fails ,
 `let dorothy = try newFriend(from : response)`
 then the scope should be propagated out of
 do
 and to the next nearest clause
 which is a catch clause .
 */
do {
    let dorothy = try newFriend(from : response)
    send(message : "Hello again" ,
         to : dorothy)
} catch let error {
    print(error)
}
/**
 Since the error from the do clause is propagated to the outer scope .
 We can catch this error
 which is what we are doing here
 and bind it to a local constant , let error .
 
`NOTE`: let error
 is automatically bound by default
 to a constant called
 error .
 So , doing this
 `do { ... } catch { ... }`
 is the same as
 `do { ... } catch let error { ... }`
 But , that really doesn't look nice .
 At least it doesn't indicate what we're catching here ,
 so we are always going to write this out ,
 so we bind locally .
 
 Now this works ,
 so I can say `print(error)` ,
 and if I had an error in the response dictionary :
 */
var response2: [String : String] = [
    "ame" : "Glinda" ,
    "age" : "42" ,
    "address" : "Oz"
]
/**
 you’ll see that the error is printed out .
 But we can do something better .
 A catch clause can include an optional pattern,
 like case in the switch statement
 that matches on the error :
 */
do {
    let glinda = try newFriend(from : response2)
    send(message : "Hello Glinda" ,
         to : glinda)
} catch FriendError.invalidData(let description) {
    print(description)
}
/**
 `NOTE` : Rather than just binding to a generic error
 `catch let error`
 you can include a pattern
 — just like you would in a switch statement —
 including the use of conditional logic .
 We’ll say , catch this very specific error :
 `catch FriendError.invalidData(let description)`
 So now ,
 rather than catching all the errors that bubble out of the do clause ,
 we are looking for
 and catching
 a very specific error.
 So , we are saying
 if this error is thrown
 then we are going to use it in the body of this catch clause :
 `catch FriendError.invalidData(let description)`
 This change doesn't make much of a difference right now
 because our FriendError enum only has a single case of invalidData .
 But as your Error types contain many cases ...
 */
enum FriendError2: Error {
    case invalidData(String)
    case someError
}
/**
 ... or as more than one Error type can be thrown .
 Reacting in certain ways to specific errors makes quite a difference .
 So , for example , in the case of invalid data ,
 let's assume that we want to inform the user that they passed in invalid data .
 So , this could be in the form of an alert dialogue ,
 or some sort of message in a console ,
 for our purposes let's just print out the description .
 So in this case , if we want to handle more than one particular error :
 */
do {
    let glinda = try newFriend(from : response2)
    send(message : "Hello again Glinda" ,
         to : glinda)
} catch FriendError2.invalidData(let description) {
    print(description)
} catch FriendError2.someError {
    print("Some error .")
}
/**
 We can add subsequent catch clauses . This is necessary .
 Because unlike other languages ,
 Swift's error handling mechanism doesn't preserve the type of error thrown .
 For example our newFriend( ) function
 `func newFriend(from dictionary: [String : String]) throws -> Friend  { ... }`
 just indicates that it throws an error ,
 but it doesn't say what kind of error it throws ,
 we don't know that it is an error of type FriendError .
 So , we need to figure out
 what different kinds of errors can occur from calling this try function
 this failing function ,
 `let glinda = try newFriend(from : response2)`
 and react to them in ways that are appropriate for our users :
 `catch FriendError2.invalidData(let description) { print(description) }`
 `catch FriendError2.someError { print("Some error .") }`
 */


/**
 `SWIFT Documentation` :
 Handling Errors Using Do-Catch
 You use a do-catch statement
 to handle errors
 by running a block of code .
 If an error is thrown by the code in the do clause ,
 it is matched against the catch clauses
 to determine which one of them can handle the error .
 Here is the general form of a do-catch statement :
 */
/*
do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
} catch {
    statements
}
 */
/**
 You write a pattern after catch
 to indicate what errors that clause can handle .
 If a catch clause doesn’t have a pattern ,
 the clause matches any error
 and binds the error to a local constant named
 error .
 */
