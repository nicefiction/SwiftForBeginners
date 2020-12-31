import Foundation


/**
 `2 Argument Labels`
 INTRO —Swift aims to be an extremely readable language
 at the point of use . A large part of this goal is
 making our functions read like grammatical English phrases .
 In this video ,
 let's take a look at how correct argument labels enhance a functions readability .
 */
/**
 When we write a function , we give each parameter or argument a name .
 Naming these arguments using argument labels ,
 while it might seem like a trivial aspect of coding ,
 are an important part of writing good functions that express their intent clearly .
 Each argument label is actually composed of two parts ,
 ( 1 ) an external name
 and ( 2 ) a local name .
 */
func remove(havingValue: String) {
    
    print(havingValue)
}


remove(havingValue : "A")
/**
 We gave our function an argument
 and we gave this argument a label with a name of havingValue .
 By writing a single name ,
 we are saying that we want to use `havingValue`
 as both the external name
 and local name .
 
 In this case , ...
 */
func remove2(havingValue value: String) {
    
    print(value)
}


remove2(havingValue: "B")
/**
 ... for a single parameter,
 we have two labels ,
 `havingValue` and `value` .
 `havingValue` is the external name
 while `value` is the local name.
 This means that inside the body of the function ,
 we use the local name to refer to the value that we pass in as an argument .
 By giving it two names ,
 we are saying that inside the body of the function
 the only constant available
 is the local name , `value` .
 
 So now we have a way inside the body of the function
 to refer to the value that we pass in
 using a name that makes much more sense in the local context .
 _But what about the external name ?_
 We still want to abide by the rule of having
 a prepositional phrase as part of the argument label . And no worries ,
 by adding this external name,
 we now have an entirely different name to display when we call the function .
 So when you give an argument label both an external and a local name ,
 the external name is displayed when you call the function ,
 while the local name is used to refer to the value inside the function .
 
 `NOTE`: To not have an argument label outside ,
 we do the same thing as we did earlier ,
 in that we give it an external name and a local name .
 But for the external name , we simply specify an underscore .
 And by doing that , we are telling Swift , hey , we want this to have no external name ,
 but we do want it to have a local name of test :
 */
func someTest(_ test: Int) {
    
    print(test)
}


someTest(1)
/**
 So , now if you call `someTest(1)` ,
 you'll see that it does not have an argument label for this argument .
 I can simply pass in a value .
 */
