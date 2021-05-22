import Foundation


/**
 `4 Modeling Behavior With Protocols`
 INTRO —Protocols can be used to model object relationships
 in situations where inheritance is too rigid or just not right for the job .
 In this video ,
 we look at a trivial example of an employee payroll app
 and how we can use protocols to simplify functionality and behaviour .
 */
/**
 Every subclass of `Employee` needs to have a `pay()` method .
 This method also has to have a very specific return value .
 We need to centrally enforce this design
 and we can do that using a protocol .
 Let's define the protocol with a single instance method requirement :
 */

enum EmployeeType {
    
    case managers , traditional
}


struct PayCheck {
    
    let base: Double
    let benefits: Double
    let deductions: Double
    let vacation: Double
}


protocol PayAble {
    
    func pay() -> PayCheck
}

/**
 Earlier , when we define our `FullNameAble` protocol ,
 we specified that conforming types were required
 to implement a stored property .
 With protocols , we can require specific methods be implemented
 by conforming types as well .
 Now we can get rid of the `pay()` method in our `Employee` base class :
 */

class Employee {
    
    let name: String
    let address: String
    let startDate: Date
    let type: EmployeeType
    
    
    init(name: String ,
         address: String ,
         startDate: Date ,
         type: EmployeeType) {
        
        self.name      = name
        self.address   = address
        self.startDate = startDate
        self.type      = type
    }
    
    
//    func pay()
//    -> PayCheck {
//
//        return PayCheck( base : 0.00 ,
//                         benefits : 0.00 ,
//                         deductions : 0.00 ,
//                         vacation : 0.00 )
//    }
}

/**
 Since `Employee` has no information to calculate `pay()` ,
 we have a better encapsulation of data and behaviour without that particular method .
 It doesn't really serve a purpose in there . Getting rid of this method introduces errors :
 */

/*
class HourlyEmployee: Employee {
    
    var hourlyWage: Double = 15.00
    var hoursWorked: Double = 0.00
    let vacation: Double = 0.00
    
    
    override func pay() // ERROR : Method does not override any method from its superclass .
    -> PayCheck {
        
        let base = hourlyWage * hoursWorked
        
        return PayCheck( base : base ,
                         benefits : 0.00 ,
                         deductions : 0.00 ,
                         vacation : 0.00 )
    }
}
 */

/**
 And that is
 because now ,
 in `HourlyEmployee` .
 We are not `overriding` a method from our superclass .
 So let's get rid of this entire `pay() method :
 */

class HourlyEmployee: Employee ,
                      PayAble {
    
    var hourlyWage: Double = 15.00
    var hoursWorked: Double = 0.00
    let vacation: Double = 0.00
    
    
//    override func pay()
//    -> PayCheck {
//
//        let base = hourlyWage * hoursWorked
//
//        return PayCheck( base : base ,
//                         benefits : 0.00 ,
//                         deductions : 0.00 ,
//                         vacation : 0.00 )
//    }
    
    
    func pay() -> PayCheck {
        let base = hourlyWage * hoursWorked
        
        return PayCheck( base : base ,
                         benefits : 0.00 ,
                         deductions : 0.00 ,
                         vacation : 0.00 )
    }
}

/**
 Now , to ensure that our classes always implement the `pay()` method .
 All we need to do , is ,
 _conform_ to the `Payable` protocol :
 
 `class HourlyEmployee: Employee ,`
                       `PayAble { ... }`
 
 What about `SalariedEmployee` ? :
 */

class SalariedEmployee: Employee ,
                        PayAble {
    
    var salary: Double = 25000.00
    var benefits: Double = 1000.00
    var deductions: Double = 0.00
    var vacation: Double = 2.00
    
    
    func pay() -> PayCheck {
        
        let monthlySalary = salary / 12
        return PayCheck( base : monthlySalary ,
                         benefits: benefits ,
                         deductions : deductions ,
                         vacation : vacation )
    }
}

/**
 Here — in `SalariedEmployee` —
 we can provide a different implementation of the `pay()` method
 because a protocol states that all you do , is ,
 implement a method .
 The protocol does not care about the body of the method .
 Now we can call `pay()` on either the `SalariedEmployee` or `HourlyEmployee`
 and get an implementation that makes sense for each type .
 Because protocols are fully fledged types
 like a class or struct ,
 we can go and take this one step further .
 We can specify the type of `employee` here , is , `PayAble` :
 */

// func pay(employee: Employee) {
func pay(employee: PayAble) {
    
    employee.pay
}

