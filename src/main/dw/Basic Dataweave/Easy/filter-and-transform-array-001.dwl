%dw 2.0
output application/json

/*
Input:
[
  { "id": 1, "name": "Alice", "age": 25 },
  { "id": 2, "name": "Bob", "age": 30 },
  { "id": 3, "name": "Charlie", "age": 35 }
]

Expected Output
[
  { "name": "Alice" },
  { "name": "Bob" }
]

*/

var fields_to_remove = ["id","age"]
---
(payload filter ((person) -> person.name != "Charlie")) map ((person1) -> 
person1  -- fields_to_remove
)
