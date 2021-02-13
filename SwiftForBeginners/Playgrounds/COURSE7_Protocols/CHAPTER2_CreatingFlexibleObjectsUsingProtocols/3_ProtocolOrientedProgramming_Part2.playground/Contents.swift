import Foundation


/**
 `4 Protocol Oriented Programming Part 2`
 INTRO — Let's continue building on top of our example and implement a final protocol
 to model the identity of players in our game .
 */
/**
 We now have three protocols that model
 the various behaviours of players in our game at different times .
 */

enum Direction {
    
    case up , right , down , left
}


protocol CanDoMove {
    
    func move(_ direction: Direction ,
              by distance: Int)
}


protocol CanDoDestruct {
    
    func decreaseLife(by factor: Int)
}


// protocol CanDoAttack {}

/**
 But we are still missing some information about the identity of our players .
 What properties do they have , and how are they initialised ?
 Let's build a `Player` protocol to model this :
 */
/*
protocol IsAPlayer {
    
    var position: Point { get set }
    var life: Int { get set }
    
    init(x: Int ,
         y: Int)
}
*/
/**
 Every Player in the game is initialised at a particular point on a map :
 
 `init(x: Int , y: Int)`
 
 So any class that represents an `IsAPlayer`
 — whether it is some kind of `Tower` or `Enemy` —
 needs an initializer method
 that takes a `Point`
 or at least a Point on the map
 as an argument :
 
 `var position: Point { get set }`
 
 I have marked the position as both gettable and settable
 because when we call `move()` on a `player` like an `enemy` ,
 we need to read ,
 and then change their current position .
 So we need to be able to get and set it .
 This is sufficient to define the identity of a `player` in the game .
 Let's go back to the `CanDoAttack` protocol .
 */

/*
protocol CanDoAttack {
    
    var strength: Int { get }
    var range: Int { get }
    
    func attack(player: IsAPlayer)
}
 */

/**
 To attack another `player` ,
 a `player` needs a `strength` factor in its attack .
 This determines how strong that attack is . And this can't be changed ,
 so it is just a gettable property .
 Any type that can attack also needs an `attack()` method .
 It also needs an enemy to target so we'll say , `player` .
 We don't want to say _enemy_ ,
 because both the `Tower` and the `Enemy` can attack .
 Passing in the `IsAPlayer` type , allows us to pass through any type that is on the map .
 Now this would seem to make sense
 but it actually won't work
 because the `IsAPlayer` protocol only encapsulates `position` and `life` .
 
 `protocol IsAPlayer {`
     
     `var position: Point { get set }`
     `var life: Int { get set }`
     
     `init(x: Int ,`
          `y: Int)`
 `}`
 
 `life` is what we want to decrease . But remember ,
 when we learned about Object Oriented programming , we said
 that we don't want to mess around with the stored properties of another type directly .
 We want to do that through instance methods . So here
 when we attack a player , ...
 
 `protocol CanDoAttack {`
     
     `var strength: Int { get }`
     `var range: Int { get }`
     
     `func attack(player: IsAPlayer)`
 `}`
 
 ... we would like to simply call `decreaseLife()` method on that `player` .
 Because that is modelled by the `CanDoDestruct` protocol ,
 
 `protocol CanDoDestruct {`
     
     `func decreaseLife(by factor: Int)`
 `}`
 
 so these two — `CanDoAttack` and `CanDoDestruct` — go hand-in-hand :
 A player that can attack ,
 needs to attack a type that is destructible .
 The `decreaseLife()` method isn't modelled by the `IsAPlayer` protocol .
 
 `protocol IsAPlayer {`
     
     `var position: Point { get set }`
     `var life: Int { get set }`
     
     `init(x: Int ,`
          `y: Int)`
 `}`
 
 But we need access to that .
 So there are two things we can do .
 One way to do it , is ,
 we can say that the `player` has to be `CanDoDestruct` :
 
 `protocol CanDoAttack {`
 
 `var strength: Int { get }`
 `var range: Int { get }`
 
 `func attack(player: CanDoDestruct)`
 `}`
 
 but we won’t choose this option
 because of the way we are designing our game .
 Every instance of `IsAPlayer` on our map is actually destructible .
 Instead , we'll say that `IsAPlayer` has to inherit from `CanDoDestruct` :
 */

