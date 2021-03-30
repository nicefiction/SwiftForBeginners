import Foundation


/**
 `2 Swift's Standard Library Protocols`PART 5 OF 6

 
 `3. CAN BE protocols` [11:30]
 Finally we have the `Can be` types .
 Rather than just an alternate view of the same thing
 — as we have already seen —
 these are more about straight on conversion .
 Changing from type X
 over to type Y .
 And these ones end in the word `-Convertible` .
 So that means that the type can either be converted from
 or converted to
 something else .
 
 `FloatLiteralConvertible`
 `IntegerLiteralConvertible`
 `ArrayLiteralConvertible`
 `CustomStringConvertible`
 
 So that is Protocols for Convertibility .
 What are some of the lessons we can take from this kind of protocol ,
 other than trying to keep the names of your types short ?
 This one is pretty straightforward .
 If you have types that can become other types ,
 then don't just add a method , a computed property , or initializer .
 Think about setting it up as a protocol .
 Remember , you can use the protocol
 to either specify conversion _to_ , or _from_ your type .
 
 The other required example for any technical talk , aside from the animal one ,
 is the employee database :
 */
 
// class Contractor {}
class Manager {}
class Employee {}
 
 /**
 If you have objects for people ,
 regular employees , managers , contractors ,
 then each of those kinds of people might be a separate type .
 If a `Contractor` can get hired as an `Employee` ,
 or an `Employee` can be promoted to a `Manager` ,
 then that is a kind of a conversion .
 You don't want to reenter
 the person’s name , address , phone number , and social security number , and all of that .
 You want to change a `Contractor` into an `Employee` relatively seamlessly .
 For that you could have something like an `EmployeeConvertible` protocol :
 */

protocol EmployeeConvertible {
    
    func hire() -> Employee
}

/**
 And then , say , the `Contractor` type and the `Interviewee` type could conform to it :
 */

class Contractor: EmployeeConvertible {
    
    func hire()
    -> Employee {
        
        return Employee()
    }
}


class Interviewee: EmployeeConvertible {
    
    func hire()
    -> Employee {
        
        return Employee()
    }
}
 
/**
 Whats the benefit of this though ?
 Why have a protocol ,
 plus a conversion method
 rather than just a method , which seems simpler ?
 Again part of it is the compositional approach .
 
 `Contractor -> Can be an Employee`
 `Interviewee -> Can be an Employee`
 
 The fact that an `Interviewee` can become an `Employee`
 is part of what the type is , but it is not exclusive .
 Other kinds of people can become Employees as well .
 By using a protocol
 you can assure
 that there is a common well defined interface
 for converting some kind of person into an `Employee` :
 
 `EmployeeConvertible ( Can be an Employee ) -> Contractor`
 `EmployeeConvertible ( Can be an Employee ) -> Interviewee`
 
 There is also a nice code as documentation benefit here :
 
 `protocol EmployeeConvertible {`
     
     `func hire() -> Employee`
 `}`
 
 `class Contractor: EmployeeConvertible { ... }`
 `class Interviewee: EmployeeConvertible { ... }`
 
 If you are browsing through your code ,
 or someone else's code in the project
 and you see `EmployeeConvertible`
 and you are already familiar with it ,
 that tells you something right there about what the type can do
 and what some of the interface is like .
 Then you can also grep through your project
 and look for the word `EmployeeConvertible` ,
 and then right there in the search results ,
 that is the list of types that can become employees .

 That is the third type of Standard Library protocol .
 The `Can be` protocol family ,
 handling conversions between your types .
 */
/**
 👉 Continues in PART 6
 */
