/* Easy
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.
Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]

*/

%dw 2.0
output application/json

fun twoSum(array, target,numMap = {},index = 0) =
    if (index >= sizeOf(array)) [] 
    else do {
        var num = array[index] // current number from the array
        var complement = target - num
        ---
        if (numMap[complement as String] != null) 
            [numMap[complement as String], index]
        else 
            twoSum(array, target, numMap ++ {(num): index}, index + 1)
    }

var array1 = [2, 7, 11, 15]
var target1 = 9

var array2 = [3, 2, 4]
var target2 = 6

var array3 = [3, 3]
var target3 = 6

---
{
    example1: twoSum(array1, target1),
    example2: twoSum(array2, target2),
    example3: twoSum(array3, target3)
}
