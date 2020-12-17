import Foundation

/**
 `4 Associated Enums`
 INTRO — Not only can enums create instances with specific member values ,
 we can also associate data or information with a particular member .
 In this video , let’s take a look at
 how we can create enums with associated values .
 */
/**
 Enums are pretty cool and in fact they are probably one of my favourite features of Swift .
 But it gets better .
 Let's look at another example .
 In the past we have worked with the UIColor object .
 This is an object in the UI framework that is part of the iOS SDK .
 Now UIColor is cool , but it is an objective C object under the hood
 and I'd like to write a wrapper object that is a bit more Swift like .
 A wrapper object is something that provides a simpler interface to use
 and does a lot of the work in the inner workings of the object .
 You'll see what this means in just a bit .
 Let’s create an enum ColorComponent :
 */

enum ColorComponent {
    case rgb , hsb
}

/**
 Okay , now we have a neat Swift type
 that encapsulates a simple notion of a color object in iOS .
 `NOTE` : There are several ways to represent color in the iOS SDK .
 But for the sake of this example , let's look at two of the main ways ,
 using the RGB color space and the HSB color space .
 RGB stands for Red , Green , and Blue ,
 HSB is Hue , Saturation , and Brightness .
 */
/**
 The goal now is to try and use these enum instances to create a UIColor instance .
 There is an issue , however .
 To make a UIColor object with RGB values ,
 we need to provide red , green , and blue values .
 We need to provide certain arguments .
 This is where enums with associated values come into play .
 In Swift ,
 an enumeration member ,
 so not the actual enum ,
 but each member
 can store associated values of other types
 along with this member value .
 Basically this gives us a way to store custom information for each enum case
 every time we create a new value :
 */

enum ColorComponent2 {
    case rgb(Float , Float , Float , Float)
    case hsb(Float , Float , Float , Float)
}

/**
 When creating a UIçolor object using RGB components ,
 we need to provide four values for red , green , blue , and alpha respectively .
 Now when we create an enum value with the rgb member ,
 we can associate four different values of type Float with it  :
 */

let rgb = ColorComponent2.rgb(100.0 , 100.0 , 100.0 , 1.0)

/**
 We can create an instance of ColorComponent
 containing a rgb member that has some associated information .
 */
/**
 `NOTE` :
 It is important to note that enumerations with associated values like this
 can contain any kind of information .
 We can associate a value of any type
 with any enum member ,
 and this allows us to do some really useful things .
 Apple provides an example in their Swift book of an enum with associated values that models barcodes :
 */

enum Barcode {
    case upc(Int , Int , Int , Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8 , 85909 , 51226 , 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

/**
 There are two kinds of barcodes ,
 standard ones that take four sets of digits
 and a qrCode that contains an embedded string .
 Even though both members are of type Barcode , as you can see here ,
 they can contain different associated values .
 */