/**
 this guarantees
 that we can only pass in
 an instance of a class
 that conforms to the `PayAble` protocol .
 This can be a bit tricky to understand at first .
 You were saying that the instance passed in
 as an argument to the `pay()` function ,
 needs to conform to the `PayAble` protocol .
 The instance can be of type `HourlyEmployee` ,
 or it can be of type `SalariedEmployee`
 because both of them conform to the `PayAble` protocol .
 But it also means that it can be any type that we create in the future
 that conforms to the `PayAble` protocol .
 We don't know anything about these types that are passed in ,
 but because the interface
 the blueprint that is exposed to us
 tells us that they implement the `pay()` method ,
 that is all we care about .
 So all we want to do is
 call the `pay()` method on each `employee` ,
 and the `PayAble` protocol exposes that . So ,
 _what do I mean with exposes that ?_
 If I create an instance of `dorothy`
 of the base class `Employee` ,
 and then call the `pay( )` function on the instance ...
 */

let dorothy = Employee(name : "Dorothy" ,
                       address : "Oz" ,
                       startDate : Date() ,
                       type : .traditional)

// pay(employee : dorothy) // ERROR : Argument type 'Employee' does not conform to expected type 'PayAble' .
 
/**
 ... this is not going to work .
 Because `Employee` — the base class —
 does not conform to the `Payable` protocol .
 This way we are guaranteed
 that we will never call `pay()` on a class that does not implement it .
 And because we can do that ,
 we don't have to have a meaningless `pay()` method in the base class
 that provides bogus values .
 Now what if we were to change this from `Employee` to `SalariedEmployee` ? :
 */

let glinda = SalariedEmployee(name : "Glinda" ,
                              address : "Oz" ,
                              startDate: Date() ,
                              type : .traditional)

pay(employee : glinda)

/**
 We can use the same initializer  from `Employee` :
 
 `init(name: String ,`
      `address: String ,`
      `startDate: Date ,`
      `type: EmployeeType) {`

    `self.name      = name`
    `self.address   = address`
    `self.startDate = startDate`
    `self.type      = type`
 `}`
 
 because the `SalariedEmployee` subclass inherits it
 from the `Employee` base class .
 
 `class SalariedEmployee: Employee ,`
                         `PayAble { ... }`
 
 You'll see that now it works .
 So the interesting thing ,
 what I meant by exposed earlier , is ,
 because when we pass in this instance through ,

 `pay(employee : glinda)`
 
 all we know inside the function , is ,
 that `glinda` conforms to `Payable` :
 
 `protocol Payable {`
    `func pay() -> PayCheck`
 `}`
 
 `class SalariedEmployee: Employee ,`
                         `PayAble { ... }`
 
 This means that
 we can only call things
 that are listed in the `PayAble` protocol .
 Now we know that we are passing in a `SalariedEmployee` here :
 
 `let glinda = SalariedEmployee(name : "Glinda" ,`
                               `address : "Oz" ,`
                               `startDate: Date() ,`
                               `type : .traditional)`
 
 And `SalariedEmployee` has a `name` stored property .
 But inside the `pay()` function ,
 if I were to call `employee.name` ,
 */

/*
func pay2(employee: PayAble) {
    
    employee.pay()
    employee.name // ERROR : Value of type 'PayAble' has no member 'name' .
}
 */

/**
 you'll see that the compiler throws an error .
 In the scope of the `pay()` function , `employee.name` does not exist .
 The protocol is a blueprint .
 And this blueprint says
 that all you know about this type , is ,
 that it implements the `pay()` method :
 
 `protocol PayAble {`
 
    `func pay() -> PayCheck`
 `}`
 
 By using protocols ,
 we get the behaviour we desire .
 Without a lot of the tight fragile coupling
 that was achieved by attempting this specific design
 through inheritance .
 This type of structure
 where we _designed a class through protocol conformance_
 rather than inheritance
 is called `composition` .
 Composition is an extremely powerful tool
 that helps build encapsulated ,
 loosely coupled models
 and code bases .
 
 
 So this was point number one as to why protocols are useful :
 When we have a set of closely related classes
 that implement methods which define similar behaviour
 but have different implementations
 protocols lead to better code than inheritance .
 So let me repeat that again :
 
 When we have a set of closely related classes
 — as these two `HourlyEmployee` and `SalariedEmployee` classes are —
 that implements methods which define similar behaviour
 — which in our case is the `pay()` method — ,
 but end up having different implementations ,
 protocols lead to better code .
 — Because then we do not have to define
 some placeholder type in the base class `Employee`
 to get to work .
 */


print("Debug")
