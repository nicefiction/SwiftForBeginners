import Foundation


/**
 `CHAPTER 2`
 `Creating Flexible Objects using Protocols .`
 INTRO CHAPTER 2 —Now that we have the basic syntax underway ,
 let's look at how we can use protocols
 to create some interesting object relationships .
 We'll also see how protocols are used widely
 in building the Swift language itself
 and how we can rework an object oriented example
 to be more protocol oriented .
 */
/**
 `1 Protocol Inheritance`
 INTRO — Like classes , protocols can inherit from other protocols .
 But where classes are limited to a single superclass ,
 protocols can inherit from many different protocols .
 This lets you create complex protocol requirements for use in your apps .
 */
/**
 Before we jump into an exploration of protocols in the swift language ,
 let's clear up some confusion ,
 as you just learned creating objects through `composition`
 that is _using different protocols to implement functionality_ .
 Composition offers us a certain level of flexibility that inheritance doesn’t ,
 but it can be hard to determine when we need composition vs inheritance ,
 a simple way to think about this, is ,
 to ask if the relationship between the objects is an `is a` or `has a` relationship ?
 
 Let's say we have a base class called `Airplane` that modelled an airplane .
 Now we want to model a `Jetplane` . Well ,
 a `Jetplane` `is a` type of `Airplane` .
 Since it is an `IS-A relationship` ,
 `Jetplane` inherits from the `Airplane` :
 
 `class Jetplane: Airplane {}`
 
 When we have an `IS-A type of relationship` ,
 `inheritance` is best suited as our design pattern .
 If a class wants to model the exact same behaviour and attributes of another class ,
 and perhaps add to it ,
 then we use inheritance .
 In the example a `Jetplane` ,
 a `Jetplane` will do everything an `Airplane` can ,
 plus some more cool stuff ,
 so we use inheritance .
 
 On the flip side ,
 if you only want to model a particular aspect ,
 a limited subset of this behaviour ,
 then we use `composition` .
 Let's say we're modelling a `Bird` .
 Well a `Bird` is not an `Airplane` ,
 but it has a feature that the `Airplane` does as well ,
 they can both fly .
 `Bird` has a `HAS-A a relationship` ,
 it makes sense to extract that common behaviour out ,
 and create a specific protocol for it .
 So , in this case ,
 we can create a `Fly` protocol
 that both the `Airplane` and `Bird` can conform to :
 */

protocol Fly {}

class Airplane: Fly {}
class Bird: Fly {}

/**
 There is another aspect of protocols that makes them more useful ,
 when it comes to constructing our object hierarchies ,
 and that is , protocols can inherit from other protocols .
 Let's take a look at some examples .
 In the iOS SDK , certain classes have a property called `description` ,
 calling `description` returns a String representation of the object .
 Let's create a protocol to do this :
 */

protocol PrintAble {
    
    func description() -> String
}

/*
struct Human: PrintAble {

    let name: String
    let address: String
    let age: Int
    
    func description()
    -> String {
        
        return "\(name) \(address) \(age)"
    }
}
 */

/**
 During my development process ,
 I'd like to inspect my objects at different points ,
 and I may printout these values of the properties to the console .
 By conforming to `Printable` and implementing a `description()` function ,
 it is far easier for me to get a representation of the object
 rather than individually writing out `print()` statements .
 So now , if we were to create an instance :
 */
 
 let dorothy = Human( name : "Dorothy" ,
                      address : "Oz" ,
                      age : 17 )
/**
 When I call the description( ) function on the instance ,
 */
 
 print(dorothy.description())

 /**
 ... you will see that I get a `String` back .
 Now this works
 but I also want a text representation that is formatted nicely ,
 and a lot more readable .
 We could modify the `description()` function in the `Human` struct .
 But I don't want to , because sometimes , I may not want this formatted description .
 The description String as we have it right now , could be useful on its own .
 So , let’s create another protocol :
 */

/*
protocol PrettyPrintAble: PrintAble {
    
    func prettyDescription() -> String
}
 */

/**
 Okay now , instead of having `Human` conform to `Printable` ,
 we’ll have it conform to `PrettyPrintable` .
 Inside the struct ,
 I need to provide an implementation for the `prettyDescription()` function :
 */

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
}
 */

/**
 `NOTE` :
 `return "name: \(name)\naddress: \(address)\nage: \(age)”`
 `\n` is a newline character . It makes the text print on a new line .
 I am not putting a space between `\n` and `address` ,
 because I want it to start immediately on the new line .
 
 When I call the `prettyDescription()` function on the instance , ...
 */

print(dorothy.prettyDescription())

/**
 ... you'll see that it looks much better .
 
 If you try to get rid of the `description()` function in the `Human` struct ,
 
 `//    func description()`
 `//    -> String {`
 `//`
 `//        return "\(name) \(address) \(age)"`
 `//    }`
 
 `// ERROR : Type 'Human' does not conform to protocol 'PrintAble' .`
 
 you will get an error .
 _Why is that happening ?_
 We are conforming only to `PrettyPrintAble` ?
 Well , when you inherit , using `protocol inheritance`
 anything that conforms to `PrettyPrintAble` ,
 must also satisfy the requirements of `PrintAble` first ,
 and then any additional requirements enforced by `PrettyPrintAble` :
 
 `protocol PrintAble {`
 
    `func description() -> String`
 `}`
 
 
 `protocol PrettyPrintAble: PrintAble {`
 
    `func prettyDescription() -> String`
 `}`
 
 So here we have a single protocol , `PrettyPrintAble` ,
 that inherits the requirements of the `PrintAble` protocol that is defined separately .
 The neat thing though , is ,
 that unlike classes ,
 protocols can inherit from many other protocols .
 If I wanted to define another protocol , like
 let's say , `NotSoPrettyPrintAble` :
 */

protocol NotSoPrettyPrintAble {
    
    func notSoPrettyDescription() -> String
}

/**
 Now , `PrettyPrintAble` can inherit from `PrintAble` and `NotSoPrettyPrintAble` .
 */

protocol PrettyPrintAble: PrintAble ,
                          NotSoPrettyPrintAble {
    
    func prettyDescription() -> String
}



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


print(dorothy.notSoPrettyDescription())

/**
 In this way ,
 we can build up protocols to create a larger set of requirements .
 Again , unlike classes
 which can only inherit from a single base class ,
 protocols can inherit from multiple protocols .
 This is a very useful feature of protocols ,
 and in fact , it is how the Swift language itself is organised .
 */
