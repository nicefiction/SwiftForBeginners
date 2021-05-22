import Foundation


/**
 `2 Swift's Standard Library Protocols`PART 4 OF 6

 
 `2. IS A protocols` [7:30]
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
 
 So , that is the `Is a` protocols .
 Protocols as identity .
 And what are the lessons that we can take from this pattern of protocol ?
 Again, since these are identity based rather than operation based ,
 you can use them for your larger groupings of your types .
 Back to the canonical animal kingdom example :
 
 `Animal -> Mammal ->  Barks -> FourLegs -> Canine`
 
 Here is an exaggerated class hierarchy that is very long .
 We don't even have a type at the bottom that we can instantiate .
 Each step in this class hierarchy adds a little bit of functionality
 on top of the previous one . With protocols ,
 you can make your type system more compositional :
 */

protocol IsALegsType {}
protocol IsATwoLegsType: IsALegsType {}
protocol IsAFourLegsType: IsALegsType {}
protocol CanDoBark {}
protocol CanDoMeow {}
protocol IsAMemeFriendlyType {}
 
 /**
 You have this menu of protocols
 that you can build and take to use in your different types .
 `BarkAble` and `MeowAble` for example ,
 are more of a `can do` style of what the animal _can do_ ,
 whereas `TwoLegsType` and `FourLegsType`
 are more of an identity type .
 And you'll notice that` TwoLegsType` and `FourLegsType` also have inheritance ,
 because protocols can have inheritance like that .
 That means ,
 once you have these protocols set up ,
 you can build up what used to be that giant list of super-classes
 and you instead have a set of protocols , with inheritance if you need it .
 And then when you construct your type,
 you can choose which slices of
 identity here
 and functionality
 apply to the type :
 */

class Doge: IsAFourLegsType ,
            CanDoBark ,
            IsAMemeFriendlyType {}

class Liger: IsAFourLegsType ,
             CanDoMeow {}

/**
 Since your types can conform to multiple protocols ,
 this is how you build up the functionality of your type little by little
 based on `protocol conformance` .
 That is the second type of Standard Library protocol .
 The `Is a` protocols ,
 having to do with grouping things together and identity .
 */
/**
 👉 Continues in PART 5
 */
