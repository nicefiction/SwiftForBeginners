import Foundation


/**
 `3 Overriding Methods`
 INTRO —Not only can we `override properties`
 but we can `override methods` as well
 to provide different implementations .
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



class Tower {
    
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    
    init(x: Int ,
         y: Int) {
        
        self.position = Point(x : x , y : y)
    }
    
    
    func fire(at enemy: Enemy) {
        
        if isInRange(of: enemy) {
        
            print("Gotcha")
            enemy.decreaseHealth(by : 1)
        } else {
            print("Out of range")
        }
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


class SuperEnemy: Enemy {
    
    let hasSuperPower: Bool = true
    
    
    override init(x: Int, y: Int) {
        
        super.init(x : x , y : y)
        life = 4
    }
}

/**
 We want a new kind of `Tower`
 to tackle this tough `SuperEnemy` .
 So let's create a `LaserTower` .
 The `LaserTower` has two defining `properties` ,
 the `strength` of the `LaserTower`
 is far greater than a regular `Tower` .
 And because it is a laser ,
 its `range` is very large .
 Because a `LaserTower`
 will need all the `properties` and `methods`
 of a basic `Tower` ,
 a good place to start is
 by subclassing the `Tower class` .
 When you  are writing your own code
 and you come to a decision like this ,
 you want to create a new tower
 and there is already an existing type .
 _What route should you take ?_
 _Should you create an entirely new class_
 _that is not related to the existing Tower ,_
 _or should you subclass ?_
 An easy way to figure it out is
 to ask the `is a question` .
 `Is a LaserTower` also a `Tower` ?
 Well yes it is ,
 because it can do everything a `Tower` can do
 plus more .
 If the answer to the question is _yes_
 then you should use `inheritance`
 and `subclass` to create your new type .
 */

class LaserTower: Tower {

    // STEP 1 , Use the override keyword :
    override init(x: Int , y: Int) {
        // STEP 2 , Set the properties of the new subclass first — if there are any :
        // STEP 3 , Prepare the properties of the Superclass :
        super.init(x : x , y : y)
        // STEP 4 , Modify the properties of the Superclass :
        strength = 10
        range = 10
    }
    
    
    override func fire(at enemy: Enemy) {
        
        while enemy.life > 0 {
            
            enemy.decreaseHealth(by: strength)
        }
        
        print("The enemy has been destroyed .")
    }
}

/**
 The `range` and `strength properties`
 are `stored properties` of the `superclass Tower` : `STEP 4`
 
 We cannot access the `stored properties`
 without first initialising `Tower` : `STEP 3`
 
 But before we can initialise `Tower`,
 we need to initialise `LaserTower` : `STEP 1` & `STEP 2`
 because of our rules :
 👇
 The `properties` of the `subclass`
 need to have `initial values` first and foremost
 before we do anything with the `superclass` .
 
 `STEP 1 & 2` :
 The way initialising works in a `subclass` , is ,
 that we first <initialise the subclass>,
 `STEP 3 & 4` :
 then swift goes up the chain
 that connects the `subclass` to the `parent` ,
 and then initializes the `parent` .
 */
/**
 `STEP 1` :
 Before we can initialize the `Tower superclass` ,
 we need to initialize its `subclass` — `LaserTower` :
 by `overriding` the `init() method` from the `parent class` .
 
 `override init(x: Int , y: Int) { ... }`
 
 `STEP 2` :
 We set the `properties` on the `subclass`
 before we work on the `superclass` .
 Now remember ,
 our `subclass` — `LaserTower` —
 does not have
 any of its own new `stored properties` .
 So we are done setting it up .
 
 `STEP 3` :
 We can now move on to initialising the `Tower superclass` :
 
 `super.init(x : x , y : y)`
 
 `STEP 4` :
 
 `strength = 10`
 `range = 10`
 
 `strength` and `range` are properties of the `Tower superclass` ,
 
 `class Tower {`
 
    `let position: Point`
    `var range: Int = 1`
    `var strength: Int = 1`
 
    `...`
 `}`
 
 Since we have initialised the `superclass` ,
 we can pass these `values` through .
 And now we can create an `instance of LaserTower`
 that has a `range` and `strength default value` of `10` :
 */

let tower = Tower(x: 0, y: 0)
let enemy = Enemy(x: 1, y: 0)

let laserTower = LaserTower(x : 2 , y : 1)
let superEnemy = SuperEnemy(x : 1 , y : 2)

/**
 I mentioned before
 that the `init() method` is simply
 a special `instance method` .
 This means that if we can `override the init() method` ,
 we should be able to `override` any `method`
 and change its implementation .
 So let's override the `fire() method`
 and change the implementation
 to ignore the `range` check .
 Since the laser can hit anywhere on the map ,
 we don't need to check if an `enemy` _is in range_ :
 
 `class LaserTower: Tower {`
 
    `...`
 
    `override func fire(at enemy: Enemy) {`
 
        `while enemy.life > 0 {`
 
            `enemy.decreaseHealth(by: strength)`
        `}`
 
        `print("The enemy has been destroyed .")`
    `}`
 `}`
 */

tower.fire(at: superEnemy)
// prints Out of range .
laserTower.fire(at: superEnemy)
// prints The enemy has been destroyed .

/**
 Because a `LaserTower` is a `Tower` ,
 you can use a `LaserTower`
 anywhere a `Tower` is expected .
 And because a `SuperEnemy` is an `Enemy`,
 we can use it
 anywhere the `Enemy class` is expected as well .
 */



/**
 Hopefully , this highlights the power of `inheritance` to you .
 You can inherit all the `properties` and `methods` of a `class`
 but you can customise these
 to provide a different implementation.
 */



/* NOTE OLIVIER :
 * You can also make use of
 * local parameter names
 * in your initialiser .
 * You could do this to avoid confusion :
 
class LaserTower: Tower {
    
    override init(x superX: Int , y superY: Int) {
        
        super.init(x : superX , y : superY)
        
        strength = 10
        range = 10
    }
}
*/
