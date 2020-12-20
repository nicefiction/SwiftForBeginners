import Foundation


/**
 `2 Initialising With Raw Values`
 INTRO —With raw values ,
 since an enum contains a default value before creation ,
 we can use this in an initialiser method
 to return an enum case
 given an arbitrary value of the same type .
 That sounds vague , so let’s just check it out in code !
 */


/**
 We have learned about initialisation before ,
 the way in which we create an object . Like structs and classes ,
 we can initialise an enum ,
 but only if it has a raw value . 
  
 I am going to stick to my HTTP example here ,
 because it is a useful one that we will actually use in practice in future courses .
 Typically when you make a request on the web , let's say by entering an address ,
 the server first returns a response .
 These responses have various status codes
 that tell your browser what the state of the response was .
 Since there is a limited set of status codes ,
 enums provide a great way to model this data .
 For this example , we will model a very limited subset
 so we can see the utility of initialising with a raw value :

 `NOTE` : Don't worry about the underlying jargon here .
 We will learn all this when the time comes
 and make apps that connect to the web .
 */

enum HTTPStatusCode: Int {
    case success = 200
    case forbidden = 301
    case unauthorized = 401
    case notFound = 404
}

/**
 I imagine that we conduct a web request from our app and we want to know whether it succeeded or not .
 One way to do this is to check the status code from the response returned .
 For the sake of ease for this example ,
 let's create a status code constant that holds this value :
 */

let statusCode = 200

/**
 `NOTE` : In a real case scenario I have no idea what that value is
 because our app is making those network requests based on what the user does .
 And we have no control over what a user does .

 So now , I want to convert the status code into an enum member ,
 because just like we discussed earlier ,
 having a type associated with our data ,
 rather than just some free value , like a String or an Int , means
 that the compiler can do a lot of error checking for us .
 Enums with raw values have an initializer method
 and we can use this to produce the right enum member instance :
 */

// let httpStatusCode = HTTPStatusCode(rawValue : statusCode)

/**
 What we are doing here is providing the raw value ,
 which has to match the type of the raw value specified in these enum cases .
 If the argument does match the raw value of one of these cases ,
 we get that enum case back .
 And as you can see from the results area ,
 we have got a success case back .
 If you hold OPTION on your keyboard and click on the httpStatusCode constant
 you'll notice that httpStatusCode constant is an optional type . Wait , what ?
 We didn't specify this as an optional , did we ?
 Now , this is why I went on a detour to talk about optionals before coming back to this . 
 The initialiser for enums with raw values is that failable initializer that we talked about .
 It is an initializer that always returns an optional value of the type .
 If you think about it for a second , this makes sense .
 The only restriction of the rawValue parameter
 — from HTTPStatusCode(rawValue: statusCode) —
 is the type — Int — that we specify in the HTTPStatusCode enum .
 So in this case ,
 you see that it can accept any integer value . And , obviously , that is quite a large range .
 If the integer value doesn't match any of our cases here ,
 which from that ginormous set , we have only picked four integer values .
 So , there is a high chance of failure .
 But in that case , we have no choice but to return nil .
 Now , again , we will cover failable initializers properly in a future course .
 But for now , it is important to know that
 since this is an optional value
 that is returned ,
 to actually use an enum member
 that we generate using a raw value ,
 we need to use either an if let or guard statement :
 */

if
    let httpStatusCode = HTTPStatusCode(rawValue : statusCode) {
    
    print(httpStatusCode)
}
