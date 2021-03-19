import Foundation


/**
 `2 Value and Reference Types`
 INTRO —The last video underlines
 that `inheritance` isn't the only difference
 between the two types of objects
 and that there is more going on under the hood .
 In this video ,
 we categorise these objects
 and see how it plays a role in choosing the objects we use .
 */
/**
 What you have seen in the previous video
 was an example of a `value` type versus a `reference type` : 
 A `value type` is a type,
 whose underlying value is copied
 when it is assigned to a new `variable` or `constant` ,
 or when it is passed into a `function` .
 All `structs` are `value types` ,
 which means that the `values` are _copied_ .
 When we have assigned `ozma` to `dorothy`...
 */

struct User {
    
    var fullName: String
    var email: String
    var age: Int
}


let dorothy = User(fullName : "Dorothy Gale" ,
                   email : "dorothy@oz.com" ,
                   age : 17)

var ozma = dorothy

dorothy.fullName // "Dorothy Gale"
ozma.fullName // "Dorothy Gale"

ozma.fullName = "Ozma"

dorothy.fullName // "Dorothy Gale"
ozma.fullName // "Ozma"

/**
 ... we didn't really assign `dorothy` to `ozma`.
 What Swift did was
 copy the values
 and assign the new values to `ozma`.
 This leaves us with two copies of the `struct` .
 When we modify the value of `ozma`,
 it doesn't affect `dorothy` in any way. 
 `Value types` are quite common in Swift.
 All the data types we have worked with so far , in fact ,
 `Array` ,
 `Dictionary` ,
 `String` ,
 `tuple` ,
 `enum` ,
 and so on ,
 are all `value types` .
 And this means
 that we have to keep in mind
 that they get copied when we assign them to new variables ,
 knowing this fact will allow us to avoid writing bad code. 
 */
/**
 A `reference type` , on the other hand
 is not copied when assigned to a new `variable` or `constant` ,
 or when passed into a `function` .
 Rather than a copy ,
 a `reference` to the `existing instance` is used .
 A `class` is a `reference type` .
 When you assign a `reference type` to another `variable` ,
 we simply assign a `reference` .
 To understand what this means,
 a simple look at what happens underneath the hood might help .
 When we declare a `variable` or a `constant`
 and assign it some value ,
 we are actually storing this value in the computer's memory .
 The name of the `variable` simply points to this place in memory
 where the data lives .
 If this data is a `value type` say , a `struct` .
 Then when we copy the data over ,
 what we are actually doing , is ,
 making a copy of the data .
 Storing it in a space in memory
 and the new `variable` or `constant`
 points to this new data .
 In contrast,
 if the `data` is a `reference type`
 and we assign it to a new `variable` ,
 the new `variable` simply points to the same place in memory .
 This way,
 when we change a `property` of the first instance ,
 since the new instance is just pointing to the first one ,
 it changes as well :
 */

class Human {
    
    var fullName: String
    var email: String
    var age: Int
    
    
    init(fullName: String ,
         email: String ,
         age: Int) {
        
        self.fullName = fullName
        self.email = email
        self.age = age
    }
}


var glinda = Human(fullName : "Glinda of Oz" ,
                   email : "glinda@oz.com" ,
                   age : 33)

var emily = glinda


glinda.fullName // "Glinda of Oz"
emily.fullName // "Glinda of Oz"

emily.fullName = "Emily Bronte"

glinda.fullName // "Emily Bronte"
emily.fullName // "Emily Bronte"

/**
 _Which of these types should you use to build custom objects ?_
 `Value types`
 which for our current purposes mean `structs`
 should be used to represent <simple data or values> .
 `Value types` also have no notion of identity .
 Now , we haven't gone into what that means just yet .
 But when you model data out of a struct ,
 you should be able to easily answer the question :
 _Is this instance equal to this other one ?_
 
 `ASIDE` :
 As we write more code and learn more things ,
 it will start to be more clear
 where one type makes sense over the other .
 For example , later on ,
 we are going to learn
 how to build an app that retrieves the latest weather .
 To give this weather ,
 we are going to use the internet
 and make a `networking request`
 and we will have to make a decision
 about whether we should use
 a `struct` as our `network manager`
 or a `class` .
 In that case , the _question of identity_ makes more sense :  
  
 _What does it mean when we say , one network request is the same as the other ?_
 _Do the URLs have to be the same ? _
 _What about the type of networking request ? Is it a download or upload ?_
 
 There are lots of differentiating factors .
 Since identity or equality isn't easily determined ,
 maybe a `struct` won't really work so well .
 Anyway ,
 we are getting way ahead of ourselves .
 The goal of this video is
 to simply introduce you
 to the notion of a `value` vs a `reference type` .
 */


/**
 `APPENDIX` SWIFT DOCUMENTATION :
 https://developer.apple.com/swift/blog/?id=10
 
 `The Role of Mutation in Safety`
 One of the primary reasons to choose `value types` over `reference types` is
 the ability to more easily reason about your code .
 If you always get a unique , copied instance ,
 you can trust that no other part of your app is changing the data under the covers .
 This is especially helpful in multi-threaded environments
 where a different thread could alter your data out from under you .
 This can create nasty bugs that are extremely hard to debug .
 Because the difference is defined in terms of what happens when you change data ,
 there is one case where value and reference types overlap :
 when instances have no writable data .
 In the absence of mutation , values and references act exactly the same way .
 
 `How to Choose ?`
 So if you want to build a new type ,
 how do you decide which kind to make ?
 When you are working with `Cocoa` ,
 many `APIs` expect `subclasses` of `NSObject` ,
 so you have to use a `class` .
 For the other cases , here are some guidelines :
 
 Use a `value type` when :
 
 `•` Comparing `instance data` with `==` makes sense
 `•` You want copies to have `independent state`
 `•` The `data` will be used in code across `multiple threads`
 
 Use a `reference type` ( e.g. use a `class` ) when :
 
 `•` Comparing `instance identity` with `===` makes sense
 `•` You want to create <shared , mutable state>
 `•` In Swift , `Array` , `String` , and `Dictionary` are all `value types` .
 They behave much like a simple int value in C , acting as a <unique instance of that data> .
 You don’t need to do anything special — such as making an explicit copy —
 to prevent other code from modifying that data behind your back .
 Importantly , you can safely <pass copies of values across threads> without synchronization .
 In the spirit of improving safety , this model will help you write more predictable code in Swift .
 */
