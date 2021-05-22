import Foundation


/**
 `2 Building a Tower`
 INTRO —Working with objects is such a fundamental part of programming
 that we are going to use this video
 to simply get in more practice .
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



class Tower {
    
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    
    init(x: Int ,
         y: Int) {
        
        self.position = Point(x : x , y : y)
    }
}

/**
 Just like an `Enemy` ,
 we need to position a tower
 on a particular point
 on the map .
 So we need to add a `stored property` :
 
 `let position: Point`
 
 We'll name this `position` as well , for consistency .
 
 `NOTE` :
 Now a tower can't really pick up and move itself ,
 so in this case ,
 it does make sense to put the `position` as a `constant` .
 We can either initialize our `class` directly ,
 with an `instance of Point` ,
 or we can supply the `x` and `y` coordinates
 
 `init(x: Int , y: Int)`
 
 and create the point inside the initializer method ,
 
 `self.position = Point(x : x , y : y)`
 
 We'd like a tower to have a particular _firing_ `range` ,
 so that we can determine
 whether we can attack an enemy or not :
 
 `var range: Int = 1`
 
 For now , we'll give all our towers a `default range of 1`.
 We are going to set it as a `variable` for now
 and you will see why in a bit .
 If you look at the definition of the `points() method`
 in the `Point struct` ...
 
 `func points(inRange range: Int = 1)`
 `-> [Point] { ... }`
 
 ... you'll see that we accept a `range argument`
 and then get a list of points back .
 Now that a `Tower` has a `range property` ,
 we can easily use this
 to get an array of all the possible targets .
    The `strength property` is the rate
 at which a `Tower` depletes an `Enemy's health` :
 
 `var strength: Int = 1`
 
 `NOTE`:
 If you look at the blueprint of `Enemy` ,
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
 We have a single `method` called `decreaseHealth`
 that decreases an enemy's health by a `factor` .
 
 `life -= factor`
 
 When a `Tower` attacks an `Enemy` ,
 we can call this `method`
 and pass in the `strength value`
 as an `argument` to the `factor parameter` .
 Since our default value is `1` ,
 
 `var strength: Int = 1`
 
 every time the tower fires on an enemy ,
 their health decreases by `1` .
 */
/**
 Things are shaping up quite nicely ,
 and we are connecting our dots together :
 So now we have a point .
 On any given point
 we can either have an enemy
 or a tower .
 And a tower can fire at an enemy .
 Now , in this hypothetical game ,
 let's assume that a player can select a tower
 and then select an enemy to target .
 We need to implement this functionality .
 Let's tackle that in the next video .
 */
