%dw 2.0
output application/json

/* 
Q2. Given the input sales object — group sales by region, then Inside each region, group sales by category and calculate the total sales per category.

Input

{
  "sales": [
    { "region": "North", "amount": 100, "category": "Electronics" },
    { "region": "South", "amount": 200, "category": "Furniture" },
    { "region": "North", "amount": 150, "category": "Electronics" },
    { "region": "South", "amount": 300, "category": "Furniture" },
    { "region": "North", "amount": 50, "category": "Clothing" }
  ]
}
Output

{
  "North": {
    "Electronics": 250,
    "Clothing": 50
  },
  "South": {
    "Furniture": 500
  }
}
*/
var input_payload = {
  "sales": [
    { "region": "North", "amount": 100, "category": "Electronics" },
    { "region": "South", "amount": 200, "category": "Furniture" },
    { "region": "North", "amount": 150, "category": "Electronics" },
    { "region": "South", "amount": 300, "category": "Furniture" },
    { "region": "North", "amount": 50, "category": "Clothing" }
  ]
}

var expected_output = {
  "North": {
    "Electronics": 250,
    "Clothing": 50
  },
  "South": {
    "Furniture": 500
  }
}

var actual_output = (input_payload.sales groupBy $.region) mapObject ((salesList, region) -> 
(region) : (salesList groupBy $.category) mapObject ((categorySales, category) -> 
(category) :   sum( categorySales map ((item) -> item.amount) )
)
)
---
actual_output