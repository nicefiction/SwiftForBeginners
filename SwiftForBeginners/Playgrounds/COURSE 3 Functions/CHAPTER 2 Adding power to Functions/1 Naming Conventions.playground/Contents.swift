import Foundation


/**
 `CHAPTER 2`
 `Adding Power to Functions`
 INTRO CHAPTER 2 —Now that we understand
 how a function is structured
 and how it works,
 let's take a look at
 how we can modify our functions .
 We'll start by looking at
 how we can give our functions
 custom parameter names ,
 default values
 and how we can return more than one value .
 */



/**
 `1 Naming Conventions`
 INTRO —Just as we followed a set of rules
 for naming constants and variables,
 we have a set of guidelines as to how we name our functions .
 There are several guidelines
 so we are going to start simple and focus on just one .
 */
/**
 There are several rules when it comes to naming functions
 but we don't need to know all of them up front .
 Let's take a look at one of the main rules here
 along with some of the exceptions .
 This rule should lay the groundwork in helping us start off writing some clear code .
 
 Okay ,
 so for the first rule to start ,
 if the first argument in a function forms part of a prepositional phrase ,
 then the argument label should indicate it as such .
 `NOTE`: A preposition , in English ,
 is a word that connects and establishes a relationship
 between a noun and another word in the sentence .
 `Erica climbed -> up -> the mountain .`
 In this phrase or sentence ,
 `up` is the preposition .
 It establishes a relationship between the noun , `mountain` and the word , `climbed` .
 _Where did Erica climb ?_
 She climbed
 up
 the mountain .
 Let's look at another example :
 `Grab the folder -> with -> the stickers on it .`
 `With` is the preposition
 because it connects the noun `folder` to the word , `stickers .
 _Which folder ?_
 The one with the stickers .
 Prepositions always occur in prepositional phrases .
 `up the mountain`
 `with the stickers`
 A prepositional phrase is one with a preposition and that connecting word .
 Now , there is more to understanding prepositions ,
 but I think this should be enough to get a frame of reference .

 So how does this apply to functions ?
 Whenever a function name , including the arguments ,
 forms a propositional phrase ,
 we need to include the preposition as part of the argument label .
 So let's see what this looks like :
 
 `EXAMPLE 1` — Let’s pretend we have a robot built in code and this robot lives on a map .
 We want to write a function that allows us to move the robot to a certain spot on the map .
 The function could look like this :
 */
// func moveRobot(toX: String) {} // OLIVIER
func move(toX: String) {}
/**
 `to` is the proposition
 and so we have a propositional phrase .
 So remember ,
 the rule is that when you have a propositional phrase ,
 we want to include the preposition in the argument label .
 
 `EXAMPLE 2` —Let's say we want to write a function
 that removes elements from an array that match a value that we pass in .
 We could write the function like this :
 */
func remove(havingValue: String) {}
/**
 Now this is a propositional phrase as well ,
 where `having` is the preposition .
 
 `EXAMPLE 3` —So what about that `area( )` function we wrote earlier ?
 */
func area(withLength: Int , withWith: Int) {}
/**
 This is weird though
 because in this case , we have two arguments .
 That doesn't sound right .
 So here is where we make an exception to our rule .
 If a function name , including its argument labels ,
 forms part of a prepositional phrase ,
 but there is more than one argument that forms the prepositional phrase ,
 we then move the preposition to the function's base name .
 That is the name outside of the parameter list .
 */
func areaWith(length: Int , width: Int) {}
/**
 A main part of the reasoning that we are talking about naming conventions , is ,
 because as per Swift guidelines ,
 we want functions to read as correct grammatical English phrases .
 */
