import Foundation


/**
 `2 Swift's Standard Library Protocols`
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

let dorothy = Human( name : "Dorothy" ,
                     address : "Oz" ,
                     age : 17 )

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

let ozma = Human( name : "Dorothy" ,
                  address : "Oz",
                  age : 17 )

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
 If your protocol models behaviour about something your object can do ,
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
 that the protocol `models a concrete type` , and in fact ,
 Swift follows the conventions of using nouns for these names .
 So `Is A` ,
 in this case for the naming sake ,
 is a convention that I have made up .
 The various examples of this are
 the `Collection` protocol ,
 `Integer` protocol ,
 and so on .
 They `model the identity of an object` .
 These are great to look at in the Standard Library
 as they form the basis for all the types that we have learned about so far .
 But since we won't be implementing base types like this ,
 we won't be writing too many of these kinds of protocols .
 */
/**
 `3. Can Be`
 Now last up is the `Can Be` set of protocols .
 `Can Be` protocols are pretty intuitive .
 They `model behaviour where one type can be converted to another type` .
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


/* * * * *
 * EXTRA :
 */

/**
 `GREG HEO : WHAT THE 55 SWIFT STANDARD LIBRARY PROTOCOLS THAUGHT ME `
 🔗 https://youtu.be/_kpYI6GjCuw
 */
/**
 `GREG HEO : Three types of protocols` PART 1 of 3
 */
/**
 With single inheritance ,
 class hierarchies things are linear :
 */

class Animal {}
    class Feline: Animal {}
        class Jagwyre: Feline {}
        class Liger: Feline {}
    class Canine: Animal {}
        class Doge: Canine {}
        class Pug: Canine {}

/**
 You have got parents , child , grandchild , all the way down the family tree .
 And when you go back up the tree ,
 then everything has a single parent .
 That keeps the hierarchy clean.
 However, with single inheritance ,
 ( 1 ) you do lose the benefits that multiple inheritance can offer when used properly .
 ( 2 ) In Swift , there is no inheritance for enumerations and struct types
 — it is class types only .
 That means you sometimes need to twist yourself into a pretzel
 to make sense of your types .
 You can end up with really generic super classes .
 And then many , many levels down ,
 you have a class that you can actually instantiate , and use .
 
 So with protocols ,
 you can make the type system
 a little bit more compositional .
 You can clean up the long chain of inheritance .
 Of course you are going to be trading a long tall chain of inheritance ,
 for a wide chain of protocol conformance .
 But I think the tradeoffs are worth it ,
 and I hope you'll be convinced by the end of this talk .
 What kind of things make sense to put into protocols ?
 I'm not going to talk about cool protocols that I have made .
 But instead I want to take a tour of the protocols that Apple has shipped
 in the Swift Standard Library . We'll take a little tour ,
 maybe you'll learn about some protocols that you haven't heard of before .
 We'll see what big ideas that we can take ,
 and then maybe get some inspiration
 on what kinds of things we can use with protocols in our own code .
 Basically the idea of this talk is
 how does the way the Swift team uses protocols ,
 give us hints on how we can do it ?
 The Swift Standard Library includes 54 actual public protocols .
 My initial jokey pitch for this talk , was ,
 I would go through them one by one , taking 16 seconds each to fill the time ,
 but instead ,
 I have broken them up into three categories :

 ( 1 ) Can Do
 ( 2 ) Is A
 ( 3 ) Can Be
 
 We have got the `Can do` protocols ,
 the `Is a` protocols ,
 and then the `Can be` protocols .
 So we'll take them one at a time , see some examples ,
 and then see what lessons that we can take .
 */
/**
 `1. Can Do protocols`
 First up we got the `Can do` protocols .
 These describe things that the type can do or have done to it .
 They also end in the `-able` syntax
 which makes them easy to spot as you are browsing through the headers .
 Here is an example :
 
 `Hashable` ,
 `Equatable` ,
 `Comparable` ,
 
 These protocols describe operations that you can perform on the type .
 There is also a small sub set of protocols in this `can do` group
 that have to do with alternate views or alternate representations :
 
 `RawRepresentable` ,
 `CustomPlaygroundQuickLookable`
 
 `NOTE`
 `CustomPlaygroundQuickLookable` means
 that your type can be quick looked from a playground .
 And that means that , again , your type is the same ,
 you are not really converting it to something else ,
 but you are providing an alternate view for your value .
 In this case , it is something that you can display in a quick look .
 
 So we have got _Operations_ ,
 we have got _Alternate Views_ .
 */
