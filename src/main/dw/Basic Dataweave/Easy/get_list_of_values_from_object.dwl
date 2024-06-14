%dw 2.0
output application/json

/*
Q: Get a list of the values from the object:
*/
var payload = {
  "one":   "two",
  "three": "four",
  "five":  "six"
}
---
payload pluck $