import Foundation


/**
 `3 Why Are Protocols Useful ?`
 INTRO — Typically , when we want to share behaviour
 among a closely related group of objects ,
 we use inheritance .
 This isn't always the right tool for the job though
 and in this video
 we take a look at a situation
 where an inheritance hierarchy can be limiting .
 */
/**
 We now know the basic syntax of protocols ,
 _but why are they useful ?_
 Let's take a look at a scenario .
 We are going to define an employee database for a particular company .
 So what could the employee class look like ?
 I'm going to define an enum `EmployeeType` :
 */

enum EmployeeType {
    
    case managers , traditional
}

/**
 This isn't necessary , but it'll make our example a bit cleaner .
 And then our `Employee` class is going to define
 some basic properties , some basic attributes about an employee :
 */

/*
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
}
 */

/**
 We are going to use this software to pay our employees .
 So we need to implement a method to calculate a particular employee's wages .
 Now here is where things can start to get hairy .
 In most companies , there are different types of employees .
 Let's assume , in our example , we have two types ,
 hourly employees and salaried employees .
 _How would we model this ?_
 Now since hourly and salaried employees both have a lot of information in common ,
 information that we have already modelled in the `Employee` class ,
 we can create two classes , `HourlyEmployee` and `SalariedEmployee` ,
 that are subclasses of the `Employee` class :
 */

/*
class HourlyEmployee: Employee {
    
    var hourlyWage: Double = 15.00
    var hoursWorked: Double = 0.00
    let vacation: Double = 0.00
}
 */


class SalariedEmployee: Employee {
    
    var salary: Double = 25000.00
    var benefits: Double = 1000.00
    var deductions: Double = 0.00
    var vacation: Double = 2.00
}

/**
 `NOTE` : To make this example easier and not have to define initialisers ,
 we'll just give these default values .
 Let's make another assumption about this software while we are at it .
 Payroll is handled by a separate component in this app .
 When calculating the pay for a particular employee ,
 a `pay()` method is called on an instance of an `Employee` class .
 We don't have a payroll app modelled , of course .
 But we can assume it would look something like this :
 
 `func pay(employee: Employee) {`
 
    `employee.pay()`
 `}`
 
 We are going to issue a paycheck by calling a `pay()` method on each of these employees .
 Every time we call `pay()` , regardless of whether it was a salaried employee or hourly ,
 we expect a certain result back .
 We also need to guarantee that our subclasses contain this `pay()` method that returns this information .
 And that both of them return the same type .
 Because we just want to call `pay()` on an `Employee` .
 We don't want to worry about what type of employee this is , and so on .
 _So how do we do this ?_
 One way is ,
 we could define the `pay()` method in the base class , `Employee` ,
 so that both subclasses inherit it .
 Before we implement a `pay()` method in the `Employee` class ,
 let's create a very simple struct to represent a `Paycheck` of sorts :
 */

struct PayCheck {
    
    let base: Double
    let benefits: Double
    let deductions: Double
    let vacation: Double
}

/**
 So now we can go back to `Employee`
 and define a `pay()` method that will return a `Paycheck` every time it is called :
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
    
    
    func pay()
    -> PayCheck {
        
        return PayCheck(base : 0.00 ,
                        benefits : 0.00 ,
                        deductions : 0.00 ,
                        vacation : 0.00)
    }
}

/**
 Unfortunately , in the `Employee` class ,
 we don't have any of the information we need to calculate `pay()` .
 So we just need to return placeholder values for now .
 Now this is already starting to look bad .
 Because we have a method here , `pay()` , that returns incorrect information .
 Well , let's ignore that for now .
 But now , in `pay()` , when we get an `Employee` ,
 so when we call the `pay()` method :
 */

func pay(employee: Employee) {
    
    employee.pay()
}

/**
 Okay , but we still don't have any accurate information , right ?
 If I were to call `pay()` ,
 even if it were an instance of `HourlyEmployee` or `SalariedEmployee` ,
 it would revert to calling `pay()` on the base class — `Employee` , which returns `0` .
 What we need to do , is ,
 go into each subclass
 and then `override` the `pay()` method .
 And use specific information that each class provides to calculate wages .
 So for example , I can `override pay()` in `HourlyEmployee` :
 */

class HourlyEmployee: Employee {
    
    var hourlyWage: Double = 15.00
    var hoursWorked: Double = 0.00
    let vacation: Double = 0.00
    
    
    override func pay()
    -> PayCheck {
        
        let base = hourlyWage * hoursWorked
        
        return PayCheck(base : base ,
                        benefits : 0.00,
                        deductions : 0.00,
                        vacation : 0.00)
    }
}

/**
 Let's not worry about `SalariedEmployee` just yet . But let's look into the future :
 The company has grown and hourly employees are further broken down
 into two categories : part-time and full-time .
 Now we have to `override` the `pay()` method again in each of these subclasses .
 And make sure we are doing the right thing .
 This is far from the ideal solution .
 By requiring us to `override` a method to implement the correct functionality ,
 we have made room for some bad bugs :
 What if I forget to `override` the `pay()` method in the `HourlyEmployee` class ?
 If I call `pay()` on an instance , the method in the parent class is executed .
 And this returns useless values . For example ,
 let's assume that I'd forgotten here to implement a `pay()` method
 for the `SalariedEmployee` .
 And if I passed in an instance of the `SalariedEmployee` to the `pay()` function ,
 I'm going to get a paycheck of `0` .
 If this were a real app and this bug goes unnoticed ,
 because we are not doing anything wrong that the compiler can identify and tell us ,
 we are going to send out a paycheck of $ 0 to all our hourly employees .
 This is where some facets of inheritance start to breakdown .
 In that they are not ideal for all use cases .
 Yes , these classes are related in that they are all employees and we reuse code
 and encapsulate data here by using inheritance .
 But not all aspects of the classes are related .
 Mind you ,
 I am not saying that inheritance is bad .
 It just doesn't work here .
 It may not be the right tool for this job , specifically .
 Protocols , though , offer a different kind of solution .
 */
