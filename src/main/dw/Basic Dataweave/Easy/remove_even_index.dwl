%dw 2.0
output application/json

// Q. Remove even indexes from [1,2,3,4,5]
---
[1,2,3,4,5] filter !isEven($$)