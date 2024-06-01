%dw 2.0
output application/json

/*
To print below number pattern.
  "1", 
  "1 2", 
  "1 2 3", 
  "1 2 3 4", 
  "1 2 3 4 5", 
  "1 2 3 4 5 6"
*/

fun pattern_printer(n) = 
(1 to n) map((row) -> ((1 to row) map ((col) -> col) joinBy  " "))
---
pattern_printer(6)
