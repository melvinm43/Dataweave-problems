%dw 2.0
output application/json

/*
Input:
{
  "name": "John",
  "address": {
    "city": "New York",
    "zip": "10001"
  },
  "orders": [
    { "id": 1, "amount": 100 },
    { "id": 2, "amount": 200 }
  ]
}

Expected Output
[
  { "name": "John", "city": "New York", "zip": "10001", "orderId": 1, "amount": 100 },
  { "name": "John", "city": "New York", "zip": "10001", "orderId": 2, "amount": 200 }
]
*/


---
payload.orders map ((order) -> 

{
    "name" : payload.name,
    "city" : payload.address.city,
    "zip" : payload.address.zip,
    "OrderId" : order.id,
    "amount" : order.amount
}
)
