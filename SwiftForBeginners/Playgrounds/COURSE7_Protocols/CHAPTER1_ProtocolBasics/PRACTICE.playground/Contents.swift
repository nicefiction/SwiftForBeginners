import Foundation


protocol FullNameAble {
    
    var fullName: String { get }
}



struct Human: FullNameAble {
    
    var fullName: String
}



struct Friend: FullNameAble {

    let firstName: String
    let middleName: String
    let lastName: String

    var fullName: String {

        return "\(firstName) \(middleName) \(lastName)"
    }
}



class A {
    
    var firstName: String
    var lastName: String
    var fullName: String
    
    
    init(firstName: String ,
         lastName: String ,
         fullName: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = fullName
    }
}


class B: A {
    
    var middleName: String {
        
        return "\(firstName) \(lastName)"
    }
    
//    init(firstName: String ,
//         lastName: String ,
//         fullName: String ,
//         middleName: String) {
//
//        self.middleName = middleName
//
//        super.init(firstName : firstName ,
//                   lastName : lastName ,
//                   fullName : fullName)
//    }
}


let b = B(firstName : "Dorothy" ,
          lastName : "Gale" ,
          fullName : "Dorothy Gale")



protocol BlendAble {
    
    var name: String { get }
    func blend()
}


struct Fruit: BlendAble {
    
    let name: String
    
    
    func blend() { print("Blending the fruit .") }
}


struct Milk: BlendAble {
    
    let name: String
    
    
    func blend() { print("Blending the milk .") }
}


let strawberry = Fruit(name: "strawberry")
let oatMilk = Milk(name: "oat milk")


let blendableIngredients: [BlendAble] = [
    
    strawberry , oatMilk
]


for ingredient in blendableIngredients {
    
    ingredient.blend()
    print("Blending the \(ingredient.name)")
}
