import Foundation


/**
 `3 Helper Methods`
 INTRO —In the previous videos
 we looked at what `methods` are
 and how to work on the `data` stored in our objects .
 In this video ,
 we are going to take a look at `helper methods` .
 These are `methods` that do some work
 to help other `methods` in the `class` or `struct` .
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
 Let's implement a `method` that when called ,
 fires at the enemy we want :
 */

/*
class Tower {
    
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    
    init(x: Int ,
         y: Int) {
        
        self.position = Point(x : x , y : y)
    }
    
    
    func fire(at enemy: Enemy) {}
}
 */

/**
 Given an enemy ,
 before we start depleting their health .
 We need to know if the enemy is actually in `range` .
 Now we can calculate the `range` inside the `fire() method`,
 but we shouldn’t .
 _Why?_
 When we learned about functions ,
 we said that a `function` is a chunk of code
 that carries out a very specific task .
 The task of the `fire() method` is _to fire at the enemy_ .
 _Firing at the enemy_ ,
 is a very separate task
 from _determining whether it is in range_ .
 You can calculate the range of an enemy
 without actually ever firing .
 In cases like these ,
 we should separate the code
 so that our functions or methods
 takes care of a _single task_ .
 When we write a `method`
 — like we are about to —
 that we won't be calling directly
 using an `instance of the class` ,
 we call these `helper methods` .
 So let's write one .
 To fire on an enemy ,
 we can only do so
 if they are in range :
 */

/*
class Tower {
    
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    
    init(x: Int ,
         y: Int) {
        
        self.position = Point(x : x , y : y)
    }
    
    
    func fire(at enemy: Enemy) {}
    
    
    func isInRange(of enemy: Enemy)
    -> Bool {
        
        let availablePositions: [Point] = position.points(inRange : range)
        
        
        for point in availablePositions {
            
            if point.x == enemy.position.x
                && point.y == enemy.position.y {
                
                return true
            }
        }
        
        return false
    }
}


let enemy = Enemy(x : 0 , y : 0)
let tower = Tower(x : 1 , y : 0)

tower.isInRange(of : enemy)
 */

