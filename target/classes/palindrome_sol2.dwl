%dw 2.0
output application/json
/*
Solving palindrom problem without using string conversion.
Algorithm:
how to reverse a number using math ?
Step 1 — Isolate the last digit in number
lastDigit = number % 10
Step 2 — Append lastDigit to reverse
reverse = (reverse * 10) + lastDigit
Step 3-Remove last digit from number
number = number / 10

Repeat this process until number is reduced to zero and reverse is completed.

*/
fun reverse_digit(num,reverse = 0) = do {

var last_digit = num mod 10
---
if(num == 0) 
    reverse
else reverse_digit(floor(num/10),(reverse * 10) + last_digit)
}

fun isPalindrome(num) = 
if(num == reverse_digit(num)) 
    "Number is palindrome"  
else 
    "Not a palindrome"
---
isPalindrome(1221)

