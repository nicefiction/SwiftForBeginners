import Foundation


/**
 `5 Protocols as Types`
 INTRO — On the flip side ,
 we can have loosely related objects
 that share some functionality in common .
 In this video ,
 we'll take a look at how Swift protocols are
 fully fledged types
 and can be used to solve such a problem .
 */
/**
 There are cases where we can have objects that have very loose relationships .
 That is , the objects are not directly related to one another
 but they have an attribute or behaviour in common .
 So let's take a look at another example .
 Let's say we are creating an app
 that allows users to input all the ingredients they have in their kitchen .
 They can then ask for a specific type of food ,
 let's say desserts ,
 and the app then provides a recipe
 that maximises the number of ingredients
 that can be used .
 This , of course , is a complex object graph .
 So let's simplify it quite a bit for the sake of the example :
*/

class Dairy {
    
    var name: String
    
    
    init(name: String) {
        
        self.name = name
    }
}


class Cheese: Dairy {}
// class Milk: Dairy {}


// class Fruit {
//
//     var name: String
//
//
//     init(name: String) {
//
//         self.name = name
//     }
// }

/**
 In this example , I want to make a smoothie .
 We are going to write out a `makeSmoothie()` function
 that takes a list of ingredients .
 Well , foods are quite diverse .
 And not everything in our fridge is a good candidate for a smoothie .
 So how do we model this ?
 We can't implement a method in a base class , like `Dairy` for example ,
 because that doesn't make sense . Sure, milk can go in a smoothie ,
 but cheddar cheese ? Absolutely not .
 Also , we have a wide range of foods modelled that are not related to one another .
 Milk is a dairy product , for example , but a fruit ,
 — and most fruits can be put in smoothies —
 but fruit isn't a dairy product .
 So both can go in a smoothie
 but both are represented by different classes .
 Protocols can help us model these loose relationships .
 Let's define a protocol called `BlendAble` :
 */

protocol BlendAble {
    
    func blend()
}

/**
 The `Blendable` protocol requires the `blend( )` method to be implemented .
 Let's adopt this protocol for every class that can be blended :
 */

class Fruit: BlendAble {
    
    var name: String
    
    
    init(name: String) {
        
        self.name = name
    }
    
    
    func blend() {
        
        print("Blend me to mush .")
    }
}

/**
 From the remaining classes ,
 not all dairy products can be blended ,
 so we are not going to make `Dairy` Blendable ,
 but `Milk` , for sure :
 */

class Milk: Dairy ,
            BlendAble {
    
    func blend() {
        
        print("Blend me creamy .")
    }
}

/**
 Okay ,
 now that we have these different food components
 that conform to the `BlendAble` protocol ,
 we can define a `makeSmoothie( )` function :
 */

func makeSmoothie(with ingredients: [BlendAble]) {
    
    for ingredient in ingredients {
        ingredient.blend()
    }
}

/**
 There is something really interesting going on here .
 `Any protocol we create in Swift`
 `becomes a fully fledged type that we can use .`
 Because it is a type ,
 we can use protocols in many places
 where other types are allowed :
 
 ( 1 ) As the type of a parameter type ,
 or a return type in a function ,
 method ,
 or initializer .
 
 ( 2 ) As the type of a constant ,
 variable ,
 or property .
 
 ( 3 ) And as the type of items in a collection :
 an Array ,
 Dictionary ,
 or any other container .
 
 Take a look at the parameter for a `makeSmoothie()` function :
 
 `func makeSmoothie(with ingredients: [BlendAble]) { ... }`
 
 We are specifying
 that the ingredients parameter
 has to be an array
 that contains any type
 that conforms to BlendAble .
 _So how does this work ?_
 Let's create three instances of foods :
 */

let strawberry = Fruit(name : "Strawberry")
let cheddar = Cheese(name : "Cheddar")
let vanillaMilk = Milk(name : "Vanilla milk")

/**
 We have three foods here
 and we want to create a list of ingredients for our smoothie :
 */

let blendableIngredients: [BlendAble] = [
    strawberry , vanillaMilk
]

