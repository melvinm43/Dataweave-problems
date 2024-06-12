%dw 2.0
output application/json

/*
Solution using conversion of a number into string.
*/

fun isPalindrome(num) = 
if ( (num as String) == (num as String)[-1 to 0] )
    "Number is Palindrome"
else
    "Not a palindrome"
---

isPalindrome(4567)
