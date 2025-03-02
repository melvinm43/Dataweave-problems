%dw 2.0
output application/json

/* 
Q3. Multi-Level Grouping & Transformation

Input 

{
  "orders": [
    { "orderId": 101, "customer": "Sachin", "category": "Electronics", "amount": 500 },
    { "orderId": 102, "customer": "Sachin", "category": "Furniture", "amount": 150 },
    { "orderId": 103, "customer": "Rahul", "category": "Electronics", "amount": 200 },
    { "orderId": 104, "customer": "Rahul", "category": "Clothing", "amount": 100 },
    { "orderId": 105, "customer": "Sachin", "category": "Electronics", "amount": 700 }
  ]
}
Output

{
  "Sachin": {
    "Electronics": {
      "totalAmount": 1200,
      "orders": [
        101,
        105
      ]
    },
    "Furniture": {
      "totalAmount": 150,
      "orders": [
        102
      ]
    }
  },
  "Rahul": {
    "Electronics": {
      "totalAmount": 200,
      "orders": [
        103
      ]
    },
    "Clothing": {
      "totalAmount": 100,
      "orders": [
        104
      ]
    }
  }
}
*/
var input_payload = {
  "orders": [
    { "orderId": 101, "customer": "Sachin", "category": "Electronics", "amount": 500 },
    { "orderId": 102, "customer": "Sachin", "category": "Furniture", "amount": 150 },
    { "orderId": 103, "customer": "Rahul", "category": "Electronics", "amount": 200 },
    { "orderId": 104, "customer": "Rahul", "category": "Clothing", "amount": 100 },
    { "orderId": 105, "customer": "Sachin", "category": "Electronics", "amount": 700 }
  ]
}

---
( input_payload.orders groupBy $.customer) mapObject ((orderList, customer) -> 
(customer) : (orderList groupBy $.category) mapObject ((orders, category) -> 
(category) : {
    totalAmount : orders reduce ((order, acc = 0) -> acc + order.amount),
    orders : orders.orderId
}
)
)