protocol IsAPlayer: CanDoDestruct {
    
    var position: Point { get set }
    var life: Int { get set }
    
    init(x: Int ,
         y: Int)
}

/**
 So now ,
 we have access to the `decreaseLife()` method , through `IsAPlayer` ,
 because `IsAPlayer` knows about that method now :
 
 `protocol CanDoAttack {`
     
     `var strength: Int { get }`
     `var range: Int { get }`
     
     `func attack(player: IsAPlayer)`
 `}`
 
 `GOOD PRACTICE` : You might be thinking , this is a lot of small protocols .
 Wouldn't it be neater to have one protocol , say , called `IsAnEnemy` ,
 that defines all of this behaviour ? Maybe , but remember ,
 we want to try and think small when it comes to programming ,
 small protocols , small objects , small models , and so on .
 Each type or object should do very little
 and this makes it easier to modify in the future ,
 and easier to get your head wrapped around what each type is doing .
 
 Okay , so now we have these protocols ,
 let's actually implement them in our types :
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

/**
 The `Enemy` is first and foremost down here , an `IsAPlayer` .
 So let's conform to the `IsAPlayer` protocol :
 */

/*
class Enemy: IsAPlayer {
    
    var life: Int = 2
    let position: Point
    
    
    init( x: Int ,
          y: Int ) {
        
        self.position = Point(x : x ,
                              y : y)
    } // ERROR : Initializer requirement 'init(x:y:)' can only be satisfied by a 'required' initializer in non-final class 'Enemy' .
    
    
    func decreaseHealth(by factor: Int) {
        
        life -= factor
    }
} // ERROR : Type 'Enemy' does not conform to protocol 'CanDoDestruct' .
 */

/**
 We are getting a few errors and that is not because of the `IsAPlayer` protocol actually .
 We are already conforming to `IsAPlayer` in every way ,
 because we have the `init()` method , and a `position` ,
 and we have a `life` as modelled by a `IsAPlayer` up here .
 We do have an error here because — in order to conform to the `IsAPlayer` protocol —
 ( 1 ) `position` needs to be both gettable and settable .
 We therefore need to change the `position` property
 from a constant to a variable .
 ( 2 ) When we define an initializer method inside of a protocol ,
 and we say that types that conform to the `IsAPlayer` protocol need to implement
 the initialiser method . Then down in the actual type — `Enemy` — ,
 we need to specify that this is a `required` protocol .
 */
/*
class Enemy: IsAPlayer {
    
    var life: Int = 2
    // var position: Point
    var position: Point
    
    
    required init( x: Int ,
                   y: Int ) {
        
        self.position = Point(x : x ,
                              y : y)
    }
    
    
    // func decreaseHealth(by factor: Int) {
    func decreaseLife(by factor: Int) {
        
        life -= factor
    }
}
*/
/**
 And now `Enemy` conforms to the `IsAPlayer` protocol .
 In this way ,
 we can add all the necessary behaviours that we want our `Enemy` type to model .
 So we can say that our `Enemy` is an `IsAnAttacker` .
 Before we can make `Enemy` conform to the `IsAnAttacker` protocol ,
 we need to change the name of our current protocol .
 `CanDoAttack` is a `Can Do` type of protocol .
 `Can Do` protocols describe behaviour . Instead ,
 we want the name of the protocol describe the identity of the `Enemy` .
 We use nouns to model those , hence the name of `IsAnAttacker` .
 `IsAnAttacker` is an `Is A` type of protocol .
 */

// protocol CanDoAttack {
protocol IsAnAttacker {
    
    var strength: Int { get }
    var range: Int { get }
    
