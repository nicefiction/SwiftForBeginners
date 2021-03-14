import Foundation


/**
 `2 Adding items to arrays`
 INTRO — Now that we know how an `Array` works ,
 let's see how we can add and modify an array .
 */

var toDoList: [String] = [
    
    "Finish collections course ." ,
    "Buy groceries ." ,
    "Respond to emails ."
]

// To add a new item to the array :

toDoList.append("Pick up dry cleaning .")

// To concatenates two Arrays :

toDoList + ["Order book online ."]

// To concatenate an Array containing a String literal to the toDo Array :

toDoList = toDoList + ["Order book online ."]

// Alternatively one can use the unary addition operator :

toDoList += ["Order book online ."]

/**
 `NOTE` : One cannot concatenate an Array to a String
 because of the `Type Safety` principle .
 The types have got to be the same .
 
 `toDoList + "Order book online ." // ERROR`
 
 `NOTE`: You can only add items to an Array
 if the Array has been assigned to a variable , if the Array is mutable :

 `var toDoList: [String] = [ ... ]`
 `let toDoList: [String] = [ ... ] // ERROR`
 
 
 Now we know
 how to add things to an array .
 _What about reading things ?_
 _How do we get things out ?_
 Let's look at that in the next video .
 */
