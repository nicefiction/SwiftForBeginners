import Foundation


/**
 `5 Function Scope`
 INTRO —Code added inside a function is
 limited
 to the body
 of the function
 and doesn't exist outside of it .
 This concept is called
 scope
 and in this video
 we take a look at
 what scope means .
 */
func arrayModifier(array: [Int]) {
    
    var arrayOfInts = array
    arrayOfInts.append(5)
    
    let secondArrayOfInts = arrayOfInts
}


var arrayOfInts: [Int] = [
    1 , 2 , 3 , 4
]

arrayModifier(array : arrayOfInts)
arrayOfInts
// secondArrayOfInts // ERROR : OLIVIER >> The secondArrayOfInts does not exist outside the scope of the function .
/**
 So , the first thing you should know is that
 when you pass something into a function via a parameter ,
 `arrayModifier(array : arrayOfInts)`
 you don't pass in this exact same value .
 `var arrayOfInts: [Int] = [ 1 , 2 , 3 , 4 ]`
 Instead ,
 Swift makes a copy of that by default
 and assigns it
 to a new constant . So ,
 this constant array
 `func arrayModifier(array: [Int]) { ... }`
 doesn't contain the `arrayOfInts` exactly,
 `var arrayOfInts: [Int] = [ 1 , 2 , 3 , 4 ]`
 Now , inside the body of the function ,
 we can't change the array passed in , well ,
 because this array , the parameter ,
 is a constant .
 `func arrayModifier(array: [Int]) { ... }`
 So , for our next step ,
 `var arrayOfInts = array`
 we created a new variable , `arrayOfInts` .
 With the same name as the one outside ,
 `var arrayOfInts: [Int] = [ 1 , 2 , 3 , 4 ]`
 Here we successfully modified the Array ,
 `arrayOfInts.append(5)`
 because `arrayOfInts` is a variable .
 `var arrayOfInts = array`
 But it doesn't affect the one outside [the function] ,
 `var arrayOfInts: [Int] = [ 1 , 2 , 3 , 4 ]`
 And we know now why ,
 because we are using a copy of the values of the array
 outside the function ,
 not that array itself .
 `NOTE` : We'll talk more about when and why this happens in a future lesson .
 Finally ,
 we assign the modified array to a new variable `secondArrayOfInts` :
 `let secondArrayOfInts = arrayOfInts`
 When you want to check what the final value of `secondArrayOfInts` is
 outside of the function ,
 you'll see that there is no `secondArrayOfInts`
 because Xcode auto complete doesn't show . Well ,
 the reason for this is
 that `secondArrayOfInts` doesn't actually exist outside of the function .
 This is because anything created within a function ,
 exists only inside the function .
 And this is what is generally referred to as scope .
 And in this case ,
 a variable created within the body of the function
 only exists inside .
 `NOTE`: Now , there are some exceptions to these rules . But again , topic for the future .
 
 `NOTE` : This concept of scope is also why we are able to create two variables of the same name ,
 one inside the function ,
 `func arrayModifier(array: [Int]) {`
     
     var arrayOfInts = array
     arrayOfInts.append(5)
     
     let secondArrayOfInts = arrayOfInts
 `}`
 and another outside the function ,
`var arrayOfInts: [Int] = [`
    `1 , 2 , 3 , 4`
`]`
 Within the same scope ,
 names have to be unique .
 But in different scopes ,
 you can have things with the same name .
 
 Now , we have been talking about variables and constants for a while .
 But we haven't differentiated between those created inside a function versus outside .
 Any variable or constant that is created inside a function
 and assigned a value
 is called a `local variable` .
 Outside of function ,
 we call them `global variables` , because they are available globally .
 
 `GOOD PRACTICE` : In general though,
 because a function is a block of code that we want to treat as a stand alone unit ,
 it is preferable that we avoid the use of global variables and constants as much as we can .
 If we need any values from outside of the global scope ,
 inside of the function to help facilitate any logic ,
 then it is better to pass those values in as arguments to the function .
 This way , we know exactly where the data is coming from .
 So , just keep that in mind .
 `Local variables` treated inside the body of a function exist only inside that function .
 `Global variables` , on the other hand , are available everywhere .
 */
/**
 `Angela Yu` :
 Scope is about the visibility of variables.
 If you create a variable within the curly braces of a function ,
 then that variable is called a `local variable` .
 Local variables are only visible within the function.
 But if I created this variable just below the class declaration
 where it is outside of any of the curly braces of the functions
 and it is essentially the same hierarchical level as any of these other functions
 then the variable is visible to everybody within the class .
 That variable is declared as a `global variable` .
 It is accessible to anyone in the class .
 The problem however is ,
 that this is not an optimal way of using variables .
 Try to avoid global variables .
 Use either local variables ,
 or inputs through functions .
 
 To summarize
 essentially
 keep your apple tree within your own garden
 and if you can
 try to avoid having these global variables
 where anybody can tap into creating confusion
 creating chaos
 and therefore error .
 When you are programming a large project with thousand lines of code
 your global variables
 can stack up pretty quickly
 becoming very confusing .
 Also having this global variable
 which can be changed any way in the code file
 when there is an error
 it will take hours and hours of digging around
 to try and find where it was changed inappropriately
 or what happened to it .
 */
