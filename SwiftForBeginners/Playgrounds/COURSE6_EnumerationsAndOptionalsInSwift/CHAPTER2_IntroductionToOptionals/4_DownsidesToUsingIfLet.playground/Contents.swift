import Foundation

/**
 `4 Downsides to Using If Let`
 INTRO — While if let binding lets us unwrap our code safely ,
 it is not always the best choice
 and can lead to many levels of nesting in our code .
 This isn’t very intuitive so let’s spend some time looking at the issues .
 Let's take a look at a new example :
 */
struct Friend {
    let name: String
    let age: String
    let address: String?
}
/**
 let address is an optional String
 because we don't always have a friend's address
 when we create an instance of the Friend struct , e.g. in a contacts app .
 We also have a function that , given a dictionary of data , creates a new instance of Friend :
 */
// func new(friendDictionary: [String : String]) -> Friend? {}
/**
 `NOTE` : Let's just ignore the conventions here , typically to create a new instance ,
 we use an initialiser , but we'll use this for this example .
 */
/**
 When we retrieve data from the web ,
 it often comes in some sort of data format
 that is most easily converted to a dictionary .
 The data is packaged up as key value pairs
 and then we can retrieve values for each of our stored properties using the relevant key .
 Because dictionaries use optionals however ,
 we can't simply just get the value out because the key might not exist .
 This is a very common use case ,
 and once we move to getting data from the web ,
 you'll see that especially in this case ,
 you can't simply rely on the data being there .
 So to be sure , let's use optional binding :
 */
// SOLUTION 1 ☹️
func new(friendDictionary: [String : String])
-> Friend? {
    
    if
        let _name = friendDictionary["name"] ,
        let _age = friendDictionary["age"] ,
        let _address = friendDictionary["address"] {
        return Friend(name : _name ,
                      age : _age ,
                      address : _address)
    } else {
        return nil
    }
}
/**
 Using optional binding, we can get the name out of the dictionary and use it .
 In order to create an instance of Friend , we need to do the same for age and address .
 If all three checks work ,
 we have all three keys to get these values ,
 we unwrap it ,
 and we assign it to name, age, and address constants .
 We can then return an instance of Friend with these values .
 We'll pass in these constants as arguments.
 What happens if we don't have any of this data ?
 Well then we can't return an instance of Friend . So let's return an optional Friend .
 `ASSUMPTION` : The friendDictionary doesn't exist and I haven't created a value .
 But let's just assume that it does.
 */
/**
 There is still a fundamental problem with this though .
 In our Friend struct , it is okay that the friend doesn't have an address .
 We have marked that property as an optional to indicate this ,
 address is allowed to be nil .
 In the optional binding statement , we are conducting three checks ;
 name, age, and then address .
 Given the way an optional binding works ,
 every check here has to pass for us to create the instance of Friend .
 But that's wrong given our logic ,
 because if we get a value for name and age ,
 but don't get a value for address ,
 then we still can return a valid instance of Friend
 because we really don't need this . This is optional .
 So , let's change this up , our current example does not work .
 Let's get rid of all this code and start again . This time ,
 let's retrieve each property one at a time :
 */
// SOLUTION 2 ☹️
func new2(friendDictionary: [String : String])
-> Friend? {
    
    let name = friendDictionary["name"]
    if name == nil {
        return nil
    }
    
    let age = friendDictionary["age"]
    if age == nil {
        return nil
    }
    
    let address = friendDictionary["address"]
    
    return Friend(name : name! ,
                  age : age! ,
                  address : address)
}
/**
 We'll get the "name" and assign it to a constant let name .
 Then we'll check if the constant is valid .
 We absolutely need a "name" to create an instance , so at this point , we will return nil .
 Finally, we can get the "address" out .
 Now we have three properties
 because at this point in the code ,
 none of them are nil .
 Because if either name or age are nil ,
 we have already exited the function by returning nil .
 We can create an instance of Friend and return it .
 There is still one big problem though,
 all three values , name , age , and address , are optional Strings ,
 and the initializer for the Friend struct takes non-optional String values for name and age .
 Now , we could do another optional bind on all the values and create an instance of Friend .
 But we have the same problem again where address could be optional .
 So our only choice, sort of , is to force unwrap name and age
 since at this point, we know they are not optional .
 We know that they actually have a value,
 and they are not nil because we have made these checks .
 So, we'll return Friend ,
 and we'll force unwrap name , force unwrap age ,
 and simply return the address .
 */
