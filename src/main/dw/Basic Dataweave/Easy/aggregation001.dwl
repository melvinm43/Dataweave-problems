%dw 2.0
output application/json


/* 
Input 
{
  "data": [
    { "id": 1, "value": 10 },
    { "id": 2, "value": 20 },
    { "id": 3, "value": 30 }
  ]
}

Expected Output
{
  "total": 60,
  "average": 20,
  "max": 30,
  "min": 10
}
 */
---
payload mapObject ((value, key) -> 
{
    total : sum(value.value),
    average : sum(value.value)/sizeOf(value),
    max: max(value.value),
    min : min(value.value)
}
)