/**
 `2. Is A protocols` [7:30]
 Next step are the `Is a` protocols ,
 and these describe what kind of thing the type is .
 In contrast to the `can do` protocols ,
 these are more based on identity . That means ,
 conforming to multiple protocols of this kind
 feels the closest to something like multiple inheritance in Swift .
 You can identify these protocols in the Standard Library
 because they end in the word `-Type` .
 And this is fully half of the Standard Library ,
 something like 35 or so of those 54 are of this kind :
 
 `CollectionType` ,
 `IntegerType` ,
 `FloatingPointType` ,
 `BooleanType` ,
 `ErrorType` ,
 `SequenceType` ,
 `GeneratorType`
 
 That means ,
 once you have these protocols set up ,
 you can build up what used to be that giant list of super-classes
 and you instead have a set of protocols , with inheritance if you need it .
 And then when you construct your type,
 you can choose which slices of identity here
 and functionality apply to the type.
 Since your types can conform to multiple protocols ,
 this is how you build up the functionality of your type little by little
 based on protocol conformance .
 That is the second type of Standard Library protocol .
 The `Is a` protocols ,
 having to do with grouping things together and identity .
 */
/**
 `3. Can Be protocols` [11:30]
 Finally we have the `Can be` types .
 Rather than just an alternate view of the same thing
 — as we have already seen —
 these are more about straight on conversion .
 Changing from type X
 over to type Y .
 And these ones end in the word `-Convertible` .
 So that means that the type can either be converted from
 or converted to
 something else .
 
 `FloatLiteralConvertible`
 `IntegerLiteralConvertible`
 `ArrayLiteralConvertible`
 `CustomStringConvertible`
 
 That is the third type of Standard Library protocol .
 The `Can be` protocol family ,
 handling conversions between your types .
 */


/**
 `GREG HEO : Four broad patterns` PART 2 of 3
 INTRO — So we have seen three kinds of protocols
 from the Standard Library
 having to do with capability , identity , and conversion .
 What are the broad patterns that we can think about
 that we have seen from our own code ? We have got four of them :
 */
/**
 `2.1 Operations` [15:30]
 If there are a common set of operations
 that you have to perform on your types ,
 consider breaking these out into a protocol .
 Related to that was Alternate views ...
 
 `2.2 Alternate views`
 ... if your type has an alternate view ,
 or an alternate representation
 that is not quite a full on conversion ,
 think about whether it belongs as a common protocol .
 
 `2.3 Identity`
 For identity ,
 this is your chance to have something like
 multiple inheritance , or mix-ins in your types .
 Thinking about identity and what the types are
 and grouping similar types together with protocols .
 
 `2.4 Conversions`
 Finally we have conversions ,
 whether you convert from a type , or to a type ,
 if that particular conversion is happening a lot in your code
 consider breaking that very common conversion out as a protocol
 to help you keep track of things ,
 and to keep the interface consistent .
 */


/**
 `GREG HEO : Closing notes` PART 3 of 3
 */
/**
 Seeing how much Apple has done to move common functionality ,
 things like map , filter , the enumeration methods , into protocols
 using just plain old protocols
 and also protocol extensions ,
 is a really great example and an inspiration on how powerful the future can be .
 Apple is following this example .
 If you look at the definition of Array , for example , it conforms to eight protocols ,
 String conforms to 12 protocols , and so on .
 So the idea here is
 that you are creating these feature bundles in protocols ,
 and then you can just use them from all over your code base .
 I think thinking about your types in this way
 can help you keep things straight and categorised in your head.
 So , I definitely encourage you to try this out in your own code .
 Look at your types through the lens of what they have in common using protocols .
 And that is all I have got . Protocols forever , thank you !
 */
