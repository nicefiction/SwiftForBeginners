import Foundation


/**
 `CHAPTER 2`
 `Classes in Swift`
 INTRO CHAPTER 2 —Now that we have a `Point struct`
 to represent a coordinate point
 we can focus on the rest of the game .
 The next object we are going to use is called a `class`.
 Much like a `struct` ,
 a `class` lets us model a `custom data type` ,
 with some subtle differences .
 In the next set of videos
 we look at
 how to create a class
 and get some more practice
 in working with objects .
 */
/**
 `1 Introduction to Classes`
 INTRO —In this first video we get some practice creating a `class` .
 Unlike structs , classes do not get automatic `memberwise initializer`
 and we need to write our own .
 */

struct Point {
    
    let x: Int
    let y: Int
    
    
    func points(inRange range: Int = 1)
    -> [Point] {
        
        var result = Array<Point>()
        let lowerBoundOfXRange = x - range
        let upperBoundOfXRange = x + range
        let lowerBoundOfYRange = y - range
        let upperBoundOfYRange = y + range
        
        for xCoordinate
        in lowerBoundOfXRange...upperBoundOfXRange {
            
            for yCoordinate
            in lowerBoundOfYRange...upperBoundOfYRange {
                
                let point = Point(x : xCoordinate ,
                                  y : yCoordinate)
                
                result.append(point)
            }
        }
        
        
        return result
    }
}

/**
 We got the `Point struct` implemented
 and that is a great start .
 Because now that we can model a position on the map ,
 we can use it to place towers and enemies .
 Just like we used an `object`
 — more specifically a `struct`—
 to model the coordinate point,
 we will model an enemy next .
 But this time ,
 we are going to use a different type of object
 called a `class` .
 Much of the basics that we learned in the last video
 are the same between structs and classes :
 */

class Enemy {
    
    var life: Int = 2
    let position: Point
    
    
    init(x: Int ,
         y: Int) {
        
        self.position = Point(x : x , y : y)
    }
    
    
    func decreaseHealth(by factor: Int) {
        
        life -= factor
    }
}

/**
 We set the `life` `property` as a `variable property`
 rather than a `constant`
 because when a tower fires at a particular enemy ,
 we want the enemy's life property to decrease by a certain value .
 When using an `initializer method` to create an instance of an object .
 We need to give all `stored properties` initial values
 before we are finished .
 Rather than doing that in the `init() method` however ,
 I am going to assign a value to `life` directly :
 
 `var life: Int = 2`
 
 Now ,
 every instance of the `Enemy class`
 will have the `life property` set to `2` .
 It is a default value for the object . I did this
 because I do want all instances of enemy to have a fixed initial life .
 
 `TIP`:
 Basically , the guiding factor is this ,
 if the initial value of your object can sensibly be defined
 before creation of the object ,
 then go ahead and assign that value directly .
 Otherwise , use an initialiser method
 to delay the assigning of values ,
 until you have more data that you can provide .
 
 `NOTE`:
 `Stored properties` can either be `constants` or `variables`.
 And this determines
 how those properties behave
 after an instance has been created .
 When we have a value that we can only get the value from ,
 like a `constant` ,
 we say that it is `read only` , or it is a `gettable property` .
 If we can also change the value at any time ,
 like a `variable` ,
 we say that it is `read write` or a `settable property` .
 
 We will need to figure out
 where the enemy is on the map ,
 so we give it a `position property` :
 
 `let position: Point`
 
 Like the built in types we have available in swift ,
 like `String` and `Int` ,
 we can use any custom type we define :
 
 `struct Point { ... }`

 So the type of `position` here is `Point` .
 `position` is a `constant property` ,
 which means that after it is _set_ ,
 we are not going to change it .
 Now , in a properly implemented game ,
 that wouldn't be the case , of course ,
 but we'll make some simplifications here .
 And this means that
 when we create an instance of `Enemy` ,
 we have to assign an instance of `Point`
 to the `position property` .
 This should give you some hints as to the power of `Object Oriented Programming` :
 We started off by building a `custom data type`
 — `Point` — to model a point on our map .
 Now , we are using that `data type` as a building block
 for an even more complex one .
 So , much like we use a `String` , for example ,
 to build up an address or a number .
 
 `NOTE` :
 We don't assign default `x` and `y` coordinates
 for the `position values` right now ,
 because if we did ,
 _what will I choose ?_
 _Should I put 0 , 0 for every enemy ?_
 Then all the enemies and all the towers would be on the same spot .
 Instead , we can decide at the time of creation
 where we want to place them .
 
 Okay ,
 so let's take a look at the first difference between `structs` and `classes` .
 When we used a `struct` ,
 Swift automatically created a `member wise initialiser` for us,
 so that we can create new instances .
 But with `classes` ,
 we don't get any such automatic or magic behaviour .
 We always need to write the `init()` methods ourselves :

 `init(x: Int ,`
      `y: Int) {`
 
    `self.position = Point(x : x , y : y)`
 `}`
 
 We need to set initial values for two properties ,
 `position` and `life` .
 For `position` ,
 we need to create an `instance of Point` ,
 and we can do it in one of two ways :
 (`1`) We can be direct and require
 that a `Point instance` be passed into this `init() method `
 as an argument directly .
 So we'll give it an `argument label` :
 
 `init(position: Point) {`
 
    `self.position = position`
 `}`
 
 Now , this type of `initialiser method` works,
 but it puts the burden on creating an instance of `Point` first
 and then passing it into the `initialiser`.
 Now , there are certain advantages to doing it this way ,
 but none that concern us right now .
 So what we can do is
 we will abstract it ...
 ... (`2`) We'll make it easier
 by simply specifying `x` and `y` coordinates as parameters :
 
 `init(x: Int ,`
      `y: Int) {`
 
    `self.position = Point(x : x , y : y)`
 `}`
 
 Now , this
 
 `init(x: Int , y: Int)`
 
 is exactly like the initializer for the `Point struct` :
 
 `Point(x : x , y : y)`
 
 So what we are going to do , is ,
 assign an `instance of Point`
 inside the `init() method` .
 Rather than assigning a `position`
 that we pass in as an `argument` .
 We'll go ahead and create an `instance`
 inside the `init() method` .
 We'll use the struct’s initializer methods .
 And for the arguments ,
 we'll pass through the arguments from the initialiser method :
 
 `self.position = Point(x : x , y : y)`
 
 Okay ,
 so we have an `instance of Point` now assigned to `position` .
 And the cool part is
 that we don't have to decide now
 what that point will be .
 Whenever we create an `instance of Enemy` ,
 we can pass in whatever values we need to create that point .
 */
