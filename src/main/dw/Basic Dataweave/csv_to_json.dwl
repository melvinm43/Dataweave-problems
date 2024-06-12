%dw 2.0
output application/json


/*
output:
[
  {
    "name": "John",
    "age": "30"
  },
  {
    "name": "Jane",
    "age": "25"
  },
  {
    "name": "Bob",
    "age": "40"
  }
]
*/


---
payload map $ - "gender"