import Foundation


/**
 `2 Swift's Standard Library Protocols`PART 6 OF 6

 
 `GREG 2 of 3 : Four broad patterns`
 So we have seen three kinds of protocols
 from the Standard Library
 having to do with capability , identity , and conversion .
 What are the broad patterns that we can think about
 that we have seen from our own code ?
 We have got four of them :

 `2.1 CAN DO : Operations` [15:30]
 If there are a common set of operations
 that you have to perform on your types ,
 consider breaking these out into a protocol .
 Related to that was Alternate views ...
 
 `2.2 CAN DO : Alternate views`
 ... if your type has an alternate view ,
 or an alternate representation
 that is not quite a full on conversion ,
 think about whether it belongs as a common protocol .
 
 `2.3 IS A : Identity`
 For identity ,
 this is your chance to have something like
 multiple inheritance , or mix-ins in your types .
 Thinking about identity and what the types are
 and grouping similar types together with protocols .
 
 `2.4 CAN BE : Conversions`
 Finally we have conversions ,
 whether you convert _from_ a type , or _to_ a type ,
 if that particular conversion is happening a lot in your code
 consider breaking that very common conversion out as a protocol
 to help you keep track of things ,
 and to keep the interface consistent .
 */



/**
 `GREG 3 of 3 : Closing notes`
 Seeing how much Apple has done to move common functionality ,
 things like `map` , `filter` , the enumeration methods , into protocols
 using just plain old protocols
 and also protocol extensions ,
 is a really great example and an inspiration on how powerful the future can be .
 Apple is following this example .
 If you look at the definition of `Array` , for example , it conforms to eight protocols ,
 `String` conforms to 12 protocols , and so on .
 So the idea here is
 that you are creating these feature bundles in protocols ,
 and then you can just use them from all over your code base .
 I think thinking about your types in this way
 can help you keep things straight and categorised in your head.
 So , I definitely encourage you to try this out in your own code .
 Look at your types through the lens of what they have in common using protocols .
 And that is all I have got . Protocols forever , thank you !
 */
