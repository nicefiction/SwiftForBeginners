import Foundation


/**
 `4 High Level Overview`
 INTRO — Now that we have a good understanding of `structs` and `classes` ,
 let's take a step back
 and examine our `object graph`
 and the relationships between our objects .
 */
/**
 Before we move on to the next bit ,
 let's take a step back .
 
 `STEP 1`
 We started by creating a simple structure , `Point` :
 */

struct Point {
    
    let x: Int
    let y: Int
    
    
    /// Returns the surrounding points
    /// in range of the current one .
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
 We use the `Point struct`
 to represent a coordinate point .
 The `Point struct` contains two simple `stored properties`
 `x` and `y` that allow us to place it on a hypothetical map .
 `Point` also has a single method `points()`
 that given a `range`
 returns an `array` containing all the possible points surrounding it .
 `Point` is an `object`
 that then form the basis for two new types — `Enemy` and `Tower` .
 */
/**
 `STEP 2`
 The first one is a class that represents an `Enemy` in our game :
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
 The `Enemy` needs to occupy a `position` on the map .
 And we model this by giving it a `stored property` _of type_ `Point` :

 `let position: Point`
 
 since we can use custom types
 as building blocks
 for other objects .
 An `Enemy` also has a `life` :
 
 `var life: Int = 2`
 
 which is a `variable stored property`
 and can be changed .
 We don't change this `property` directly ,
 instead we added a `method` to our `class`
 — `decreaseHealth()` :
 
 `func decreaseHealth(by factor: Int) {`
 
    `life -= factor`
 `}`
 
 The `decreaseHealth() method`
 reduces the health of the enemy by some `factor` .
 When we want to affect the _enemy's life_ ,
 we simply call the `decreaseHealth() method` .
 This is a common pattern that you will soon learn ,
 where we use methods
 to interact with our objects
 instead of manipulating the properties directly .
 */
/**
 `STEP 3` :
 The second `class` we created was `Tower` :
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

/**
 Like `Enemy` , instances from the `Tower class`
 also occupy a `position` on the map .
 So we give it an `instance of Point` as a `stored property` :
 
 `let position: Point`
 
 Here is where things get interesting .
 Towers can _fire at_ enemies ,
 so we created an `instance method`
 that takes an `enemy` as a `parameter` :
 
 `func fire(at enemy: Enemy) {`
 
    `if isInRange(of: enemy) {`
 
        `print("Gotcha")`
        `enemy.decreaseHealth(by : 1)`
    `} else {`
        `print("Out of range")`
    `}`
 `}`
 
 It checks whether the `enemy` _is in range of_ the tower ,
 
 `class Tower {`
 
    `...`
 
    `func isInRange(of enemy: Enemy)`
    `-> Bool { ... }`
 `}`
 
 and if it is ,
 it calls the `instance method` ,
 `decreaseHealth()`,
 on that instance of `Enemy` ,
 
 `class Enemy {`
 
    `...`
    ` `func decreaseHealth(by factor: Int) {`
 
        `life -= factor`
    `}`
 `}`
 
 until it is vanquished .
 As I have mentioned so far ,
 all these `functions` ,
 and the `properties` our objects contained ,
 are `instance methods` and `instance properties` .
 So to put any of this to use ,
 we need to create an `instance` .
 Once an `instance` is created
 the values we pass in through our `initialiser methods`
 are substituted where we use them . For example ,
 */

let enemy = Enemy(x : 0 , y : 0)
let tower = Tower(x : 1 , y : 0)

print("The health of the enemy is \(enemy.life) .")
// prints The health of the enemy is 2 .

tower.isInRange(of : enemy) // true
tower.fire(at: enemy)

print("The health of the enemy is \(enemy.life) .")
// prints The health of the enemy is 1 .
