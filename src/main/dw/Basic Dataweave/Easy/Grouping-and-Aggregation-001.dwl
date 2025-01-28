%dw 2.0
output application/json

/*
Input:
[
  { "category": "A", "value": 10 },
  { "category": "B", "value": 20 },
  { "category": "A", "value": 30 },
  { "category": "B", "value": 40 }
]

Expected Output
[
  { "category": "A", "total": 40 },
  { "category": "B", "total": 60 }
]
*/


---
payload groupBy ((item) -> item.category) pluck ((value, key) -> 
{ 
    "category" : (key),
    "total" : sum(value.value)
}
)
