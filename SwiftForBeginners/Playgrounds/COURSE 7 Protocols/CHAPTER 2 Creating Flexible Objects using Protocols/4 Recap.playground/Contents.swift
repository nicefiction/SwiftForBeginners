import Foundation


/**
 `5 Recap`
 INTRO —Yay ! We are done !
 Let's take a high level look at what we learned in this course .
 */
/**
 A protocol defines a blueprint of
 methods ,
 properties ,
 and other requirements that suit a particular task , or a piece of functionality .
 Protocols are useful for one main reason ,
 they allow us to encapsulate common behaviour
 without having to resort to an inheritance structure .
 A good way to distinguish when you need to use a protocol , is ,
 to identify whether the relationship is an `is a` or a `has a` relationship .
 A car `is a` type of vehicle ,
 so inheritance is most appropriate here , and car inherits from vehicle .
 However , a bird has the ability to fly , much like an airplane does . So in this case ,
 we can factor out this common behaviour and represent it through a protocol .
 
 ⚠️
 In Swift, protocols are _fully fledged types_ , meaning
 that we can specify a protocol wherever we typically specify a type .
 That is , the type of
 a stored property , constant , variable ,
 function parameter ,
 and even return type .
 
 Protocols are even more powerful in Swift .
 They can inherit from multiple other protocols .
 We can use this behaviour
 to build successively more complex protocols
 to specify certain attributes or behaviour .
 In doing this we have learned a lot so far ,
 using protocols — or _interfaces_ — are
 one of the more intermediate features of software development .
 So with this knowledge ,
 you can start building more complex object graphs
 and eventually apps with much cooler features .
 */
/**
 EPILOGUE — Gotcha :
 */

protocol IsAHuman {
    
    var name: String { get set }
}


protocol IsAPlant {
    
    var hasLeaves: Bool { get }
}


struct Human: IsAHuman {
    
    // let name: String // ERROR : Type 'Human' does not conform to protocol 'IsAHuman' . OLIVIER : When a protocol requirement is both gettable and settable , you could only have a variable .
    var name: String
}


struct Plant: IsAPlant {
    // var hasLeaves: Bool // OLIVIER : This works as well . So , with a gettable only requirement , you could end up with either a constant or a variable .
    let hasLeaves: Bool
}
