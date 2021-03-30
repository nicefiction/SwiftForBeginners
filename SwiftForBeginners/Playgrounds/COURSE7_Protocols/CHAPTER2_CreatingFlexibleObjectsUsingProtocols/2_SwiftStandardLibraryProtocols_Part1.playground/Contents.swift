import Foundation


/**
 `2 Swift's Standard Library Protocols`PART 1 OF 6
 INTRO —The Swift language itself is built on a foundation of protocols .
 In this video , we dive into the `Standard Library`
 and explore the many protocols that make up Swift .
 */
/**
 The protocol we just wrote , `PrintAble` ,
 */

protocol PrintAble {
    
    func description() -> String
}


protocol NotSoPrettyPrintAble {
    
    func notSoPrettyDescription() -> String
}


protocol PrettyPrintAble: PrintAble ,
                          NotSoPrettyPrintAble {
    
    func prettyDescription() -> String
}

/*
struct Human: PrettyPrintAble {

    let name: String
    let address: String
    let age: Int
    
    
    func description()
    -> String {

        return "\(name) \(address) \(age)"
    }
    
    
    func prettyDescription()
    -> String {
        
        return "Name : \(name)\nAddress : \(address)\nAge : \(age)"
    }
    
    
    func notSoPrettyDescription()
    -> String {
        
        return "\(name)\(age)\(address)"
    }
}
*/

let dorothy = Human(name : "Dorothy" ,
                    address : "Oz" ,
                    age : 17)

/**
 is already part of the Swift Standard Library
 under a different name , `CustomStringConvertible` .
 Standard libraries are part of programming languages ,
 and the Swift Standard Library contains
 the basic types and collections
 we have been working with ,
 along with different sorts of
 protocols ,
 methods ,
 and many other things .
 A good place to understand how Swift uses protocols , is ,
 to look at what they are used for in the Standard Library .
 Let's go to a high level view of this .
 The Swift Standard Library contains
 several primary protocols ,
 and they can be grouped into three main sections :

 Swift Standard Library Protocols :
 
 1. `Can Do`
 2. `Is A`
 3. `Can Be`
 
 `1. Can Do`
 The first group of protocols , `Can Do` ,
 are used `to represent behaviour where an object can do something` .
 For example , to compare one object to another of the same type ,
 we encapsulate this behaviour in a protocol called `Equatable` .
 To jump to the definition of `Equatable` in the Standard Library ,
 COMMAND click on `Equatable` :
 
 `public protocol Equatable {`
     `...`
     `static func == (lhs: Self, rhs: Self) -> Bool`
 `}`
 
 Any object that conforms to `Equatable`
 is required to provide an implementation for the double equals operator
 as a static function .
 All this time we have used the double equals operator ,
 — the equality or the comparison operator —
 to compare one object to another . Under the hood ,
 all that meant was that our object conformed to `Equatable`
 and provided the necessary implementation allowing us to use this operator .
 This means that we can compare any of our custom types
 by making any of our objects conform to `Equatable` .
 To see what this means , let's try this with an example .
 Let's first create another instance — `ozma` —
 with the exact same values for the stored properties :
 */

let ozma = Human(name : "Dorothy" ,
                 address : "Oz",
                 age : 17)

/**
 So , if we say ...
 */

// ozma == dorothy // ERROR : Binary operator '==' cannot be applied to two 'Human' operands .

/**
 we are getting an error .
 So let’s make the `Human` struct conform to the `Equatable` protocol :
 */

struct Human: PrettyPrintAble ,
              Equatable {

    let name: String
    let address: String
    let age: Int
    
    
    func description()
    -> String {

        return "\(name) \(address) \(age)"
    }
    
    
    func prettyDescription()
    -> String {
        
        return "Name : \(name)\nAddress : \(address)\nAge : \(age)"
    }
    
    
    func notSoPrettyDescription()
    -> String {
        
        return "\(name)\(age)\(address)"
    }
    
    
    static func ==(lhs: Human ,
                   rhs: Human)
    -> Bool {
        
        return lhs.name == rhs.name &&
            lhs.age == rhs.age &&
            lhs.address == rhs.address
    }
}


