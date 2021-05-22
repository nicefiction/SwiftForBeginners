import Foundation


/**
 `2 Overriding Properties`
 INTRO —Our new `subclass` has different default values
 for some of the `stored properties` in it .
 In this video ,
 let's look at
 how we can `override properties`
 to further customise our `subclasses` .
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
 <Avoiding code duplication> is a good benefit ,
 _but what is the point if SuperEnemy is just identical to Enemy ?_
 Well , thankfully , that is not all `class inheritance` provides ,
 and we can _override_ both `properties` and `methods` on the `superclass`
 to customise `SuperEnemy` .
 It is not however as simple as just adding a new `property` . Here is why ,
 when we _sub-class_ a `superclass` to create a new `class` ,
 we are not just creating a new `class`
 and copying the contents of that `base class` into it ,
 we create an `inheritance chain` so to speak :
 
 `Superclass <- Subclass`
 
 When we create an `instance of Enemy` ,
 we pass in some `value`
 to assign to its `stored properties` .
 When we create an `instance of SuperEnemy` however ,
 because it is connected to `Enemy` through its `inheritance chain` ,
 we need to make sure that _Enemy's properties_
 is given some `initial values` as well .
 And this is
 because when we create an `instance of SuperEnemy` ,
 because it is connected to `Enemy` ,
 we are also creating an `instance of Enemy` under the hood .
 There is an order to how we create the subclasses .
 And it can be confusing ,
 so we will try and keep it simple :
 
 (`1`) If a `subclass` has properties of its own
 that the `superclass` does not have ,
 we need to first provide the `subclass` with `initial values` .
 
 (`2`) Once the `subclass` has `initial values`,
 then we need to provide values
 for the `properties`
 in the `base class`
 if they don't have `default values` .
 
 So ,
 once we give `initial values`
 to any of the new `properties` in `SuperEnemy` ,
 we need to go up the `inheritance chain` , as it is called ,
 and give `values` to all the `stored properties` in `Enemy`
 that don't have `default values` .
 When we created an `instance of SuperEnemy` in the last video , if you remember ,
 it already had this `initialiser method`
 and that is
 because `subclasses` inherit the `initialiser methods` of their `superclasses` .
 So , we can automatically use the `initialiser method` from our `superclass` .
 */

class SuperEnemy: Enemy {

    let hasSuperPower: Bool = true


    override init(x: Int , y: Int) {
        
        // STEP 1 : Provide values for the properties of the subclass first.
        
        // STEP 2 : Prepare the properties of the Superclass after .
        super.init(x : x , y : y)
        // STEP 3 : Modify the properties of the Superclass.
        self.life = 4
    }
}


let superEnemy = SuperEnemy(x : 1 , y : 2)

/**
 We can automatically use the `initialiser method` from our `superclass` .
 When we do this
 we provide `x` and `y` values .
 These `x` and `y` values
 are passed through to the `superclass` ,
 the `Enemy class` in this case
 and used to create an `instance of Point`
 and assign it to the `position property`.
 
 `class Enemy {`
 
    `...`
 
    ` init(x: Int , y: Int) {`
 
        `self.position = Point(x : x , y : y)`
    `}`
 `}`
 
 `NOTE` :
 Remember creating an instance of `SuperEnemy`
 means
 under the hood
 we are creating an `instance of Enemy` .
 */
/**
 `STEP 1` :
 We want to customize the value of the `life property`
 and we can do that
 by writing a new `init() method` for `SuperEnemy` .
 We need to write the `override keyword`
 because otherwise Xcode is going to raise an error :
 
 `class SuperEnemy: Enemy {`
 
    `let hasSuperPower: Bool = true`
 
     STEP 1 :
    `override init(x: Int , y: Int) {`
 
        `super.init(x : x , y : y)`
 
        `self.life = 2`
    `}`
 `}`
 
 This is because the `Enemy superclass`
 has that same `init() method` already .
 And if we wrote the same one ,
 when we went to create an instance
 the compiler wouldn't know which one we are referring to :
 _Do we want to use the initializer method of SuperEnemy_
 _or do we want to use the one of Enemy ?_
 Again remember ,
 we are always creating `Enemy` under the hood .
 What we can do however , is ,
 we can `override` the `init() method` of the `superclass` .
 When we override the `init() method` ,
 we are essentially saying
 we are going to use the` init() method` from the `superclass` .
 We are going to modify the body of the `init() method`
 to do something different .
 
 `NOTE` :
 When you override the `init() method` ,
 you _cannot_ change
 (`A`) the name of the `init() method`,
 (`B`) any arguments
 or (`C`) the return type,
 but you _can_ change the body .
 */
