import Foundation



/**
 `5 Nil Coalescing Operator`
 INTRO —In most cases ,
 custom operators just add to the syntax overhead of the language
 but a useful one in Swift , is ,
 the nil coalescing operator .
 This operator makes it much easier to provide default values
 in case an optional value is nil .
 */
/**
 Here we have the nil coalescing operator :
 a ?? b
 Given an optional value
 a ,
 if
 a
 contains a value ,
 then we unwrap it
 and use it.
 Otherwise
 use b .
 When using this kind of operator ,
 ( 1 ) the expression
 a
 must always be an optional .
 ( 2 ) the type of
 b
 should always match the type of the unwrapped
 a .
 So , let's look at this in code .
 If the user has provided a first name ,
 then we'd like to show that first name ,
 otherwise we will greet them by their username :
 */

// var firstName: String? = "Dorothy"
var firstName: String?
let username: String = "dorothyGale"
var displayname: String

if let _firstName = firstName {
    displayname = _firstName
} else {
    displayname = username
}

/**
 Because entering your firstName in this app is not required ,
 the model is going to store this as an optional String .
 The userName is a required field .
 The name the user sees in our app is stored in a variable called displayName .
 `NOTE` : Notice here that in doing this kind of logic , we have to use a variable , displayName .
 We don't assign displayName an initial value ,
 and then do some logic .
 `NOTE` : The downside of this approach , is ,
 that displayName is a variable ,
 and remember , we want to try and use constants .
 
 And now we can just use displayName everywhere we want to print out the users displayName .
 */
/**
 This kind of logic ,
 where we are checking if something is nil ,
 then using that value ,
 otherwise using another value ,
 is a common approach .
 And in fact , there is a dedicated operator for it known as the `ternary conditional operator` .
 The ternary conditional operator has three parts :
 `question ? answer1 : answer2`
 This is essentially a short cut for evaluating one of two expressions based on whether the question you are asking ,
 the expression you are evaluating ,
 is true
 or false :
 If it is true
 it then uses answer1 ,
 it evaluates answer1 and returns its value . Otherwise , it evaluates answer2 .
 Now , what is that question though ?
 It is any logical expression
 that returns a Boolean value .
 So, we can convert our expression to this format :
 */

let displayName = firstName != nil ? firstName! : username

/**
 This
 `firstName != nil`
 is our question to be evaluated .
 If firstName is not equal to nil ,
 then we are going to use firstName unwrapped . `firstName!` is our answer1 .
 But if firstName is equal to nil ,
 then we are going to use userName . `userName` is our answer2 .
 Because we are using the ternary conditional operator ,
 we get the benefit that displayName is now a constant and cannot be mutated .
 This is cool because we can write that logic out in one line of code
 but here `firstName!`
 we have to use the bang operator . And remember , we don't want to do that . So , luckily
 like we talked about at the start of this video ,
 Swift has another convenient operator
 called the `nil coalescing operator` :
 */
let displayName2 = firstName ?? username

print("Hello \(displayName2) .")
/**
 What this does , is ,
 provide syntactic sugar for exactly what we just did a second ago .
 The nil coalescing operator is used on optionals .
 On the left side of the operator
 it takes an optional value to consider — firstName .
 If the value of firstName is not nil ,
 it unwraps it
 and returns the unwrapped value for use .
 Otherwise , it uses the value of userName .
 So , here ,
 the value that you provide on the right hand side — userName —
 must match the unwrapped type of the value you provide on the left hand side .
 firstName is an optional String ,
 the unwrapped type is String .
 So, the type of userName needs to be a String .
 The ternary condition operator that we used
 is simply syntactic sugar for an if else clause .
 And then the nil coalescing operator is even more sugar
 for using the ternary conditional operator with an optional value .
 Now , these are all different ways of expressing the same kind of logic .
 So , when do you use either one of these ?
 Always start with an if statement . It is a lot more readable .
 */



/* QUIZ :
 * Q : When an enum member has an associated value ,
 * how do you access it ?
 * A : By binding it to a local constant .
 */
// OLIVIER :
// ??? ,
enum Weather {
    case sunny(temperature: Int)
    case cloudy
}

let number: Int = 5
Weather.sunny(temperature : number)

print("The weather is sunny with a temperature of \(Weather.sunny(temperature : number)) .")
print("The weather is sunny with a temperature of \(number) degrees Celsius .")
