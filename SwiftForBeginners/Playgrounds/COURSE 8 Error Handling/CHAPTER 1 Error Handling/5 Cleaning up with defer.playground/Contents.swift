import Foundation

/**
 `5 Cleaning Up With Defer`
 INTRO —As we exit the current scope ,
 we may want to execute some code that "cleans up" behind us .
 Swift has a handy construct for this called
 the defer statement .
 */
/**
 Sometimes , regardless of the type of error that is raised ,
 we still need to execute some code or clean up after ourselves .
 A great example of this , is ,
 if we were working with some files on disk , that is , a file in local storage :
 */
/*
enum ReadError: Error {
    case invalidFile
    case unableToReadLine
}


func process(file name: String) throws {
    
    guard isValidFile(withName : name)
    else {
        throw ReadError.invalidFile
    }
    
    let file = open(fileName : name)
    
    guard
        let _line = try file.readLine()
    else {
        ReadError.unableToReadLine
    }
}
*/
/**
 Here we have a function
 `func process(file name: String) throws { ... }`
 that takes a path to a filename .
 Checks if the file exists :
 `guard isValidFile(withName : name)`
 Opens it :
 `let file = open(fileName : name)`
 And does some work with it :
 `guard let _line = try file.readLine()`
 The implementation details of the function aren't really important .
 What is important , is ,
 that regardless of what happens ,
 whether we successfully execute our code ,
 we need to close the file that we opened .
 The best time to close this file , is ,
 when we leave the scope of this function ,
 since that indicates that we have either successfully completed work ,
 or an error has been thrown .
 There are several points where we transfer control
 and exit our current scope in this function .
 So in this contrived example ,
 there are three points of exit .
 
 We have two throwing statements :
 ( 1 ) One of which doesn't matter because we haven't opened the file just yet :
 `throw ReadError.invalidFile`
 ( 2 ) We have one
 `ReadError.unableToReadLine`
 And when we are done with the body of the function .
 We have successfully completed our work
 and now we need to close this file .
 To make sure that regardless of the path we take to exit the current scope ,
 we always close the file .
 We can use a defer statement :
 */
/*
enum ReadError: Error {
    case invalidFile
    case unableToReadLine
}


func process(file name: String) throws {
    
    guard isValidFile(withName : name)
    else {
        throw ReadError.invalidFile
    }
    
    let file = open(fileName : name)
 
 
    defer {
        close(fileName : name)
    }
    
 
    guard
        let _line = try file.readLine()
    else {
        ReadError.unableToReadLine
    }
}
*/
/**
 A defer statement executes code within the statement ,
 when the program execution leaves the current scope .
 Here , we have added a single defer statement after the call to the open( ) function .
 Since defer statements are executed when the current scope is executed
 and not where it is written ,
 we can add a call to close( ) the file off within a deferred statement
 as soon as we open( ) it .
 This way we guarantee that we don't forget to close( ) off the file .
 
 `NOTE` : Despite being at the top of the function ,
 the file is actually closed at the bottom
 after all the code is executed and we exit the current scope .
 Or in the case of the second throw statement ,
 when we immediately hit that throw statement and exit the function ,
 we are going to close( ) the file as well .
 */
/**
 Now there are a couple things to know and remember about defer statements .
 `( A )` First , defer statements are not tied to error handling necessarily .
 You can use a defer statement anywhere you want to defer execution .
 But in most cases ,
 you will be using it along with your error handling statements .
 `( B )` You can also add multiple defer statements in a single function .
 `( C )` defer statements are executed in reverse order.
 Remember that ,
 reverse order :
 */
/*
process(file name: String) throws {
    guard isValidFile(withName : name)
    else {
        throw ReadError.invalidFile
    }
    
    let file = open(fileName : name)
        
    defer {
        close(fileName : name)
    }
    
    guard
        let line = try file.readLine()
    else {
        ReadError.unableToReadLine
    }
    
    defer {
        close(fileName : file2)
    }
    // close(fileName : name) is called here, at the end of scope.
}
*/
/**
 file2
 is closed before
 file1
 because defer statements are executed
 bottom to top
 of the current scope .
 */



/**
 And with that ,
 we have covered the basic syntax of error handling in Swift .
 Because properly learning error handling
 means seeing it in the context of apps you build
 and understanding where things can go wrong ,
 we won't be looking at a lot of small examples in this course .
 And instead , we'll talk more about it in detail and in context when we build actual apps .
 If you feel like you need more examples to understand error handling , don't worry .
 That will come in nearly every course moving forward .
 It is hard to look at error handling examples in isolation .
 Because first you have to build up a working example around it
 before you can focus on the errors .
 */
