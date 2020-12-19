import Foundation

/**
 `3 Optional Chaining`
 INTRO —We have looked at a few different ways
 of unwrapping optionals ,
 but what if we want to work with methods
 that successively return optional values .
 Unwrapping at each stage can get cumbersome
 and in this video we look at how we can chain optional queries elegantly in Swift .
 */

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
}


class Residence {
    var numberOfRooms: Int = 1
    var address: Address?
}


class Person {
    var residence: Residence?
}

/**
 `ASIDE` :
 If it hasn't hit you already
 you'll notice something quite different about these classes
 that violate a rule I made to learn earlier .
 When we learned about objects ,
 I said that classes required you to define an init( ) method , and that without an initializer
 you would get a compiler error when working with classes .
 When you have optional values though , things change .
 You'll notice that all the stored properties are either optional or they have a default value .
 When a stored property is an optional property ,
 it is initialised to nil automatically .
 This is only the case if the optional is a variable .
 It is pointless to create an optional stored property that is a constant
 without the intention of assigning it a value inside an init( ) method .
 For example ,
 if buildingName were to be a constant property ,
 and if I'm indicating that I want this to be nil all the time
 then why do I even have the property to begin with ? 
 So , if it is an optional property
 and it is a variable
 the compiler goes ahead and assigns it a default value of nil
 and then you can change it any time later .
 Because it has this nil value
 we don't need an initializer .
 Okay , while that is really important to know , that is not the point of this video .
 */

/*
 class Address {
     var buildingName: String?
     var buildingNumber: String?
     var street: String?
 }


 class Residence {
     var numberOfRooms: Int = 1
     var address: Address?
 }


 class Person {
     var residence: Residence?
 }
 */
/**
 A Person lives at a residence , but doesn't have to , so it is an optional property.
 A residence is located at an address, but because people like their privacy,
 not everyone needs to specify an address
 and even if they do specify an address , they may not give all the information .
 We may just get a street , or just a building number , or just a building name , or nothing at all even .
 This model is a very common case in a sign up flow
 where users may not give you the information that you asked for if you give them a choice .
 
 PASAN : I rarely ever enter my address unless they trust the service , which should be rarely .

 Since we may not get any of this information ,
 everything here is an optional property .
 So let's create an instance of Person :
 */

let dorothy = Person()

/**
 Note that , again , because this is an optional property ,
 I don't need to provide a value in the Person initialiser .
 Now let's assume that Dorothy is okay with giving us her address .
 Let’s create an instance of Address:
 */

let addressDorothy = Address()

/**
 At this point , everything is nil .
 Let’s assign some values to our addressDorothy constant :
 */

addressDorothy.buildingName = "SomeBuildingName"
addressDorothy.buildingNumber = "12"
addressDorothy.street = "SomeStreet 123"

/**
 Now that we have an address ,
 in the back end
 let's create an instance of Residence for Dorothy :
 */

let residenceDorothy = Residence()

residenceDorothy.address = addressDorothy

/**
 Finally now that we have a residenceSusan
 we can say :
 */

dorothy.residence = residenceDorothy

/**
 Dorothy's residence is this residenceDorothy instance .
 And now we have the information that we need .
 So let's say , at some point ,
 Dorothy wants to get something shipped out to her .
 We need to get her apartment number
 to put that on the shipping label .
 Since everything is an optional here
 to get to the final address ,
 we need to check every property .
 So let's go with an if let statement and a bunch of multiple checks :
 */

if
    let _residence = dorothy.residence ,
    let _address = _residence.address ,
    let _buildingNumber = _address.buildingNumber ,
    let _integerNumber = Int(_buildingNumber) {
    
    print(_integerNumber)
}

