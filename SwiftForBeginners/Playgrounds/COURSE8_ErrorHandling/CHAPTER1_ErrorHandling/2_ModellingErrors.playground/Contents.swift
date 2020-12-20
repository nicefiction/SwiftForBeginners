import Foundation

/**
 `2. Modelling Errors`
 INTRO  — In Swift , error types are created
 by conforming to the Error protocol .
 Enums are particularly well suited for this task ,
 and in this video we create our own custom error types .
 */
/**
 In this example , ...
 */
struct Friend {
    var name: String
    var age: String
    var address: String?
}


func createFriend(from dictionary: [String : String])
-> Friend? {
    
    guard
        let _name = dictionary["name"] ,
        let _age = dictionary["age"]
    else { return nil }
    
    let address = dictionary["address"]
    
    return Friend(name : _name ,
                  age : _age ,
                  address : address)
}
/**
 ... we are treating the absence of data from the web as a domain error .
 If the data does not exist , no big deal , let's return nil .
 But we may not always want to do this . Let's modify this example slightly .
 In our new scenario ,
 we can't return an optional Friend?
 because our app needs a valid Friend to continue .
 This function has to return a fully valid instance of Friend
 for the app to continue or for a logic to work :
 */
/*
func newFriend(from dictionary: [String : String])
-> Friend {
    
    guard
        let _name = dictionary["name"] ,
        let _age = dictionary["age"]
    else { return nil } //  ERROR : nil is incompatible with return type Friend .
    
    let address = dictionary["address"]
    
    return Friend(name : _name ,
                  age : _age ,
                  address : address)
}
*/
/**
 When we make Friend a non-optional value ,
 we have a compiler error .
 We are returning nil from our guard statement ,
 but we can't do that anymore
 because the return type — Friend — is not optional .
 Well , let's think about what our code is doing here .
 We were returning nil
 because the values we were expecting don't exist .
 When the data does not exist , this shouldn't cause our app to crash ,
 but we also don't want the app to continue execution , pretending like a nil value is okay . Instead ,
 we want to anticipate and treat this as a recoverable error ,
 where we want to halt the execution in some way ,
 but we don't want to crash .
 We want to indicate that the initialisation of our object could go wrong .
 And if this happens ,
 we raise an error .
 
 Before we can actually raise an error ,
 we need to model what can go wrong in our code .
 In Swift ,
 errors are represented by values of types conforming to the Error protocol .
 Any type
 — structs , enums , or classes —
 can be used to model an Error .
 We are going to use enums
 because they are ideally suited for this task .
 For this simple example ,
 we are going to model errors that occur
 when creating an instance of the Friend class :
 */
enum FriendError: Error {
    case invalidData
}
/**
 To let the compiler know that this enum will model a series of errors ,
 we need to conform to the Error protocol  .
 
 `NOTE` : If we COMMAND click on the Error protocol ,
 to look at the header file and see the body of the Error protocol ,
 you’ll be surprised to see that it is an empty protocol .
 
 Now as odd as this is ,
 it means that we don't have to implement anything in our FriendError enum
 to actually conform to the Error protocol .
 Our FriendError enum is now recognised as a valid Error type by the system .
 When writing apps ,
 there are lots of little things that could go wrong ,
 and lots of errors we will have to raise .
 When using an enum ,
 we can group a related set of errors into a single type ,
 and then define each individual type of error as an enum member .
 The main error we are going to have here is
 invalidData .
 The alternative is to simply say an error occurred .
 And here , we are running into the issue where an error is more or less universal .
 We don't know where it came from or what actually went wrong .
 So we don't know how to anticipate it
 and deal with it in a manner that informs the end user .
 
 Now that we have a way to model an error ,
 let's see what we can do with it .
 */
