import Foundation

/**
 `2 Working with Optional Types`
 INTRO —Now that we conceptually know what an optional is ,
 we look at why it even exists to begin with
 and the kinds of benefits we offer .
 We also take a look at the wrong way to work with optional values .
 */
/**
 Swift indicates that a box can be nil .
 And if the box is nil ,
 you can only open it with this safe opener . You could try to open it regularly ,
 but it won't open it .
 It forces you to use this safe option :
 */
/*
struct Person {
    let firstName: String
    let middleName: String?
    let lastName: String
    
    
    func fullName() {
        return firstName + " " + middleName + " " + lastName // ERROR
    }
}

let person = Person(firstName: "Dorothy",
                    middleName: nil,
                    lastName: "Oz")
*/
/**
 Swift won't let us do this ,
 and this is because middleName is an optional String and it may not contain a value .
 How do you add nil to this concatenated String ?
 We can't concatenate a String that could possibly not be a String .
 This highlights an important point .
 A String and an optional String are not the same type .
 The optional String can be nil , but a regular String cannot .
 To work with the value , we need to unwrap it .
 If you think of an optional as this special protection around a potentially nil value ,
 unwrapping means , peeling that layer of protection
 and using the value inside , if it exists .
 There are several ways we can unwrap an optional .
 And for all these different ways , control flow is our friend :
 */
struct Person {
    let firstName: String
    let middleName: String?
    let lastName: String
    
    func fullName()
    -> String {
        
        if middleName == nil {
            return firstName + " " + lastName
        } else {
            return firstName + " " + middleName! + " " + lastName
        }
    }
}

let dorothy: Person = Person(firstName : "Dorothy" ,
                             middleName : nil ,
                             lastName : "Gale")
print(dorothy.fullName())

/**
 Because middleName is still wrapped inside this optional box .
 We need to get that value out .
 The first way that you can unwrap a value is by using an exclamation point .
 But now that I have shown you this ,
 I want you to immediately erase it from your mind forever . Never ever , ever , ever do this !
 Using an exclamation mark like this is called force unwrapping . What this indicates is ,
 * I know that this is an optional ,
 and I know that this definitely has a value ,
 so go ahead and rip it out and use it . *
 This is bad code !
 `NOTE` : I know I can use String interpolation
 so that I don't have to concatenate a String with whitespace ,
 return firstName + " " + middleName! + " " + lastName
 but there is a reason for that .
 */
