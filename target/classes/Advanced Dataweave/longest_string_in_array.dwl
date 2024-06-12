%dw 2.0
output application/json

/*
To display the Longest String in an array list.

Given a list of strings in an array arr[] of size N, 
display the longest name contained in it. 
If there are multiple longest names print all of that.
*/
var namesList = ["Alice", "Bob", "Charlie", "David", "Eleanor"]

fun longest_string(arr:Array<String>) : Array<String> = do {

var max_size = max(arr map sizeOf($))
---
arr filter sizeOf($) == max_size
}

---
{
    "NamesList": namesList,
    "LongestNames": longest_string(namesList)
}


