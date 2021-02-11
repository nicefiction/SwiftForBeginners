import Foundation


/**
 `2 Creating a Protocol`
 INTRO —Now that we are familiar with the syntax ,
 let's create our first protocol .
 */
/**
 Let's define a struct which we’ll call `User`
 to represent a user in this hypothetical app of ours .
 In our app , we are often going to refer to our user with their full name ,
 so we want to have a full name property .
 We could simply add the full name , but that doesn't enforce it .
 It is up to me to do that if I want . So instead ,
 let's make the `User` struct conform to the `FullNameable` protocol .
 A protocol can be adopted by a class , struct , or enumeration
 and these objects can then define an implementation for the requirements
 that are specified by the protocol . So let's see what this looks like :
 */

protocol FullNameAble {
    
    // var fullName: String { get set }
    var fullName: String { get }
}


// struct User: FullNameAble {} // ERROR : Type 'User' does not conform to protocol 'FullNameAble' .

/**
 This looks a lot like how a class specifies a superclass or base in its inheritance hierarchy ,
 but that is not what this is .
 You'll notice though in a moment that when you do this ,
 you have an error .
 
 `// ERROR : Type 'User' does not conform to protocol 'FullNameAble' .`
 
 When you specify that a type
 that is a class , struct , or enumeration adopts a protocol ,
 you have to provide an implementation as described by the protocol to conform to it .
 The `FullNameAble` protocol states
 that you must have a stored property called `fullName`,
 so let's add that :
 */

struct User: FullNameAble {
    
    // var fullName: Int
    // let fullName: String // ERROR : Type 'User' does not conform to protocol 'FullNameAble' . Candidate is not settable , but protocol requires it .
    var fullName: String
}

/**
 `NOTE` :
 If a stored property requirement in a protocol
 is defined as both gettable and settable ,
 the property cannot be implemented as a constant .
 `NOTE` OLIVIER :
 If a stored property requirement in a protocol
 is defined as gettable
 the property can be implemented as both a constant and variable .
 */
/**
 Notice the moment we add this , the error goes away .
 Also take note of the fact that I specified the type here to be `String` .
 Now, what if I change this to an `Integer` ? Again ,
 we get an error , and if we click it :
 
 `// ERROR : Type 'User' does not conform to protocol 'FullNameAble' .`
 
 it says that Type `User` does not conform to the protocol .
 All right , so let's change that again :
 
 `var fullName: String`
 
 Our protocol not only requires
 (1) that you have a property called `fullName`
 but also (2) that it is of type `String` .
 Any type that satisfies the requirements of a protocol is said
 _to conform to that protocol_ .
 In this case ,
 we are saying that the `User` struct conforms to the `FullNameable` protocol .
 Now , let's create an instance of `User` with the full name :
 */

let dorothy = User(fullName: "Dorothy of Oz")

/**
 Like I said earlier ,
 we could have simply added the stored property without having to conform to a protocol .
 The advantage of specifying the protocol is
 that it provides an expectation of certain attributes or behaviour .
 By identifying that `User` conforms to `FullNameAble` ,
 we know that it must have a property called `fullName` .
 
 Protocols can require
 that conforming types have
 specific instance properties ,
 instance methods ,
 type methods , which we don't know about yet , and so on .
 
 Remember ,
 I said that a protocol only describes an implementation
 but doesn't actually provide one .
 So let's define another struct :
*/

/*
 struct Friend {
 
    let firstName: String
    let middleName: String
    let lastName: String
 }
*/

/**
 Okay, now let's adopt `FullNameAble` again .
 So struct `Friend` conforms, or adopts, `FullNameAble` :
 */

/*
struct Friend: FullNameAble { // ERROR : Type 'Friend' does not conform to protocol 'FullNameAble'
    
    let firstName: String
    let middleName: String
    let lastName: String
}
*/

/**
 Again , we get an error .
 Because `Friend` now does not have a `fullName` property. This time ,
 we are going to add a computed property for `fullName`
 that creates a `fullName` automatically
 using values from the other stored properties .
 We haven't learned about computed properties just yet .
 Don't worry , we'll spend more time on them in the future .
 
 `ASIDE` :
 A computed property ,
 all you should know for now ,
 lets you create a property
 that determines its value
 through some computation ,
 hence the name computed property .
 You cannot assign it a value directly and it has no storage .
 
 So to assign a value indirectly , we'll say
 */

struct Friend: FullNameAble {
    
    let firstName: String
    let middleName: String
    let lastName: String
    
    
    var fullName: String {
        
        return "\(firstName) \(middleName) \(lastName)"
    }
}

/**
 `NOTE` OLIVIER :
 `fullName` can be defined here as a computed property
 because the property requirement in the proptocol
 has been defined as gettable only ...
 
 `struct User: FullNameAble {`
 
    `var fullName: String { get }`
 `}`
 
 ... If the property would be settable as well
 then one could define the property as a constant as well ,
 which is not allowed with conputed properties .
 
 
 We have created an interpolated String here ,
 
 `return "\(firstName) \(middleName) \(lastName)"`
 
 Now we can create an instance of Friend :
 */

let glinda = Friend(firstName : "Glinda" ,
                    middleName : "Queen" ,
                    lastName : "of Oz")

/**
 We can now get glinda's fullname by using the `fullName` property :
 */

glinda.fullName

/**
 `NOTE OLIVIER` :
 You get an error if you change the `var` keyword of the computed property to a `let` keyword .
 */
/**
 Notice a very important thing here :
 Both `User` and `Friend` conform to the `fullNameAble` protocol
 but they differ in their implementation .
 In the case of `User` ,

 `let dorothy = User(fullName: "Dorothy of Oz")`
 
 we assigned a value to `fullName` when we initialized an instance of `User` .
 Whereas with the instance of `Friend` ,
 
 `let glinda = Friend(firstName : "Glinda" ,`
                     `middleName : "Queen" ,`
                     `lastName : "of Oz")`
 
 we assign a value to `firstName` , `middleName` , and `lastName`
 and then use those three properties to compute a `fullName` .
 
 `glinda.fullName`
 
 This is an important characteristic of protocols .
 All our `FullNameAble` protocol says , is ,
 that you need to have a `fullName` property .
 It doesn't say how you should get this property .
 Can you assign a value to it ,
 or do you compute it from other properties ?
 None of that matters .
 A protocol specifies what should be implemented ,
 but does not require a specific implementation .
 That is left up to the class structure ,
 or enumeration that adopts it .
 We'll see how this is useful as we go through the course .
 */
