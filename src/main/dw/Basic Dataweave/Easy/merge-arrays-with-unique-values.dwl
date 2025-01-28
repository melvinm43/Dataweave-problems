%dw 2.0
output application/json
var input_rec = {
  "array1": [1, 2, 3, 4],
  "array2": [3, 4, 5, 6]
}


/* 
Expected Output
[1, 2, 3, 4, 5, 6]
 */
---
(input_rec.array1 ++ input_rec.array2) distinctBy $
