import Foundation


/**
 `4 Inserting and Deleting Values`
 INTRO —To conclude our operations on modifying the array ,
 let's look at
 how we can insert values at arbitrary indexes
 and delete values .
 */
/**
 What if we wanted to insert a new item ?
 Now , we have inserted before using
 ( 1 ) the `append()` method
 and ( 2 ) by `concatenating` .
 But in all those cases ,
 we simply added to the very end of the arrays .
 The item always went at the next index value .
 _What if we wanted to insert a new item at a specific point in the array ?_
 We are going to use an `index value`
 to put something in an arbitrary position in the Array :
 
 `toDoList.insert(newElement: String , at: Int)`
 
 As always ,
 we start by typing out the name of the Array we want to work with ,
 `toDoList` :

 */

var toDoList: [String] = [
    
    "Finish collections course ." ,
    "Buy groceries ." ,
    "Respond to emails ."
]


toDoList.insert("Watch a youtube video ." , at : 2)

print(toDoList) // prints Resul["Finish collections course ." , "Buy groceries ." , "Watch a youtube video .", "Respond to emails ."]

/**
 The neat thing here , is ,
 that we are not getting rid of `Respond to emails .` .
 `Respond to emails .` , which had an index value of `2` ,
 now has an index value of `3` .
 Essentially , every item after that `index position`
 that you inserted your new item at ,
 has their `index value` increased by 1 .
    To finish up _adding_ and _reading_ ,
 let's try _removing_ items .
 */

toDoList.remove(at : 2)

print(toDoList) // prints ["Finish collections course .", "Buy groceries .", "Respond to emails ."]

/**
 `remove()` , like `insert()` ,
 involves updating the _entire_ `Array` .
 Because we are actually pulling out `Watch a youTube video .` from the entire array .
 So , every item , after the `index value` that we removed ,
 has its index decreased by 1 .
 So when you remove something ,
 it is important to know
 that position in the Array
 isn't empty .
 We shift everything back ,
 so that the Array always has a certain number of spots occupied .
 There are no empty spaces in an Array .
 
 `NOTE`: All this work we do on an Array when we insert or remove
 means ,
 that the number of items in the Array are constantly changing .
 Now if the Array is small , that is okay .
 We'll just shift a couple items in their index parts .
 But imagine , you had a database of millions of items right in an Array .
 If you remove or insert an item into one of these large arrays .
 Then all the rest of the million items million minus 1 have to be shifted over
 and that takes a long time . So , it is not something we should worry about now .
 But an interesting thing you should be aware of , is ,
 that the larger the array ,
 the more expensive these operations are .
 
 To round things up .
 How do we know
 or how do you keep track of
 how many items are in the array ?
 Luckily there is another property that we can use :
 */

toDoList.count

/**
 `NOTE`: It is important to note ,
 that the number of items in an Array ,
 is always one value higher
 than the maximum index value.
 This is
 because the first element
 is always at index position `0`.
 So , what if you want to get
 the last item in an array ?
 */

toDoList[toDoList.count - 1]

/**
 `GOTCHA`: Never query more than the max index value of the array .
 You will get an error , `index our of range` .
 You are basically poking at memory in the computer that is unoccupied
 and your computer or your program will crash .
 */