/**
 We are checking at every single level , from macro to micro :
 OLIVIER :
 Has Dorothy got a residence ?
 Has the residence got an address ?
 Has the address got a building number ?
 And then , finally , when we have the apartment number ,
 we convert it to an integer .
 Think of Int(number) as an initializer for Int .
 It takes some value—number .
 This is a failable initializer
 because we may not always be able to convert a String to an Integer , it could be the letter a .
 So in that case , if it succeeds ,
 we get an optional Int back ,
 which we are unwrapping — let integerNumber , if it doesn't we get nil .
 */
/**
 Now this isn't elegant by any means .
 We have to write many checks
 just to get a simple apartment number ,
 and this wouldn't be any different with a guard statement .
 So instead we can write this as . . .
 */

let appartmentNumber = dorothy.residence?.address?.buildingNumber

/**
 This is known as optional chaining .
 Optional chaining is a process for querying and calling
 properties ,
 methods ,
 and subscripts on an optional
 that might currently be nil .
 So , if the optional contains a value ,
 the property method or subscript call succeeds , but if it is nil ,
 the call returns nil .
 You can chain multiple queries , like we have done ,
 and the entire chain fails gracefully as in there is no error
 and the entire chain returns nil
 if any link in this chain is nil .
 */
/**
 You can think of an optional chain operation as a set of two parallel railroad tracks .
 One track ending with a String value
 and the other with a nil value .
 The track starts at the dorothy constant .
 We know that this isn't nil
 because we have set the value ,
 so we can move forward .
 If we hadn't set the value — in this was nil —
 our cart just takes the path directly to nil .
 But we proceed
 and come to the next call to the residenceDorothy property .
 Again we set the residenceDorothy property , and know it is not nil ,
 so we can proceed again .
 But again , if it was nil ,
 the cart would simply change tracks and go down to nil .
 In this way , we come to the next check , an address .
 If it succeeds,
 then finally to building number ,
 which also succeeds .
 This returns a String
 and the value is wrapped back up in an Optional . It is not unwrapped here ,
 and it is assigned to appartmentNumber .
 If you check the type of buildingNumber ...
 */
// let appartmentNumber = dorothy.residence?.address?.buildingNumber
/**
 ... you'll see it is an optional string ,
 so to use it ,
 we can unwrap it .
 The wonderful part of this however , is ,
 that we can combine optional chaining with optional binding to do all this
 in one
 if let ,
 or guard let
 statement :
 */

if
    let _appartmentNumber = dorothy.residence?.address?.buildingNumber ,
    let _integerNumber = Int(_appartmentNumber) {
    
    print("Appartment number : \(_integerNumber)")
}

/**
 The value returned from an optional chaining expression is also an optional ,
 simply because we can encounter nil at any point .
 But as you saw by using either guard let or if let
 we could easily unwrap it and use the value .
 */
/**
 Optional chaining is a really useful feature
 that allows us to chain methods or property calls ,
 without worrying about whether each of them exists or not at every level .
 It is sort of like using the bang operator and force unwrapping ,
 with the exception that this fails gracefully
 and doesn't cause crashes in the event that something is nil .
 */


/**
 `QUESTION on Treehouse` :
 Why is there no question mark after buildingNumber ?
 */
// let _appartmentNumber = dorothy.residence?.address?.buildingNumber
/**
 `ANSWER on Treehouse` :
 You are right that there is no question mark needed after buildingNumber ,
 because itis the last property in the chain .
 The question marks in optional chaining
 prevent
 the system
 from trying to access a property of nil .
 Let's say you have a variable called someNumber ,
 and you want to assign it to buildingNumber .
 You can do this :
 */
// let buildingNumber = someNumber
/**
 The above will always be valid
 even if someNumber is nil .
 That would just make buildingNumber also nil .
 
 But now let's say
 you have an optional variable called address ,
 and you want to access the buildingNumber property .
 This syntax would be problematic :
 */
// let buildingNumber = address.buildingNumber
/**
 The above will fail if address is nil ,
 because nil has no property buildingNumber .
 */


// OLIVIER : Adding the print statement below solves the bug in Playground .
print("hello world")
