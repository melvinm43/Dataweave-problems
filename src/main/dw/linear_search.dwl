%dw 2.0
output application/json
var input_array = [5,8,4,6,9,2]
var ub = sizeOf(input_array) -1 // upper bound
fun linear_search(array,target,cursor) = 
    if(cursor > ub)  
        "Number not found"
    else if(array[cursor] == target)  
        cursor
    else linear_search(array,target,cursor + 1) // increment cursor
---
linear_search(input_array,8,0)