ozma == dorothy

/**
 To conform to the `Equatable` protocol ,
 we need to provide an implementation for the `==()` function .
 `lhs` here refers to the _left hand side_ argument that we provide to the operator .
 `lhs: Human` refers to the instance of the `Human` on the _left hand side_ .
 Inside the `==()` function ,
 we can make it as simple or as complex as we want it to be .
 
 `NOTE` : Now we haven't learned about `static functions` just yet ,
 but think of them as functions that are called on the type itself
 and not on instances .
 A `static function` is called on the type ,
 and an instance method is called on the instance .
 
 `NOTE OLIVIER` : Note how we can make use of the equality operator
 inside the static function .
 
 `NOTE` :
 Similarly ,
 when an object wants to compare itself to another instance of the same type ,
 using the greater than `>` or less than `<` operators for example ,
 this is encapsulated in the `Comparable` protocol .
 The requirements for the `Comparable` protocol are
 that the object provide implementations
 ( 1 ) for the equality operator
 and ( 2 ) the less than operator .
 Using these implementations , the compiler can figure out the rest .
 
 There are lots of protocols that fall under this category
 that provide interfaces for varying behaviours ,
 like `Hashable` , `Strideable` , and so on .
 You'll notice that they have one thing in common .
 All of them have the suffix `-able` , at least most of them .
 This is a convention that Swift developers have followed :
 If your protocol models behaviour about something your object _can do_ ,
 they can be compared or hashed or equated ,
 then we add the `-able` suffix.
 Our first protocol indicated that objects can provide a full name ,
 so we called it `FullNameAble` .
 */
/**
 `2. Is A`
 The next grouping in our list of Standard Library Protocols is
 the `Is A` group .
 Now to avoid confusion , I do want to point out
 that we have already established a meaning for `Is A` :
 If your object is a type of another object
 then it should _inherit_ from it using class inheritance .
 Now in the case of this naming over here ,
 `Is A` simply indicates
 that the protocol _models a concrete type_ , and in fact ,
 Swift follows the conventions of using nouns for these names .
 So `Is A` ,
 in this case for the naming sake ,
 is a convention that I have made up .
 The various examples of this are
 the `Collection` protocol ,
 `Integer` protocol ,
 and so on .
 They model _the identity of an object_ .
 These are great to look at in the Standard Library
 as they form the basis for all the types that we have learned about so far .
 But since we won't be implementing base types like this ,
 we won't be writing too many of these kinds of protocols .
 */
/**
 `3. Can Be`
 Now last up is the `Can Be` set of protocols .
 `Can Be` protocols are pretty intuitive .
 They model _behaviour where one type can be converted to another type_ .
 For example ,
 some of these types in the Swift standard library include
 `ExpressibleByFloatLiteral` ,
 `ExpressibleByArrayLiteral` ,
 and `CustomStringConvertible` ,
 which was one of the protocols we wrote earlier ,
 except we called it `PrintAble` .
 With `CustomStringConvertible` , for example ,
 you can take any type that conforms and convert it to a `String` representation .
 So basically , any object `can be` a `String` .
 Objects that conform to these protocols
 can also be initialized with the literal value specified in the protocol .
 For example , take `ExpressibleByNilLiteral` .
 Any type that conforms to this protocol
 implements an initializer method
 that takes a `nilLiteral` as an argument for initialization .
 So , for example , we know that `Optionals` do that ,
 if we COMMAND click on `Optional`
 in order to go to the definition of` Optional` in the Standard Library ,

 `@frozen public enum Optional<Wrapped> : ExpressibleByNilLiteral { ... }`
 
 you'll see that it conforms to `ExpressibleByNilLiteral` .
 And if we scroll down , you’ll see that it has an initialisser that takes a `nil` value .
 This is what allows us to assign `nil` as an initial value to an `Optional` type .
 */
/**
 👉 Continues in PART 2
 */
