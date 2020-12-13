import UIKit

/**
 `5 Methods on Enumerations`
 INTRO —Enums are sort of like other objects in Swift .
 Like classes and structs
 we can add instance methods to an enum
 but unlike classes and structs ,
 enums can’t have stored properties .
 In this video ,
 let’s add a method to return a UIColor object using the components we select .
 */
/**
 We now have inner members that can store associated information .
 But how can we use that information ?
 Remember , how we said enums are sort of like objects ?
 That is because enums have some of the functionality that classes and structs do . For example ,
 we can add instance methods to an enum which is a very object like trait .
 But we can't add storage properties .
 `NOTE` : Even though an enum is not really an object , in that we don't create instances ,
 we simply have enum values ,
 like an object
 it can also have instance methods :
 */

enum ColorComponent {
    case rgb(CGFloat , CGFloat , CGFloat , CGFloat)
    case hsb(CGFloat , CGFloat , CGFloat , CGFloat)
    
    
    func color()
    -> UIColor {
        switch self {
        case .rgb(let red ,
                  let green ,
                  let blue ,
                  let alpha) : return UIColor(red : red/255.0 ,
                                              green : green/255.0 ,
                                              blue : blue/255.0 ,
                                              alpha : alpha)
        case.hsb(let hue ,
                 let saturation ,
                 let brightness ,
                 let alpha) : return UIColor(hue : hue/100.0,
                                             saturation : saturation/100.0,
                                             brightness : brightness/100.0,
                                             alpha : alpha)
        }
    }
}

/**
 The original goal with this enum is
 to easily retrieve a UIColor object instance
 without having to go through the cumbersome initializer methods .
 */

let colorRGB = ColorComponent.rgb(100.0 , 100.0 , 50.0 , 1.0)
colorRGB.color()

/**
 The color( ) method is going to return a UIColor instance .
 For that you need access to the UIKit framework in iOS which contains that UIColor object .
 Since UIColor has a different initializer
 depending on
 if we have RGB components , or HSB ,
 we need to use the correct method depending on what enum value we are working with .
 Typically we create an instance of an enum , or an enum value ,
 assign it to a constant or a variable .
 And then if we want to do some work with it , we switch on the enum value .
 Inside the switch statement ,
 we can define specific cases or logic for each enum member .
 And then determine the code we want to execute .
 We can switch ,
 but we don't have an instance or a new value to switch on .
 In classes and structs ,
 when we want to refer to an instance of the object from within the object , we use the keyword self .
 To refer to an enum value inside the enum, we use
 self .
 */
// switch self { ... }
/**
 So , rather than switching on , say , some instance or a value , we'll do switch self . This way ,
 when we create a new value of an enum and call the color( ) method ,
 the switch statement switches on that value that called the method .
 Because we are in an instance method , which is called when a value is created ,
 at this point our enum members have associated values stored ,
 and we can access these values by assigning them to constants :
 */
// case .rgb(let red, let green, let blue, let alpha)
/**
 I can create local constants for each of these associated values .
 I want that first value to be assigned to a constant color red ,
 the second one to green , then blue , and alpha .
 Since we have the rgb component values ,
 we can call the right initializer method on this UIColor object :
 */
/*
 return UIColor(red : red/255.0 ,
                green : green/255.0 ,
                blue : blue/255.0 ,
                alpha : alpha)
 */
/**
 `NOTE` : The initializer excepts a value between zero and one .
 So I need to divide each of these values by 255.0 .
 */
/**
 Remember ,
 switch statements for enum cases need to be exhaustive ,
 so we need to add a case for the HSB member as well :
 */
// case.hsb(let hue , let saturation , let brightness , let alpha)
/**
 UIcolor also has a special initializer method ,
 that accepts hue , saturation , brightness , and alpha values to create a color object :
 */
/*
 return UIColor(hue : hue/360.0 ,
                saturation : saturation/360.0 ,
                brightness : brightness/360.0 ,
                alpha : alpha)
 */
/**
 And so we can use that initializer method along with our associated values
 to create another color object .
 */
/**
 UIColor accepts , in this initializer, values of types CGFloat .
 CGFloat is a type from the core graphics framework of iOS .
 Because the UIColor object accepts values of type CGFloat ,
 I'm just going to make these CGFloat values as well :
 */
