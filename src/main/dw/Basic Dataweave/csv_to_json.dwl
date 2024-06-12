%dw 2.0
output application/json


/*
Q: Given a CSV file with headers "name", "age", and "gender", transform it to a JSON array of objects 
where each object contains only the "name" and "age" fields.
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