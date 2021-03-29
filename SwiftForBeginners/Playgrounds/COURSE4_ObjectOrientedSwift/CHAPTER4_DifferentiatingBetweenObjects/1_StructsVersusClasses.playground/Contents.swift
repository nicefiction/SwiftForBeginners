import Foundation

/**
 `CHAPTER 3`
 `Differentiating Between Objects`
 INTRO CHAPTER 1 —We touched on
 a major way
 that `structs` and `classes` differ
 — `inheritance` .
 But there are other more subtle ways
 we can distinguish between the two
 and in this stage
 we take a look at
 how
 and why it matters .
 */



/**
 `1 Structs vs Classes`
 INTRO —We have learned about
 two main kinds of objects — `structs` and `classes`
 and how one difference between the two is `inheritance` .
 That is not the only difference though
 and in this video
 we look at some trickery
 that goes on under the hood .
 */
/**
 As we have seen
 both `structs` and `classes`
 give us the ability to create `custom data types`
 that contain `stored properties` and `instance methods` .
 _So how do we know which one to use and when ?_
 We saw one fundamental difference between the two .
 `Classes` implement `inheritance` and allow us to subclass objects .
 While this is a powerful concept ,
 there is another underlying difference
 that draws a much more distinct line in the sand .
 */

struct User {
    
    var fullName: String
    var email: String
    var age: Int
}


let dorothy = User(fullName : "Dorothy Gale" ,
                   email : "dorothy@oz.com" ,
                   age : 17)

var ozma = dorothy

dorothy.fullName // "Dorothy Gale"
ozma.fullName // "Dorothy Gale"

ozma.fullName = "Ozma"

dorothy.fullName // "Dorothy Gale"
ozma.fullName // "Ozma"

/**
 You will see `dorothy.fullName` is the same as the original , `"Dorothy Gale"`.
 Okay , keep this in mind .
 */

class Human {
    
    var fullName: String
    var email: String
    var age: Int
    
    
    init(fullName: String ,
         email: String ,
         age: Int) {
        
        self.fullName = fullName
        self.email    = email
        self.age      = age
    }
}


var glinda = Human(fullName : "Glinda of Oz" ,
                   email : "glinda@oz.com" ,
                   age : 33)

var emily = glinda


glinda.fullName // "Glinda of Oz"
emily.fullName // "Glinda of Oz"

emily.fullName = "Emily Bronte"

/**
 What do you think the value of `fullname` on the `glinda instance` is ?
 */

glinda.fullName // "Emily Bronte"
emily.fullName // "Emily Bronte"

/**
 Look at that.
 In case of the `struct`
 we had the same as the original ,
 
 `dorothy.fullName // "Dorothy Gale"`
 
 but now with the `class`
 it prints out the new value for `glinda` for that second instance .
 
 `glinda.fullName // "Emily Bronte"`
 
 _What is going on ?_
 Let's find out in the next video .
 */
