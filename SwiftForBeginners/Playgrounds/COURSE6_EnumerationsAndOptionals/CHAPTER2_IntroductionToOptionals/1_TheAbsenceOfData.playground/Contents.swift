import Foundation

/**
 `INTRO CHAPTER 2`
 `INTRODUCTION TO OPTIONALS`
 Most languages don’t have a built in way to deal with the absence of data .
 This can lead to some dangerous consequences
 where we write buggy code that crashes often .
 To tackle this problem ,
 Swift introduces a language feature known as optionals .
 In this stage ,
 we will look at what optionals are
 and why we use it ,
 how to unwrap optional values
 and how to write safer code with fewer bugs .
 */

/**
 `1 The Absence of Data`
 INTRO — In many languages ,
 when you encounter the absence of data ,
 you have to deal with it by writing another path for your code .
 There is no indication that the data doesn’t exist
 so at many points in your program
 you have to write defensive code .
 This isn’t the situation in Swift , and in this video
 we take a look at optional types that help solve this problem .
 */
/**
 So far , every line of code we have written makes a pretty big assumption ,
 that the data we are working with actually exists .
 When we started learning Swift
 we talked about three considerations Apple made when creating the language . One of which was safety .
 Luckily Swift has a feature for situations when the data does not exist . It is known as optionals .
 Let’s model a Person struct with three stored properties :
 */
/*
struct Person {
    let firstName: String
    let middleName: String
    let lastName: String
}

let dorothy: Person = Person(firstName : "Dorothy" ,
                             middleName : nil , // ERROR
                             lastName : "Gale")
*/
/**
 We have got a compiler error
 because nil is not compatible with the expected argument type String .
 Nil is a value that represents nothingness .
 It is a value that represents the absence of a true value .
 */
/**
 By adding a question mark to the String type we have created an optional String  :
 */

struct Person {
    let firstName: String
    let middleName: String?
    let lastName: String
}

let dorothy: Person = Person(firstName : "Dorothy" ,
                             middleName : nil , // ERROR
                             lastName : "Gale")

/**
 An optional type indicates that
 there either is a value—and it is a String in this case—
 or there isn't a value at all .
 An optional isn't a distinct construct per se ,
 but it is a modifier on a type that allows that type to be nil .
 Why does this matter ?
 Because encountering an empty value
 when you are not expecting it in your programs
 is a huge pain .
 The compiler can warn you by having a neat way to indicate that this value could be empty .
 Getting the compiler to tell you about errors
 and things that you have missed
 is a great thing . It is better to get rid of the issues up front than crash when someone is using your app .
 So what is an optional really ?
 An optional is modelled as an enum :
 */

enum Optional<T> {
    case some(T)
    case none
}

/**
 <T> is a generic type
 meaning
 that when we create an optional ,
 the type that we add the question mark to is substituted for T .
 So when we create an optional String
 the type looks like this :
 */

enum Optional2 {
    case some(String)
    case none
}

/**
 An optional is an enum with two members :
 ( 1 ) `none` when there is no value and
 ( 2 ) a member name `some` that has an associated value .
 If the value exists , the compiler returns the associated value .
 All this is done under the hood for us , and we don't have to worry about it .
 `NOTE` : It is worth noting that you can make any type optional .
 It is not just Swift’s built in types .
 Any custom type we create can be made optional by adding the question mark .
 */
