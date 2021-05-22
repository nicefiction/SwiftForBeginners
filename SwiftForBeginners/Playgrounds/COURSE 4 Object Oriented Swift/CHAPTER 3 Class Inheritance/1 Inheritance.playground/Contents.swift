import Foundation


/**
 `CHAPTER 3`
 `Class Inheritance`
 INTRO CHAPTER 1 —So far
 we have seen two types of objects that Swift offers
 but we don't really know the difference between the two .
 While `structs` allow us to model <simple values> ,
 `classes` allow us to create <families of related objects> .
 Over the next few videos ,
 we will look at
 how we can inherit from other classes
 and modify their properties and behaviours
 to suit our needs .
 */
/**
 `1 Inheritance`
 INTRO —The most visible difference between `structs` and `classes` is
 that `classes` support `inheritance`.
 In this video we take a look at
 what `inheritance` is,
 why it is useful
 and how we can extend our object graph by writing very little code .
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
 A `class` and `struct` both achieve the same end goal ,
 in that we can represent `complex data types` .
 However , contrary to a `struct` ,
 a class can inherit
 methods ,
 properties ,
 and a few other characteristics from another `class` .
 */

class SuperEnemy: Enemy {}

let superEnemy = SuperEnemy(x : 1 , y : 2)

/**
 The compiler automatically shows
 the same initialiser we created earlier in the `Enemy class` .
 This is
 because we inherited the initialiser
 that we wrote for the `Enemy class` :
 
 `init(x: Int ,`
      `y: Int) {`
     
     `self.position = Point(x : x , y : y)`
 `}`
 
 When one `class` inherits from another ,
 the _inheriting class_` ,
 which in our case is `SuperEnemy` ,
 
 `class SuperEnemy: Enemy {}`
 
 is called the `subclass`.
 And the `class` it inherits from — `Enemy` in this case ,
 is known as the `superclass` or sometimes _the parent_ .
 _What does that mean ?_
 It means that now
 the body of `SuperEnemy`
 is identical to `Enemy` . 
 
 (`1`) The first advantage of `inheritance` is
 that we can <avoid code duplication> . 
 (`2`) The second advantage is
 that we can <refine the subclass>
 by either modifying existing properties ,
 or adding new ones .
 */
