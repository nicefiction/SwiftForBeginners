import Foundation


/**
 `5 Conventions and rules`
 INTRO —Now that we know how to use variables and constants ,
 let's look at the names we assign to them .
 While it might seem silly ,
 it is important to name your variables and constants carefully and meaningfully .
 There are a few established rules and conventions to follow
 and in this video we'll go over each one .
 */
/**
 `Disallowed Characters`:
 • Cannot start with a number
 • No whitespace characters
 • No special characters
 • No mathematical symbols
 
 `Naming Conventions`:
 • No whitespace
 • Don’t start with numbers
 • Use camelCase
 
 One of the things students ask most often , after learning this , is ,
 what should I use and when ? Variables or constants ?
 At first glance , it seems like they only have subtle differences .
 But for the most part ,
 they are simply containers for values .
 On the contrary ,
 mutability ,
 that is the concept of data changing out from under you ,
 has extremely important implications in writing code .
 What you want to do is always , and remember I said always ,
 start with a constant first .
 If you realize that you need to change the data being held by the container,
 well then you can simply switch to using a variable .
 In fact this is one of those things that Xcode loosely enforces .
 When you write code ,
 if you use `var` ,
 but don't end up changing the contents of the variable ,
 Xcode will suggest that you change it to a constant .
 */
