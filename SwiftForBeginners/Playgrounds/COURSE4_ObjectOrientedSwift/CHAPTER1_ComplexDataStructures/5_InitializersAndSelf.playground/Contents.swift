import Foundation


/**
 `5 Initializers and Self`
 INTRO — Structs in Swift get an automatic initializer method
 that helps us create an instance of the `struct` for use .
 In this video we peek behind the curtain
 and write our own `initializer method`
 so we can understand just
 how an `instance` is created .
 */
/**
 An `initializer` is a special `instance method`
 that sets up our `class` ready for use.
 Even though it is all done automatically right now ( OLIVIER : for a struct type ) ,
 we can write out an initializer method manually
 to better understand what is going on under the hood .
 */

struct Point {
    
    let x: Int
    let y: Int
    
    
    init(x: Int ,
         y: Int) {
        
        self.x = x
        self.y = y
    }
    
    
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
 While `methods` typically start with the word `func` ,
 like a `function`,
 `initializer methods` are special `functions`
 and they start with the word `init` :
 
 `init( ... ) { ... }`
 
 An `init( )` method has one sole purpose ,
 and that is to set up an object ready for use .
 _What does ready for use mean ?_
 It means that all its stored properties
 need to have initial values
 before you can use it .
 Just like any `function` or `method` ,
 the `init() method` can contain `parameters` .
 We need to set up the `values` for our `stored properties` `x` and `y` .
 So we'll give this a `label` of `x` and a label of `y` and both of type `Int `:
 
 `init(x : Int , y: Int) { ... }`

 Now , inside the body of the `init()` `method` ,
 
 `init(xArgument: Int ,`
      `y: Int) {`
 
    `self.x = xArgument`
    `self.y = y`
 `}`

 we set the `stored property` `x`
 to the value of the `xArgument`.
 
 `self.x = xArgument`
 
 To refer to an `instance`,
 — because remember ,
 these `stored properties`
 are associated with an instance of `Point` —
 we need to use the keyword `self` .
 `self` refers to that `instance` specifically .
 `NOTE`:
 Rather than have an `automatic initializer` created for us
 — or a `memberwise initializer` as it is specifically called —
 we have explicitly written the `method` ourselves .
 */
/**
 `ASIDE` :
 As an aside ,
 you will see people use `self`
 to refer to `properties` inside an object all the time
 regardless of whether there is a naming confusion or not .
 Now this is because prior to the arrival of Swift ,
 when we used Objective C as our primary language ,
 we always had to use `self` to refer to a `stored property` .
 Now , the Swift team's official recommendation is
 that you are required to use `self`
 when distinguishing between
 (`A`) parameter or argument labels
 and (`B`) property names
 as we just did :
 
 `init(xArgument: Int ,`
      `y: Int) {`
 
    `self.x = xArgument`
    `self.y = y`
 `}`
 
 Otherwise
 we are just going to let Swift infer it automatically .
 Personally I always use `self` inside `init() methods`
 but never in any other methods , unless I need to .
 */
