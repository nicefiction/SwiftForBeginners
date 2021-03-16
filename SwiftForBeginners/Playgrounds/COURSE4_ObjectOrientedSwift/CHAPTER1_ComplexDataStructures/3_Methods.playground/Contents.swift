import Foundation


/**
 3 Methods
 INTRO —`Functions` take inputs ,
 perform an operation on them
 and return an output .
 In this video
 we take a look at
 `methods`
 — `functions` that are associated with an `object`
 and how they work on the `values`
 associated with the `properties` of the `object`.
 */
/**
 You might not be convinced yet
 that a `struct` offers any real advantage
 over the tuple based way we tried earlier .
 So far , it just seems like extra syntax
 to get the `dot notation property accessors` .
 This is where it starts to get interesting .
 When you work with `data` ,
 you don't want to just store it .
 You might want to _manipulate it_ ,
 get further information out of it , and so on .
 This is what `functions` are for .
 Using a `function` ,
 you can provide some inputs ,
 manipulate those inputs ,
 and output some data .
 With an object ,
 the functions that work on the data it contains ,
 are part of the object itself .
 This makes it very easy to understand
 what the scope of the object is ,
 and what we can do with the data .
 Given a _point_ ,
 we would like to know
 what other points surround .
 We could write a `function`
 and pass in the point to determine a `range` .
 But the advantage of objects is
 that we can associate a `function`
 with the `data` contained inside .
 So let's go back to our `struct Point` :
 */

/*
struct Point {
    
    let x: Int
    let y: Int
    
    /// Returns the surrounding points
    /// in range of the current point .
    func points(inRange range: Int) -> [Point] {}
}
 */

/**
 This function
 
 `func points(inRange range: Int) -> [Point] {}`
 
 takes a single parameter — `inRange` —
 that determines
 the `range` around which we want the points for . For example ,
 if the `range` is _1_ , then we only want the points _one space_ away from us .
 If the `range` is _2_ , then we want all the points up to _two spaces_ away from us.
 
 `NOTE`:
 To add a `documentation comment` ,
 
 `/// Returns the surrounding points`
 `/// in range of the current one.`
 
 `Documentation comments` are one step up from `comments` .
 `Documentation comments` make it easy
 to quickly find out
 what a piece of code does .
 When you hover over something
 — OLIVIER : with the OPTION key pressed down — ,
 until you get the _question mark_ , and then click .
 You will notice that in the `Summary` of the `function` ,
 it lists out our `documentation comment` .
 Our explanation is listed in a single line .
 */
/**
 `ASIDE`:
 Prior to Swift 3 ,
 we followed different `naming conventions` for `functions` in Swift .
 Back then , I would have named this :
 
 `func surroundingPoints() {}`
  
 `surroundingPoints` is a fine name ,
 but one of the newer guidelines is
 that we omit needless words
 when enough information is conveyed by
 the `function signature` or how it is written .
 Given that this function takes a `range` as an `argument` ,
 I think it is evident that these _points_ are the ones surrounding it .
 And before we move on ,
 remember in addition to the rule you learned about earlier ,
 `naming propositional phrases` and all ,
 we have a new guideline I want you to keep in mind :
 You need to omit needless information
 that is already conveyed
 by the `arguments` and the `return type` .
 Now , when we give the `range` parameter in the `points()` function
 a default value of `1` :
 
 `func points(inRange range: Int = 1)`
 `-> [Point] {}`
 
 we have a minor issue though .
 Let's just assume we are going to `call the function`
 with a `default value` :
 
 `points()`
 
 _Does that make enough sense ?_
 _Is it evident that we are taking a `range` into account to get these points ?_
 _Does it make sense that these points are ones surrounding the existing one ?_
 One way we can resolve this , is ,
 by mentioning `surrounding` in the `base name` :
 
 `func surroundingPoints(inRange range: Int = 1) -> [Point] {}`
 
 When we `call the function` with a `default value` ,
 it will now read :
 
 `surroundingPoints()`
 
 Now I prefer the first version with just `points()`.
 I think even with the `default value` , it reads fine ,
 and we have the `documentation comment` to give us more context`.
 Now this might seem like an unnecessary amount of thought for just a function name ,
 but naming is important .
 It is important to name things well ,
 so that the meaning and intent is explicit and crystal clear .
 */
/**
 `func points(inRange range: Int)`
 `-> [Point] {}`
 
 This function is going to return a number of different points.
 We learned in the functions course
 that we could return multiple values using a `tuple` .
 We could do that here ,
 but we don't really know how many values we need to return
 since that totally depends on the `range` that we pass in .
 So rather than a `tuple` ,
 we are going to return an `Array of Point instances` .
 Okay , let's add a body to this `method` :
 */

/*
struct Point {
    
    let x: Int
    let y: Int
    
    /// Returns the surrounding points
    /// in range of the current point .
    func points(inRange range: Int)
    -> [Point] {
        
        var result = Array<Point>()
        
        
        return result
    }
}
 */

