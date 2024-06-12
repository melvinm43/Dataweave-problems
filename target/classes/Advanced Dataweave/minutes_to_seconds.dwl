%dw 2.0
output application/json
/*
Write a function that takes an integer and converts it to seconds
*/
fun convert(timeinMinutes:  Number) :Number = timeinMinutes * 60
---
convert(2)