    func attack(player: IsAPlayer)
}

/**
 We can now make `Enemy` conform to the `IsAnAttacker` protocol :
 
 `class Enemy: Player, Attacker { ... }`
 
 Let’s add the methods and properties required by the `IsAnAttacker` protocol :
 */

/*
class Enemy: IsAPlayer ,
             IsAnAttacker {
    
    var strength: Int = 5 // IsAnAttacker
    var range: Int = 2 // IsAnAttacker
    var life: Int = 2 // IsAPlayer
    // var position: Point
    var position: Point // IsAPlayer
    
    
    required init( x: Int ,
                   y: Int ) {
        
        self.position = Point(x : x ,
                              y : y)
    }
    
    
    // func decreaseHealth(by factor: Int) {
    func decreaseLife(by factor: Int) {
        
        life -= factor
    }
    
    
    func attack(player: IsAPlayer) {
        
        player.decreaseLife(by : strength)
    }
}
*/

/**
 Now an `Enemy` can also move ,
 so let's conform `Enemy` to the `CanDoMove` protocol :
 */

class Enemy: IsAPlayer ,
             IsAnAttacker ,
             CanDoMove {
    
    
    var strength: Int = 5 // IsAnAttacker
    var range: Int = 2 // IsAnAttacker
    var life: Int = 2 // IsAPlayer
    // var position: Point
    var position: Point // IsAPlayer
    
    
    required init( x: Int ,
                   y: Int ) {
        
        self.position = Point(x : x ,
                              y : y)
    }
    
    
    // func decreaseHealth(by factor: Int) {
    func decreaseLife(by factor: Int) {
        
        life -= factor
    }
    
    
    func attack(player: IsAPlayer) {
        
        player.decreaseLife(by : strength)
    }
    
    
    func move(_ direction: Direction ,
              by distance: Int) {
        
        switch direction {
        case .up : position = Point( x : position.x ,
                                     y : position.y + distance )
        case .down : position = Point( x : position.x ,
                                       y: position.y - distance )
        case.left : position = Point( x : position.x + distance ,
                                      y : position.y )
        case.right : position = Point( x : position.x - distance ,
                                       y : position.y )
        }
    }
}

/**
 In this way , we can also combine different protocols to build the `Tower` type .
 `Enemy` is an `IsAPlayer` , and is an `IsAnAttacker` , through `IsAPlayer` ,
 `Enemy` also inherits from `CanDoDestruct` , because it can be destroyed .
 `Enemy` is also `CanDoMove` .
 But in the case of `Tower` , for example ,
 we can exclude the `CanDoMove` protocol . And by doing that ,
 we let the compiler know that a `Tower` can never move
 because it doesn't match the type specification .
 From here , we can even subclass these objects
 to create further types like `SuperEnemy` , or `SuperTower` .
 If any of these subclasses then offer behaviour in addition to what the parents do ,
 we can model this through other small protocols .
 
 Hopefully , this gives you an idea at least of the utility of protocols
 in defining interfaces and creating objects through composition of protocols rather than inheritance .
 You may not be fully convinced , and that is okay ,
 because there is a bit of a learning curve here .
 But a good way to think of this , is , let's say ,
 our game had a `movePlayer( )` function :
 
 `func movePlayer(_ player: CanDoMove) { ... }`
 
 In this way ,
 we can guarantee that we can only pass in an `Enemy` to `CanDoMove` ,
 because `Enemy` conforms to the `CanDoMove` type , but `Tower` does not .
 This way , it becomes easier to restrict certain classes and types
 to do very specific things throughout your code base .
 
 Now , if this seems cumbersome , that is okay ,
 and that is mainly because we haven’t really seen the power of protocols fully just yet .
 As we learn more , we will look at some more features of protocols
 that highlight why the Swift language itself is built on that foundation of protocols .
 Until then ,
 what you can do for now , is ,
 to start thinking about
 how we can define the interfaces of our objects as small useful protocols ,
 before we create fully concrete objects .
 */
