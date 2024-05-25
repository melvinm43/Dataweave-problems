/*
I need to do a binary search on a sorted array without using any core functions.

Example input :- [12, 28, 66, 76, 91, 105, 124]

I want to search 76

Pre requisite for Binary Search = A sorted array.
Time complexity = log(n)
*/

%dw 2.0
output application/json

var input_array = [12, 28, 66, 76, 91, 105, 124]
var lb = 0 // lower bound
var ub = sizeOf(input_array) -1 // upper bound

// fun find_mid(l: Number,u: Number) : Number = floor((l+u)/2)

var find_mid = (l,u) -> floor((l+u)/2)

fun binary_search(array,target,left,right) = 
    if(left > right)
        "Number not found!!"
    else do {
            var mid = find_mid(left,right) 
            ---
                if (array[mid] == target)
                    mid
                else if (array[mid] > target)
                    binary_search(array,target,left,mid - 1)  // search in the left half
                else binary_search(array,target,mid + 1,right) // search in the right half
            }


---

binary_search(input_array,66,lb,ub)