/**
 The `result` `Array` is a `variable` ,
 so that we can _append items_ to it .
 
 `var result = Array<Point>()`
 
 We are specifying the type ,
 because otherwise
 the compiler can't infer
 what kind of `Array` we need .
 
 `NOTE` : Another way to declare an `empty Array` is
 `var result: [Point] = []`
 `var result = [Point]()`
 
 Now ,
 the next bit of the `function`
 is a little bit tricky ,
 so let's walk through it together :
 
 `(1,3)   (2,3)   (3,3)`
 `(1,2)   (2,2)   (3,2)`
 `(1,1)   (2,1)   (3,1)`
 
 You will notice that there is a pattern here :
 The `x values` go from `1` to `3` ,
 and the `y values` , go from `1` to `3` .
 This `range of values` for both `x` and `y`
 are essentially `x` minus the `range`
 and `y` minus the `range`.
 So if we'd take the `x range` ,
 which in this case is `1` .
 And we keep that constant ,
 and we match it
 with every value in the range of values for y
 which goes from `1` to `3` ,
 we will get
 
 `(1,3)`
 `(1,2)`
 `(1,1)`
 
 Then we do this for the next two numbers
 in the `range` of values for `x`
 and we should get all our points .
 We can easily write this out in code
 using everything we have learned so far ,
 simple `ranges` and `for in loops` .
 Let's write out a couple of constants
 to define the range of values
 we are going to be working with :
 */

struct Point {
    
    let x: Int
    let y: Int
    
    
    /// Returns the surrounding points
    /// in range of the current point .
    func points(inRange range: Int)
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
                
                let coordinatePoint = Point(x : xCoordinate ,
                                            y : yCoordinate)
                
                result.append(coordinatePoint)
            }
        }
        
        return result
    }
}

/**
 Now `x` here
 
 `let lowerBoundOfXRange = x - range`
 
 is the `stored property x` ,
 
 `let x: Int`
 
 and we could say `self.x` .
 So that it is explicitly clear
 that this is a `stored property` ,
 but the convention is to only use `self` in certain cases ,
 which we will get to .
 If you are having a hard time
 visualizing what I am doing here ,
 it is actually quite simple :
 
 `STEP 1` :
 The first loop iterates over the range of `x coordinates`
 
 `for xCoordinate`
 `in lowerBoundOfXRange...upperBoundOfXRange { ... }`
 
 and does some work with each value .
 
 `for yCoordinate`
 `in lowerBoundOfYRange...upperBoundOfYRange { ... }`
 
 So with our `range` ,
 the first value we get is `1` :
 
 `x : 1`
 
 `STEP 2` :
 Then we step inside the body of the loop ,
 where we encounter another `for loop` .
 
 `for xCoordinate`
 `in lowerBoundOfXRange...upperBoundOfXRange {`
 
    `for yCoordinate`
    `in lowerBoundOfYRange...upperBoundOfYRange { ... }`
 
 `}`
 
 So right now , when we are in the body of the second loop ,
 the `x value` is constant and fixed to `1` .
 This time it is for the `y coordinates`.
 So we start looping through this second range provided :
 
 `x : 1`
 `y : 1   y : 2   y: 3`
 
 At this point
 the `x coordinate` is still fixed to `1` ,
 and we are still looping through the second loop :
 
 `y : 2`
 
 And then ,
 
 `y : 3`
 
 once we have finished iterating over all the values of Y
 using that second `for loop` ,
 
 `for yCoordinate`
 `in lowerBoundOfYRange...upperBoundOfYRange {`
 
    `let coordinatePoint = Point(x : xCoordinate ,`
                                `y : yCoordinate)`
 
    `result.append(coordinatePoint)`
 `}`
 
 then we'll jump out of that ,
 and go back to the top of the first `for loop` :
 
 `for xCoordinate`
 `in lowerBoundOfXRange...upperBoundOfXRange { ... }`
 
 And we'll get the next value in that range ,
 which is the second value for `x` ,
 
 `x : 1`
 
 and then repeat this process all over .
    Given that we have a value for both `x` and `y` ,
 we can now use that to create an `instance of Point`
 using the values from our loops as arguments :
 
 `let coordinatePoint = Point(x : xCoordinate ,`
                             `y : yCoordinate)`
 For each value of `x`
 we take each value of `y` ,
 and create a `Point instance` .
 We then add this instance :
 
 `result.append(coordinatePoint)`
 
 to the `result` `Array` that we created earlier :
 
 `var result = Array<Point>()`
 
 Once the `for loops` have iterated over all the possible values ,
 we now have an array
 containing all the possible positions where an enemy can be fired at .
 */

let coordinatePoint = Point(x : 0 , y : 0)
var coordinatePoints = coordinatePoint.points(inRange : 1)

print(coordinatePoints)
/* prints [
 
    __lldb_expr_16.Point(x: -1, y: -1) ,
    __lldb_expr_16.Point(x: -1, y: 0) ,
    __lldb_expr_16.Point(x: -1, y: 1) ,
    __lldb_expr_16.Point(x: 0, y: -1) ,
    __lldb_expr_16.Point(x: 0, y: 0) ,
    __lldb_expr_16.Point(x: 0, y: 1) ,
    __lldb_expr_16.Point(x: 1, y: -1) ,
    __lldb_expr_16.Point(x: 1, y: 0) ,
    __lldb_expr_16.Point(x: 1, y: 1)
 ]
 */

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

print("Debug")
