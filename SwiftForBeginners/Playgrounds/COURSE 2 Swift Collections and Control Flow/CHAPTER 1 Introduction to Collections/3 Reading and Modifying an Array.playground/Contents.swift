import Foundation


/**
 `3 Reading and Modifying an Array`
 INTRO —Now that we know how an Array works ,
 let's see how we can add and modify an Array .
 */

var toDoList: [String] = [
    
    "Finish collections course ." ,
    "Buy groceries ." ,
    "Respond to emails ."
]

let firstTask = toDoList[0]

/**
 To actually read the array ,
 we start with the name of the array ,
 
 `toDoList`
 
 use `subscripting notation` ,
 which is open square bracket ,
 the index value ,
 and then , close square bracket .
 
 `[0]`
 
 We assign the result to a constant ,
 `let firstTask`
    Using an index number ,
 we can do more than just read the value .
 We can also use it to
 ( 1 ) modify existing values ,
 and ( 2 ) insert items into the array
 in a different way than appending . So , first ,
 look at modifying existing values , or , mutating an array :
 */

print("Before : \(toDoList[0])")
toDoList[0] = "Read a book ."
print("After : \(toDoList[0])")