// case hsb(CGFloat, CGFloat, CGFloat, CGFloat)
/**
 Okay , earlier we created a value of color component , an RGB value ,
 and we pass it through some floating point values for its associated values :
 */
// let colorRGB = ColorComponent.rgb(100.0 , 100.0 , 50.0 , 1.0)
/**
 Now if we chain a method and call an instance method of color( ) , ...
 */
// colorRGB.color()
/**
 ... you’ll see in the results area that we have a color object ,
 pretty awesome , right ?
 We have abstracted away the work of dividing by 255.0 in the initializer
 when we write the code
 and we have even taken away the worry about using the correct initializer .
 All we have to worry about , is ,
 selecting the right type of color component and passing those values through .
 */
/**
 Now we can make some improvements to our code though :
 */
// case rgb(CGFloat , CGFloat , CGFloat , CGFloat)
/**
 If you think of this as a tuple containing four values ,
 this works the same way as when we returned multiple values from a function .
 We can either simply specify the number and type of the values we accept in this tuple .
 Or we can assign it names :
 */
enum ColorComponent2 {
    case rgb(red: CGFloat ,
             green: CGFloat ,
             blue: CGFloat ,
             alpha: CGFloat)
    case hsb(hue: CGFloat ,
             saturation: CGFloat ,
             brightness: CGFloat ,
             alpha: CGFloat)

    
    func color()
    -> UIColor {
        
        switch self {
        case .rgb(let _red ,
                  let _green ,
                  let _blue ,
                  let _alpha) : return UIColor(red : _red/255.0 ,
                                               green : _green/255.0 ,
                                               blue : _blue/255.0 ,
                                               alpha : _alpha)
        case.hsb(let _hue,
                 let _saturation,
                 let _brightness,
                 let _alpha) : return UIColor(hue : _hue/360.0 ,
                                              saturation : _saturation/100.0 ,
                                              brightness : _brightness/100.0 ,
                                              alpha : _alpha)
        }
    }
}

let colorRGB2 = ColorComponent2.rgb(red : 100.0 ,
                                    green : 100.0,
                                    blue : 50.0 ,
                                    alpha : 1.0)
colorRGB2.color()


/**
 `NOTE` : Notice that this does not change our code here ...
 */
// func color() -> UIColor { ... }
/**
 ... because we have given them names here ...
 */
// case rgb(red: CGFloat , green: CGFloat , blue: CGFloat , alpha: CGFloat)
/**
 ... that doesn't mean we need to necessarily use those same argument labels when we assign these to local constants .
 We can do whatever there :
 */
enum ColorComponent3 {
    case rgb(red: CGFloat ,
             green: CGFloat ,
             blue: CGFloat ,
             alpha: CGFloat)
    case hsb(hue: CGFloat ,
             saturation: CGFloat ,
             brightness: CGFloat ,
             alpha: CGFloat)
    
    
    func color()
    -> UIColor {
        
        switch self {
//        case .rgb(let red ,
//                  let green ,
//                  let blue ,
//                  let alpha) : return UIColor(red : red/255.0 ,
//                                              green : green/255.0 ,
//                                              blue : blue/255.0 ,
//                                              alpha : alpha)
        case .rgb(red : let red ,
                  green : let green ,
                  blue : let blue ,
                  alpha : let alpha) : return UIColor(red : red/255.0 ,
                                                      green : green/255.0 ,
                                                      blue : blue/255.0 ,
                                                      alpha : alpha)
//        case.hsb(let hue ,
//                 let saturation ,
//                 let brightness ,
//                 let alpha) : return UIColor(hue : hue/100.0,
//                                             saturation : saturation/100.0,
//                                             brightness : brightness/100.0,
//                                             alpha : alpha)
        case.hsb(hue : let hue,
                 saturation : let saturation,
                 brightness : let brightness,
                 alpha : let alpha) : return UIColor(hue : hue/360.0 ,
                                                     saturation : saturation/100.0 ,
                                                     brightness : brightness/100.0 ,
                                                     alpha : alpha)
        }
    }
}

let colorRGB3 = ColorComponent2.rgb(red : 100.0 ,
                                    green : 100.0,
                                    blue : 50.0 ,
                                    alpha : 1.0)
colorRGB3.color()