/**
 Now there are several ways we can calculate `range` mathematically ,
 however , we are going to keep it simple
 by using work we have already done .
 We'll get an Array of the points
 that are in range of our initial position ,
 and then we'll check
 if the target position is listed in that array of points .
 Getting a list of available positions around us is easy
 because we already wrote a very handy instance method
 on the `Point struct` earlier :
 
 `struct Point {`
 
    `...`
 
    `func points(inRange range: Int = 1)`
    `-> [Point] { ... }`
 `}`
 
 So here we have a `Point` ...
 
 `class Tower {`
 
    `let position: Point`
    `var range: Int = 1`
 
    `...`
    
 
    `func isInRange(of enemy: Enemy)`
    `-> Bool {`
 
        `let availablePositions: [Point] = position.points(inRange : range)`
 
        `...`
    `}`
 `}`
 
 we know _where the tower is_ ,
 and the `Point` can determine
 what are the `points` around it .
 So using the `stored property position` from the `Tower class`
 — that contains the tower’s location —
 we can figure out
 all the available positions that are in range of us .
 
 `let availablePositions: [Point] = position.points(inRange : range)`
 
 Our location is stored in this `position stored property` ,
 and we can _refer_ to this inside the class by simply using the `position property` .
 The `position property` is in the _same scope_
 as the `function isInRange()`.
 Anything declared outside the `function isInRange()` ,
 but inside the `Tower class`
 is available to the `isInRange() function` .
 So `position` is available
 inside the `isInRange() function` .
 On `position` ,
 we are going to call the `points() method` :
 
 `position.points(inRange : range)`
 
 and it needs a `range` ,
 and again we have the tower’s `range` in another `stored property` :
 
 `var range: Int = 1`
 
 So we can use that as well .
 `NOTE`: Again ,
 this is highlighting the advantage of `Object Oriented Programming` .
 All the work that we need to do with this data
 — `func isInRange(of:) -> Bool {}` — ,
 and the `data` itself
 is all in one place .
 They are not just a loose grouping of functions and data points .
 If you _OPTION click_ on the `points() method`
 you will see that the `return type` is `[Point]` .
 So we know that these are now
 the surrounding points in `range` of our towers `position` .
 To determine whether a given point is in range ,
 what we will do , is,
 loop through all the `availablePositions` using a `for in loop` ,
 and then check those points :
 
 `for point in availablePositions {`
 
    `if point.x == enemy.position.x`
      `&& point.y == enemy.position.y {`
 
        `return true`
    `}`
 `}`
 
 Once we have a single point instance out of this array ,
 we can check the `x` and `y` coordinates ,
 and make sure
 they match those of the target `position` .
 So to check if an `enemy` is at that `point` ,
 we have to check if this _point's x value_
 is the same as
 _the enemy's x value_
 and _this point's y value_ ,
 is the same as
 _the enemy's y value_ .
 `position` itself is an object .
 
 `let position: Point`
 
 It is an `instance of Point`.
 So to get these object’s values
 — which is `x` and `y` —
 we can use _dot notation_ :
 
 `point.x`
 `point.y`
 
 So if this succeeds ,
 
 `if point.x == enemy.position.x`
   `&& point.y == enemy.position.y { ... }`
 
 then we step into the body of the `if statement` ...
 
 `if point.x == enemy.position.x`
   `&& point.y == enemy.position.y {`

     `return true`
 `}`
 
 ... and we can say `return true` .
 The enemy is in range of our tower .
 However , if we go through every point in the `availablePositions array` ,
 and this never evaluates to `true` ,
 that means that the enemy is not in range of our tower .
 
 `GOTCHA`:
 Make sure to put the `return false statement`
 outside both the `loop` and `if statement`.
 You need the `return false statement`
 because the `isInRange() function`
 requires a `return of type Boolean `.
 
 `func isInRange(of enemy: Enemy)`
 `-> Bool { ... }`
 
 `ASIDE`:
 The `return statement` is known as
 a `control transfer statement` .
 When you call `return` from the body of the `loop` ,
 from inside of it,
 you immediately jump out of both the `loop` and the `function` .
 When this happens
 the `for loop` stops executing immediately
 and we `return true` from this entire function .
 This `return value` corresponds to the `return value` of the `function` .
 Now there are other types of `control transfer statements` like `return` ,
 but we'll learn them as we go .
 
 Okay , so now we have a `helper method`
 that we can use to figure out whether an enemy is in range of a tower .
 `Instance methods` like `func isInRange()` ,
 are scoped to an instance of the `Tower class` .
 What this means , is ,
 that you can access any `instance method` or `property`
 from inside any other `instance method` .
 So the `helper method` we just wrote
 — `func isInRange()` —
 can be used
 from inside the `func fire(at:) method`:
 */

class Tower {
    
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    
    init(x: Int ,
         y: Int) {
        
        self.position = Point(x : x , y : y)
    }
    
    
    func fire(at enemy: Enemy) {
        
        // if isInRange(of: enemy) {
        //     print("Gotcha")
        // } else {
        //     print("Out of range")
        // }
        print(isInRange(of: enemy) ? "Gotcha" : "Out of range")
    }
    
    
    func isInRange(of enemy: Enemy)
    -> Bool {
        
        let availablePositions: [Point] = position.points(inRange : range)
        
        
        for point in availablePositions {
            
            if point.x == enemy.position.x
                && point.y == enemy.position.y {
                
                return true
            }
        }
        
        return false
    }
}

/**
 So first we'll check if the enemy in range :
 
 `print(isInRange(of: enemy) ? "Gotcha" : "Out of range")`
 
 Remember that in an `instance method`,
 you have access to any `instance stored property`
 because these `stored properties` are also scoped to an `instance` .
 So let's give this a try :
 */

let enemy = Enemy(x : 0 , y : 0)
let tower = Tower(x : 1 , y : 0)

/**
 Now remember , the `fire() method` is an `instance method` .
 So we have to call it on an `instance of Tower`
 — `tower`—
 and not the `Tower class` .
 */

// Tower.isInRange(of : enemy) // ERROR
tower.isInRange(of : enemy)
tower.fire(at: enemy)
