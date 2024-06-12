%dw 2.0
output application/json
/*
To check if the number is BuzzNumber or not.

A buzz number is a special number that ends with the digit 7 
or is divisible by 7.
*/

fun isBuzzNumber(num: Number) : Boolean = 
    (num mod 7) == 0 or (num mod 10) == 7
---
isBuzzNumber(63)