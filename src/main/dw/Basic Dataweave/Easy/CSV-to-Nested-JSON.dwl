%dw 2.0
output application/json


/* 
id,name,department
1,John,HR
2,Alice,IT
3,Bob,HR

Expected Output
[
  {
    "department": "HR",
    "employees": [
      { "id": 1, "name": "John" },
      { "id": 3, "name": "Bob" }
    ]
  },
  {
    "department": "IT",
    "employees": [
      { "id": 2, "name": "Alice" }
    ]
  }
]
 */
---
payload groupBy ((value, key) -> value.department ) pluck ((value, key) -> 
{
    department : value.department[0],
    employees : value map ((item) -> item -- ["department"])
}
)
