%dw 2.0
output application/json
/*
The problem: 
You are given two positive integers n and k. A factor of an integer n is defined as an integer i where n % i == 0.
Consider a list of all factors of n sorted in ascending order, return the kth factor in this list or return -1 if n has less than k factors.
 
Example 1:
Input: n = 12, k = 3
Output: 3
Explanation: Factors list is [1, 2, 3, 4, 6, 12], the 3rd factor is 3.
*/

fun find_kth_factor_of_n(n:Number,k:Number): Number = 
do {

var factors_of_n = ((1 to n) filter(n mod $) == 0)
---
    if (factors_of_n[k] == null)
        -1
    else
    factors_of_n[k-1]
}
---
find_kth_factor_of_n(12,3)