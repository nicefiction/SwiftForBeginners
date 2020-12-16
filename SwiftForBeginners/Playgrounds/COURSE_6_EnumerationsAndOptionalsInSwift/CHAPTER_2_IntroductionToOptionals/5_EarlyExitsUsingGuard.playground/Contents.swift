import Foundation

/**
 `5 Early Exits Using Guard`
 INTRO —An early exit is a control flow concept where rather than checking for success cases first
 and worrying about errors last ,
 you deal with the error case up front
 and exit the current scope .
 Swift allows us to do this using a guard statement in combination with optional binding
 and it allows for some really elegant code .
 */
/**
 In the code that we just wrote
 we are exiting the function late .
 We first check for valid cases
 then do some logic
 and if none of that works
 we exit the function at the end by returning nil .
 Remember
 return
 is a control transfer statement
 and by calling it
 we exit the current scope .
 In contrast , an early exit is when we exit the function as early as possible .
 The moment we hit an undesirable path of code .
 And we can do that using the guard statement .
 With the if let statement , ...
 */

var optionalValue: String?

if
    let optionalValueUnwrapped = optionalValue {
    print(optionalValueUnwrapped)
}

/**
 ... we start with if ,
 then a temporary constant to assign the value to ,
 and then an expression .
 The expression has to be one that returns an optional value if this succeeds ,
 inside the if let statement
 we have access to that temporary constant containing the unwrapped value .
 In contrast ,
 we start a guard statement with a guard keyword ,
 */
/*
guard
    let optionalValueUnwrapped =  optionalValue
    else { return nil }

print(optionalValueUnwrapped)
*/
/**
 like if let , we then create a temporary constant to assign the value .
 And then we provide an expression to evaluate .
 This expression — like before — must return an optional value .
 If the expression succeeds
 — that is the optional contains a value and is not nil —
 it is assigned to the constant.
 So far everything is the same.
 Now here is where it starts to differ.
 With the guard statement , instead of opening the brace
 we write the else keyword , and then add a brace .
 To the inside of the body of the guard statement ,
 we add statements to indicate what we want to do if our expression fails .
 That is
 if it does contain nil.
 */
/**
 While in the if let ,
 the temporary constant was scoped to inside the body of the if let statement ,
 with guard it is the opposite .
 We can use this constant outside of the braces in our normal flow of code .
 The code in the braces is the alternate failure path
 or what would be the else clause in the if let statement . 
 */
/**
 Unlike the code inside the braces in the if statement ,
 with the guard statement you are required to transfer control .
 We have to exit the current scope once we enter the brace .
 Typically , this means that we exit the function early by returning nil .
 And this is why the guard statement is called an early exit construct .
 */

struct Friend {
    var name: String
    var age: String
    var address: String?
}


func newFriend(friendDictionary: [String : String])
-> Friend? {

    guard
        let _name = friendDictionary["name"] ,
        let _age = friendDictionary["age"]
    else { return nil }

    let address = friendDictionary["address"]

    return Friend(name : _name ,
                  age : _age ,
                  address : address)
}

/**
 We want name and age to not be nil but address can be nil .
 So , let's use the guard statement to check for both name and age .
 `NOTE` : We can do multiple checks in a single guard statement
 in the same way as the if let statement
 by using commas to separate each expression and assignment .
 */
/**
 If this fails
 then we add an else clause
 and open the body of the guard statement .
 If these two values don't exist
 then we can't create an instance of Friend so we return nil ,
 but if they do exist
 we can continue with our normal scope .
 Let's add our happy path .
 Let's get the address out of our friendDictionary as well :
 */
// let address = friendDictionary["address"]
/**
 We don't need to perform a check on this
 because the Friend initialiser accepts an optional value .
 We can return an instance of Friend
 because we can use these constants in the normal scope :
 */
// return Friend(name : _name , age : _age , address : address)
/**
 name and age are already unwrapped . And the address is an optional .
 Everything compiles ,
 and look how much cleaner that is than nested ( 3 ) if lets,
 or ( 2 ) separate checks ,
 or even worse ( 1 ) using the bang operator .
 */
/**
 As you can see with the guard statement
 the constants are unwrapped values .
 They can be used normally in the current scope of code .
 We don't have any nesting for a happy path .
 And this is awesome .
 Nested code makes it hard to deduce the flow of your code
 because you have to have all these branching pads for each check .
 */


/**
 `ASIDE` — The failable initialiser :
 I have created a method here , func newFriend( ) :
 */

func new(friendDictionary: [String : String]) -> Friend? {
    
    guard
        let _name = friendDictionary["name"] ,
        let _age = friendDictionary["age"]
    else { return nil }
    
    let address = friendDictionary["address"]
    
    return Friend(name : _name ,
                  age : _age ,
                  address : address)
}

/**
 The function func new( ) creates a new instance of Friend .
 The function returns an optional Friend
 if we can't get the value out of the friendDictionary dictionary that we are passing in .
 When I started this I said , well ,
 normally we use initializers to create a new instance
 but in this case
 we are resorting to using a function
 so that I can show you how to return an optional value . Well ,
 that is actually not true, we don’t need to use a function in this case . For example ,
 we have this thing , I'm only going to touch on this, we'll talk more in detail about this later .
 We have a concept called a failable initializer .
 So , this is how we would write a regular initializer , right ? :
 */

struct Friend2 {
    let name: String
    let age: Int
    var address: String?
    
    init(name: String ,
         age: Int ,
         address: String?) {
        self.name = name
        self.age  = age
        self.address = address
    }
}

/**
 And this is a perfect initialiser
 where we are getting the values that we need to pass in .
 But what if , again ,
 we want to accept a dictionary — friendDictionary — instead ?
 Let's say that we are getting a dictionary as the argument to initialiser ,
 and we need to use this to create an instance of Friend .
 Well , as we have seen , sometimes we might have to return nil :
 */

struct Friend3 {
    let name: String
    let age: String
    var address: String?
    
    init?(friendDictionary: [String : String]) {
        return nil
    }
}

/**
 By creating a failable initialiser ,
 we are saying that there is a chance that using this initialiser
 we may not actually get an instance back ,
 we may get nil back
 because we don't have all the values in this dictionary .
 But again , remember , we'll talk more about this later.
 */



/**
 `TASK`:
 In the editor, you have a struct named Book which has few stored properties,
 two of which are optional.
 Your task is to create a failable initializer
 that accepts a dictionary of type [String : String] as input
 and initializes all the stored properties.
 (Hint: A failable init method is one that can return nil and is written as init?).
 Use the following keys to retrieve values from the dictionary:
 "title", "author", "price", "pubDate"
 Note: Give your initializer argument the name dict
*/
 // Solution 1 , with an optional if let statement :

struct Book {
    let title: String
    let author: String
    var price: String?
    var pubDate: String?
    
    
    init?(dict: [String : String]) {
        guard
            let _title = dict["title"] ,
            let _author = dict["author"]
        else { return nil }

        self.title = _title
        self.author = _author
        self.price = dict["price"]
        self.pubDate = dict["pubDate"]
    }
}


struct Book2 {
    let title: String
    let author: String
    let price: String?
    let pubDate: String?
    
    
    init?(dict: [String : String]) {
        if
            let _title = dict["title"] ,
            let _author = dict["author"] {
            self.title = _title
            self.author = _author
            self.price = dict["price"]
            self.pubDate = dict["pubDate"]
        } else {
            return nil
        }
    }
}
