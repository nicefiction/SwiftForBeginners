import Foundation

/**
 `3 Protocol Oriented Programming`
 INTRO —Swift is often described
 as a Protocol Oriented Programming language .
 In this video , we are going to take
 an Object Oriented example we have worked with before
 and implement the same code starting with protocols .
 */
/**
 Ever since the introduction of Swift ,
 Apple has been describing it as
 a Protocol Oriented Programming language .
 In a previous course ,
 we learned about Object Oriented Programming with Swift
 and how to use custom data types or objects
 to encapsulate and work on data .
 What does Protocol Oriented Programming mean ?
 Are we abandoning objects , or learning yet another new thing ? No , not at all .
 `Protocol Oriented Programming` simply means
 carefully defining the interfaces to your objects .
 It means preferring composition over inheritance where possible
 in order to create flexible objects .
 Let's see what this means .
 
 In the Object Oriented Swift course ,
 we learned about objects
 by building a series of models for our hypothetical tower defense game .
 Let's run through that exercise again ,
 this time with a Protocol Oriented model approach .
 We'll add an extra feature or two to our models
 and see how protocols help keep things nice and tidy .
 Let’s inspect the `Enemy` and `Tower` class:
 */

struct Point {
    
    var x: Int
    var y: Int
    
    
    func points(inRange range: Int = 1)
    -> [Point] {
        
        var results: [Point] = []
        let lowerBoundOfXRange = x - range
        let upperBoundOfXRange = x + range
        let lowerBoundOfYRange = y - range
        let upperBoundOfYRange = y + range
        
        for xCoordinate in lowerBoundOfXRange...upperBoundOfXRange {
            for yCoordinate in lowerBoundOfYRange...upperBoundOfYRange {
                
                let coordinatePoint = Point(x: xCoordinate, y: yCoordinate)
                results.append(coordinatePoint)
            }
        }
        return results
    }
}



class Enemy {
    
    var life: Int = 2
    let position: Point
    
    
    init( x: Int ,
          y: Int ) {
        
        self.position = Point(x : x ,
                              y : y)
    }
    
    
    func decreaseHealth(by factor: Int) {
        
        life -= factor
    }
}



class Tower {
    
    let position: Point
    var range: Int = 1
    let strength: Int = 1
    
    
    init(x: Int ,
         y: Int) {
        
        self.position = Point( x : x ,
                               y : y )
    }
    
    
    func isInRange(of enemy: Enemy)
    -> Bool {
        
        let availablePositions = position.points(inRange : range)
        
        for point in availablePositions {
            if point.x == enemy.position.x && point.y == enemy.position.y {
                return true
            }
        }
        
        return false
    }
    
    
    func fire(at enemy: Enemy) {
        
        if isInRange(of : enemy) {
            
            enemy.decreaseHealth(by : strength)
            print("Gotcha")
        } else {
            print("Out of Range")
        }
    }
}

/**
 While there are completely different classes
 that in game have different attributes and different roles ,
 in code , they have a lot of things in common . For example ,
 both `Enemy` and `Tower` are initialised with an initial `position` :
 
 `let position: Point`
 
 Both `Enemy` and `Tower` have a `life` ,
 because you can destroy it :
 
 `var life: Int = 2` / ` let strength: Int = 1`
 
 Both `Enemy` and `Tower` can attack , and be attacked : 
 
 `func decreaseHealth()` and `func fire()`
 
 So we have a lot of things in common here .
 There are also some behaviours that only one object exhibits .
 For example , only an `Enemy` can move .
 So , let’s take all these characteristics
 and factor them out into individual protocols ,
 so that if we were to go on , and implement an actual game ,
 we have strict types to define what things can do .
 Only an `Enemy` can move . So , for example , if we had a `move()` function ,
 there is no chance that we can pass a `Tower` in there by mistake .
 Okay , so how are we going to do this ?
 First things first , Enemies can move in our game . Let's create a protocol :
 */

enum Direction {
    
    case up , right , down , left
}


protocol CanDoMove {
    
    func move(_ direction: Direction ,
              by distance: Int)
}

/**
 The `CanDoMove` protocol declares a single method , `move()` ,
 that given a `direction` and a `distance` ,
 allows an `Enemy` or `Tower `to move around .
 To make the `CanDoMove` protocol actually work ,
 we need to implement the `Direction` enum first .
 The enum models the four types of movements on the map .
 We declare a `move()` function that moves in a particular direction .
 I want this to read very nice when we actually call the method ,
 like it should say _move up_ .
 So I am going to omit the external name . And by doing that ,
 I say that I don't want an argument label for this argument .
 I am just going to give it a local name of `direction` . And then
 I want to specify the number of spaces that we move `by` , by `distance` .
 So now we have the moving behaviour modelled .
 We can guarantee that we can call `move()` on any type that conforms to `CanDoMove` .
 Next ,
 both Enemies and Towers can be destroyed .
 Let's move this common behaviour into yet another protocol :
 */

protocol CanDoDestruct {
    
    func decreaseLife(by factor: Int)
}

/**
 So again ,
 only Enemies that have the` decreaseLife()` method implemented are destructible ,
 and those are the only ones that we can fire on .
 Another behaviour in common is
 that both Enemies and Towers can attack .
 So let's create a third protocol named `CanDoAttack` to model this :
 */

protocol CanDoAttack {}

/**
 I am going to leave this one empty for now .
 */
