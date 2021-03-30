import Foundation


/**
 `2 Swift's Standard Library Protocols`PART 2 OF 6
 
 
 `GREG HEO : WHAT THE 55 SWIFT STANDARD LIBRARY PROTOCOLS THAUGHT ME `
 🔗 https://youtu.be/_kpYI6GjCuw

 `GREG 1 of 3 : Three types of protocols`
 With single inheritance ,
 class hierarchies things are linear :
 */

class Animal {}
    class Feline: Animal {}
        class Jagwyre: Feline {}
        class Liger1: Feline {}
    class Canine: Animal {}
        class Doge1: Canine {}
        class Pug: Canine {}

/**
 You have got parents , child , grandchild , all the way down the family tree .
 And when you go back up the tree ,
 then everything has a single parent .
 That keeps the hierarchy clean.
 However, with single inheritance ,
 ( 1 ) you do lose the benefits that multiple inheritance can offer when used properly .
 ( 2 ) In Swift , there is no inheritance for enumerations and struct types
 — it is class types only .
 That means you sometimes need to twist yourself into a pretzel
 to make sense of your types .
 You can end up with really generic super classes .
 And then many , many levels down ,
 you have a class that you can actually instantiate , and use .
 
 So with protocols ,
 you can make the type system
 a little bit more compositional .
 You can clean up the long chain of inheritance .
 Of course you are going to be trading a long tall chain of inheritance ,
 for a wide chain of protocol conformance .
 But I think the tradeoffs are worth it ,
 and I hope you'll be convinced by the end of this talk .
 What kind of things make sense to put into protocols ?
 I'm not going to talk about cool protocols that I have made .
 But instead I want to take a tour of the protocols that Apple has shipped
 in the Swift Standard Library . We'll take a little tour ,
 maybe you'll learn about some protocols that you haven't heard of before .
 We'll see what big ideas that we can take ,
 and then maybe get some inspiration
 on what kinds of things we can use with protocols in our own code .
 Basically the idea of this talk is
 how does the way the Swift team uses protocols ,
 give us hints on how we can do it ?
 The Swift Standard Library includes 54 actual public protocols .
 My initial jokey pitch for this talk , was ,
 I would go through them one by one , taking 16 seconds each to fill the time ,
 but instead ,
 I have broken them up into three categories :

 ( 1 ) `CAN DO`
 ( 2 ) `IS A`
 ( 3 ) `CAN BE`
 
 We have got the `Can do` protocols ,
 the `Is a` protocols ,
 and then the `Can be` protocols .
 So we'll take them one at a time , see some examples ,
 and then see what lessons that we can take .
 */
/**
 👉 Continues in PART 3
 */
