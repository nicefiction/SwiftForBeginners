import Foundation

/**
 `4 Instance Methods`
 INTRO —The methods we added in the last video
 were specifically
 `instance methods` .
 Let's take a look at
 how we `call instance methods` .
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


let coordinatePoint = Point(x : 0 , y : 0)

/**
 In `Object Oriented Programming` , a `method`
 is any `function` that is associated with a particular `type` .
 Because the `function` we wrote in the last video ...
 
 `struct Point {`
 
    `...`
 
    `func points(inRange range: Int = 1)`
    `-> [Point] { ... }`
 
 `}`
 
 ... is associated with the `Point struct` ,
 we call this a `method` rather than a `function` .
 While it might seem silly
 that we assign things different names like this ,
 it makes it immediately clear
 what the context is
 when I use the right term .
 If I say that a particular `method` is returning an _error_ ,
 it is obvious to another iOS developer
 that I am talking about a `function` associated with an `object` ,
 and not just any `function` .
 
 `NOTE` : We have actually been using `methods` for a while now .
 But I have called them `functions`
 so as not to confuse you .
 When we learned about `arrays` ,
 we used the `append()` `function` .
 This is actually a `method` ,
 because it is associated with a particular type , the `Array` type .
 So remember that a `method` is a `function`
 that is associated with a particular `type` .
 I hope that is clear,
 because there are different types of methods as well
 🙃
 The method we just wrote ...
 
 `func points(inRange range: Int = 1)`
 `-> [Point] { ... }`
 
 ... is called an `instance method` .
 Remember ,
 an `instance` is a specific `object` .
 We use the `Point struct` as a blueprint
 to create an instance of `Point` , with specific values :
 
 `let coordinatePoint = Point(x : 0 , y : 0)`
 
 We call `func points(inRange:)` an `instance method`
 because it can only be called
 once we have an `instance` — `coordinatePoint` :
 
 `coordinatePoint.points(inRange : 1)`
 
 We _call methods on objects_ using the `dot notation` .
 Now here ,
 */

// Point.points(inRange : 1)
// ERROR : Instance member 'points' cannot be used on type 'Point' ; did you mean to use a value of this type instead ?

/**
 I am trying to call the `points()` method
 directly on the `Point struct` ,
 but we get an error .
 _Why is that ?_
 Well , because the `points()` `method`
 is an `instance method`.
 It can only be called on an `instance`.
 Since we have created this `coordinatePoint instance` before ...
 
 `let coordinatePoint = Point(x : 0 , y : 0)`
 
 ... let's use that instead .
 So , I’ll type out _coordinatepoint_ ,
 and then once I put the _dot_ there
 to `call the method` ...
 ... you’ll see
 that the Xcode autocomplete
 gives us two possible values .
 Since we have given the `range` `parameter` a `default value` ,
 
 `func points(inRange range: Int = 1)`
 `-> [Point] { ... }`
 
 we don't have to pass in a `value`...
 */

coordinatePoint.points()

/**
 ... and we can simply call the function with `default arguments`.
 Or we can actually pass in a range :
 */

coordinatePoint.points(inRange : 2)

/**
 Let's use the default for now :
 
 `coordinatePoint.points()`
  
 Now this works perfectly and
 you'll see in the results area that we have an array of point instances :
 */

let coordinatePoints = coordinatePoint.points()


for point in coordinatePoints {
    
    print("x : \(point.x) , y : \(point.y)")
}

/* prints
    x : -1 , y : -1
    x : -1 , y : 0
    x : -1 , y : 1
    x : 0 , y : -1
    x : 0 , y : 0
    x : 0 , y : 1
    x : 1 , y : -1
    x : 1 , y : 0
    x : 1 , y : 1
 */

/**
 Now this works perfectly
 and you will see in the results area
 that we have an array of point instances .
 Since the values for `x` and `y` are `0` , `0`
 
 `let coordinatePoint = Point(x : 0 , y : 0)`
 
 and our `points()` method calculates
 all possible points in a 360 degree angle around it ,
 given a range of `1` ,
 
 `func points(inRange range: Int = 1)`
 `-> [Point] { ... }`
 
 some of these points are negative .
 
    `x : -1 , y : -1`
    `x : -1 , y : 0`
    `x : -1 , y : 1`
    `x : 0 , y : -1`
    `x : 0 , y : 0`
    `x : 0 , y : 1`
    `x : 1 , y : -1`
    `x : 1 , y : 0`
    `x : 1 , y : 1`
 
 Pretty awesome though , right ?
    Now remember earlier ,
 I said that Swift was doing some _compiler magic_
 when you created an instance , right here ...
 
 `let coordinatePoint = Point(x : 0 , y : 0)`

 ... to assign these `values` to `stored properties` .
 And here is a reminder in case you forgot .
 Let's create another coordinate point :
 */

let anotherCoordinatePoint = Point(x : 1 , y : 2)

/**
 To create an instance,
 we type out the name of the type
 — `Point` —
 and then an opening parentheses to get this special function .
 When I started the open parentheses
 we get this method with parameters for the stored properties in our class .
 So how does Xcode , or Swift , know how to do this ?
 This is because Swift is automatically creating a special method
 called an initializer method under the hood .
 _What is an initializer ?_
 Let’s find out .
 */

print("Debug")