/**
 Now this compiles fine,
 and you think , hey , it works .
 But really ,
 we want to get into the habit of never using force unwrapping ,
 or the bang operator as it is commonly known .
 So here we have the common issues with using an if let in a situation like this ,
 where part of the data needs to be optional ,
 but some of it can be optional .
 We can't use if let , because the unwrapped value that we retrieved is scoped to
 a temporary constant that exists only inside the if let statement .
 We do have a third option here , however ,
 where we can check for the first two values only using optional binding :
 */
// SOLUTION 3 : 😐
func new3(friendDictionary: [String : String])
-> Friend? {
    
    if
        let _name = friendDictionary["name"] ,
        let _age = friendDictionary["age"] {
        
        let address = friendDictionary["address"]
        
        return Friend(name : _name ,
                      age : _age ,
                      address : address)
    } else {
        return nil
    }
}
/**
 address here
 is not unwrapped ,
 it is an optional String .
 And that is okay ,
 because remember ,
 Friend can accept an optional String in its initializer .
 We can return Friend,
 and then an unwrapped name , an unwrapped age , and an optional address .
 If this doesn't work ,
 then we'll add an else statement and return nil .
 Again , this works ,
 and this is certainly a better solution than using force unwrapping ,
 but this may not always work .
 Here we have a simple object with three stored properties , only one of which is optional .
 Using this style , if we have many properties , then there are lots of nested checks .
 And we move back towards that pyramid style , which , again ,
 is something you shouldn't get into the habit of doing .
 So there we have it ,
 the problems with using if let syntax .
 This is how we had to do things in Swift 1 , and everyone complained .
 So in Swift 2 and beyond , and we are at Swift 4 now ,
 we got a new construct that modelled early exits .
 Let's check it out in the next video .
 */
/**
 `ADDENDUM OLIVIER` :
 Note how the function is not part of the Friend struct object .
 This means that the func new( ) function is unwrapping the values
 from the wizardsOfOz dictionary we got from the web .
 Hence the optional binding of all the key values in the func new( ) function :
 */
func new4(friendDictionary: [String : String])
-> Friend? {
    
    if
        let _name = friendDictionary["name"] ,
        let _age = friendDictionary["age"] {
        
        let address = friendDictionary["address"]
        
        return Friend(name : _name ,
                      age : _age ,
                      address : address ?? "N/A")
    } else {
        return nil
    }
}

let wizardsOfOz: [String : String] = [
    "name" : "Dorothy" ,
    "age" : "17" ,
    "address" : "Oz"
]

let dorothy = new4(friendDictionary : wizardsOfOz)
dorothy?.name // returns "Dorothy"
dorothy?.age // returns "17"
dorothy?.address // returns "Oz"
/**
 This code example displays the scenario where all data from the web
 — "name" , "age" , and "address" —
 are present in the dictionary .
 What happens if address is absent from the dictionary ? :
 */

let wizardsOfOz2: [String : String] = [
    "name" : "Dorothy" ,
    "age" : "17" ,
//    "address" : "Oz"
]

let dorothy2 = new4(friendDictionary : wizardsOfOz2) // returns Friend
dorothy2?.name // returns "Dorothy"
dorothy2?.age // returns "17"
dorothy2?.address // returns "N/A"
/**
 What happens if age is absent from the dictionary ? :
 */
let wizardsOfOz3: [String : String] = [
    "name" : "Dorothy" ,
//    "age" : "17" ,
    "address" : "Oz"
]

let dorothy3 = new4(friendDictionary : wizardsOfOz3) // returns Friend
dorothy3?.name // returns nil
dorothy3?.age // returns nil
dorothy3?.address // returns nil
/**
 This illustrates that
 in order to create a Friend
 it is okay not to have the address from the dictionary .
 This is indicated in the Friend struct , address is an optional .
 Hence the unwrapping of name and age ,
 but not address
 In the func new( ) function .
 */
