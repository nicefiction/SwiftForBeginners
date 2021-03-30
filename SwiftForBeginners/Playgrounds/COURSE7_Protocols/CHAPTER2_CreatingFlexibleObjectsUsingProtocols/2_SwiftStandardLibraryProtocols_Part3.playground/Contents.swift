import Foundation


/**
 `2 Swift's Standard Library Protocols`PART 3 OF 6

 
 `1. CAN DO protocols`
 First up we got the `Can do` protocols .
 These describe things that the type can do
 or have done to it .
 They also end in the `-able` syntax
 which makes them easy to spot as you are browsing through the headers .
 Here is an example :
 
 `Hashable` ,
 `Equatable` ,
 `Comparable` ,
 
 These protocols describe operations that you can perform on the type .
 There is also a small sub set of protocols in this `can do` group
 that have to do with alternate views or alternate representations :
 
 `RawRepresentable` ,
 `CustomPlaygroundQuickLookable`
 
 `NOTE`
 `CustomPlaygroundQuickLookable` means
 that your type can be quick looked from a playground .
 And that means that , again , your type is the same ,
 you are not really converting it to something else ,
 but you are providing an alternate view for your value .
 In this case , it is something that you can display in a quick look .
 
 So we have got _Operations_ ,
 we have got _Alternate Views_ .
 What is the lesson that we can take ?
 If you had an operation on your own types ,
 say you were writing the next Instagram Killer photo filtering App ,
 then you could add something like a `Filterable` protocol
 
 `Filterable -> Image -> filtered image`
 
 that you can then have your photo instances , your images , conform to .
 Then say ,
 your filtering app becomes a hit , it really takes off ,
 you wanna expand to videos too .
 And videos are just another form of media .
 You could in theory also apply your `Filterable` protocol to
 videos , audio , 3D photos , whatever happens to come up in the future .
 
 `Filterable -> Image -> filtered image`
 `Filterable -> Video -> filtered video`
 `Filterable -> Audio -> filtered audio`
 
 _And what about an example of Alternate Views ?_
 There is always creating thumbnails from large photos ,
 which you can think of as an alternate view for the full-sized photo .
 Again , this isn't actually a conversion , it is just an alternate representation .
 So , you could imagine something like a `Thumbnailable` protocol
 — hopefully you'll come up with a better name — ,
 */

protocol Thumbnailable {
    
    func thumbnailRepresentation() -> Self
}

 /**
 and maybe the audio version of a thumbnail .
 A thumbnail is like a low bit rate version of the audio , or something like that .
 The basic idea here , is ,
 
 `Filterable -> Can have a filter applied to it .`
 `Thumbnailable -> Has an alternate thumbnail view .`
 
 to take these common operations that are in your app and in your code ,
 and protocolize them — if that is a word .
 Why would you want to do this ?
 One benefit is to make the concept reusable .
 You have several types that have some common operation that you need to apply ,
 and now they can share a guaranteed common interface .
 You can get the benefits of polymorphism ,
 even in your structs and your enumerations .
 Also , having this kind of compositional approach
 helps you to separate the thing from its operations .
 I am sure opinions can go either way here ,
 but I like the idea of building up a type from smaller pieces like this ,
 based on what they can do .
 */
/**
 👉 Continues in PART 4
 */