/**
 `STEP 2` :
 Okay , so remember the rules we have established .
 If the `subclass` has any `stored properties`
 in addition to the ones in the `superclass` ,
 we need to provide
 `values` for the `properties` of the `subclass` first .
 Now our `subclass` does have an additional `property` ,

 `let hasSuperPower: Bool = true`
 
 But it already has an `initial value` .
 So we are covered there .
 
 `NOTE` :
 If `hasSuperPower` would not have an `initial value` ,
 we’d have to assign that in the body of the `override init() method` .
*/

 /*
  OLIVIER :
  * When you don't make use of a default property value
  * you can no longer use the override init() method .
  * Instead I have created a simple init() method
  * with a super.init() method inside :
  
 class SuperEnemy: Enemy {
     
     let hasSuperPower: Bool
     
     
     init(x: Int ,
          y: Int ,
          hasSuperPower: Bool) {
         
         // STEP 2 :
         self.hasSuperPower = hasSuperPower
         
         super.init(x : x , y : y)
         
         self.life = 2
         
     }
 }
 */

/**
 `STEP 3` :
 Once the `properties` in the `subclass` have been initialised ,
 then we can focus our attention on prepping the `superclass` :
 
 `class SuperEnemy: Enemy {`
 
    `let hasSuperPower: Bool = true`
 
 
    `override init(x: Int , y: Int) {`
 
         STEP 3 :
        `super.init(x : x , y : y)`
 
        `self.life = 2`
    `}`
 `}`
 
 Our `superclass` has two `properties` ,
 the `life property`
 which already has an initial value ,
 
 `self.life = 2`
 
 and the `position property` ,
 which we can initialize
 using the classes `init() method` .
 Now
 this is just like
 when we create an `instance of Enemy` ,
 because that is all we are doing under the hood here :

 `class Enemy {`
 
    `var life: Int = 2`
    `let position: Point`
 
 
    `init(x: Int , y: Int) {`
 
        `self.position = Point(x : x , y : y)`
    `}`
 
    `...`
 `}`
 
 But instead of writing `Enemy` ,
 to create a new `instance of Enemy`
 inside of a `subclass` — so inside `SuperEnemy` —
 when you want to create an `instance of Enemy` ,
 we write `super.init`
 and then you'll see
 that it brings up the `initialiser method` of `Enemy` .
 And we are just going to pass these arguments through .
 
 `class SuperEnemy: Enemy {`
 
    `...`
 
 
    `override init(x: Int , y: Int) {`
 
         STEP 3 :
        `super.init(x : x , y : y)`
 
        `...`
    `}`
 `}`
 
 Because `Enemy` is a `superclass` of `SuperEnemy` — the `base class` —
 we can refer to it from inside any of the `subclasses`
 by using the `super` keyword .
 Okay , so now both the `superclass` and `subclass`
 are ready and set up for use .
 */
/**
 `STEP 4` :
 Because the `life property` on the `superclass`
 is a `variable property` ,
 
 `class Enemy {`
 
    `var life: Int = 2`
    `let position: Point`
 
    `...`
 `}`
 
 Inside the `override init( ) method` ,
 we can now go ahead
 and change it
 to whatever value we want :
 
 `class SuperEnemy: Enemy {`
 
    `...`
 
 
    `override init(x: Int , y: Int) {`
 
        `super.init(x : x , y : y)`
 
         STEP 4 :
        `self.life = 2`
    `}`
 `}`
 
 `NOTE` :
 `self` refers to `SuperEnemy` .
 Because I am inheriting from `Enemy` ,
 I have access to all of its `properties` and `methods` .
 */
/**
 And now ,
 every time we create an `instance of SuperEnemy` ,
 it is going to follow our rules / steps :
 
 `class SuperEnemy: Enemy {`
 
    `let hasSuperPower: Bool = true`
 
 
    `override init(x: Int , y: Int) {`
 
    // STEP 1 : Provide values for the properties of the subclass first.
 
    // STEP 2 : Prepare the properties of the Superclass after .
        `super.init(x : x , y : y)`
 
    // STEP 3 : Modify the properties of the Superclass .
        `self.life = 2`
    `}`
 `}`
 
 `STEP 1` :
 Use the `override init() method` .
 
 `STEP 2` :
 Assign `values` to any new `properties` in the `subclass` first .
 We already have a `value` assigned to our new `property` ,
 
 `isSuper: Bool = true`
 
 `STEP 3` :
 Our `SuperEnemy class` is set up for use now .
 This means that our second step is
 to focus on getting `Enemy` set up
 since it is the `superclass` .
 We will use `Enemy's init( ) method`
 and pass in the `values` .
 Because we are inside `SuperEnemy` at this point
 we have to say `super.init()` .
 Once that is done ,
 both the `subclass` and `superclass` are ready for use ,
 and now we can just do whatever we want ( `STEP 4` ) .
 
 `STEP 4` :
 We modify the `life property` of the `Enemy superclass` .
 */
