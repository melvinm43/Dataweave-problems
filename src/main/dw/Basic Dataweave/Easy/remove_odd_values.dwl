%dw 2.0
output application/json

// Q. Remove odd values from [1,2,3,4,5]
---
[1,2,3,4,5] filter !isOdd($)