/**
 Now we can use the `makeSmoothie( )` function
 with the ingredients that we just created :
 */

makeSmoothie(with : blendableIngredients)

/**
 Everything works , and we have a smoothie .
 What happens if we add cheddar cheese to the recipe ? :
 */

/*
let blendableIngredients2: [BlendAble] = [
    strawberry , vanillaMilk , cheddar
] // ERROR : Cannot convert value of type 'Cheese' to expected element type 'BlendAble' .
 */

/**
 We get a compiler error .
 `Cheese` does not conform to the `BlendAble` protocol .
 And therefore , does not make for a valid ingredient .
 `Milk` and `Cheese` are related through `Dairy` ,
 
 `class Cheese: Dairy {}`
 `class Milk: Dairy , Blendable {}`
 
 but they don't share the same behaviour . That is ,
 `Cheese` cannot be blended while `Milk` can .
 Whereas `strawberry`
 — which is an instance of `Fruit` ,
 
 `let strawberry = Fruit(name : "Strawberry")`
 
 and not at all related to `Milk` —
 can also be blended .
 The protocol helps us to establish these loose types of relationships .
 By checking for `protocol conformance` ,
 we can ensure that despite not being of a single particular type ,
 they satisfy the constraints needed for our function .
 This was a very simple example , of course ,
 and not at all how we would model such an object graph .
 
 `NOTE` :
 Now an interesting thing to note here , is ,
 that we have specifically annotated the `blendableIngredients` constant
 as having a type of an array of `BlendAble` types :
 
 `let blendableIngredients: [BlendAble] = [`
    `strawberry , vanillaMilk`
 `]`
 
 We need to do this . This is not optional here
 because without the annotation ,
 we have an array of mixed types :
 */

/*
 let blendableIngredients3 = [
    strawberry , vanillaMilk
 ] // ERROR : Heterogeneous collection literal could only be inferred to '[Any]'; add explicit type annotation if this is intentional .
 */

/**
 Right now , the compiler doesn't know what type of array we are trying to create .
 Is this an array of `Fruit` ? No , `vanillaMilk` is in there .
 Is it an array of `Milk` ? Well , no , `strawberry` is in there .
 But by specifying `BlendAble` ,
 we are saying that we want to create an array
 that only allows types that conform to `BlendAble` ,
 which does include both of these — `vanillaMilk` and `strawberry` .
 By doing this , we lose certain advantages ,
 we don't know anything about the items in the array
 other than the fact that they implement the `blend()` method .
 So , for example ,
 in the `makeSmoothie()` function ,
 
 `func makeSmoothie(with ingredients: [BlendAble]) { ... }`
 
 you’ll see that these ingredients
 are passed through as `BlendAble` types .
 That means that inside the function ,
 we have access to the `blend()` function ,
 but we also know that both of these classes
 — both `Dairy` and `Milk` — have a `name` property :
 
 `class Dairy {`
 
 `var name: String`
 
 
    `init(name: String) {`
     
        `self.name = name`
    `}`
 `}`
 
 
 `class Milk: Dairy ,`
             `BlendAble {`
     
     `func blend() {`
         
         `print("Blend me creamy .")`
     `}`
 `}`
 
 
 `class Fruit: BlendAble {`
     
     var name: String
     
     
     init(name: String) {
 
         self.name = name
     }
     
 
     func blend() {
         
         print("Blend me to mush .")
     }
 `}`
 
 But inside the `makeSmoothie( )` function ,
 
 `func makeSmoothie(with ingredients: [BlendAble]) {`
        
        for ingredient in ingredients {
 
            ingredient.blend()
        }
 `}`
 
 we don't have access to the `name` property
 because we lose information about the type
 by specifying it as this higher `BlendAble` protocol type
 rather than the actual class .
 */
 


/**
 Protocols are a very useful tool in modelling relationships in our objects ,
 and leads to code that isn't as tightly coupled .
 But protocols are even more powerful than the examples we looked at .
 In fact , the designers of Swift call it
 a `Protocol Oriented Programming language` . 
 */
