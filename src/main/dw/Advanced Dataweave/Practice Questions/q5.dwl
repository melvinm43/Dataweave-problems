%dw 2.0
output application/json

/* 
Q5. You have hierarchical customer orders, but instead of storing product details inside the order, only product IDs are referenced. A separate product catalog contains details about each product.

Your goal is to flatten the orders and enrich them with actual product details from the catalog.

Input 

{
  "orders": [
    {
      "orderId": "O1001",
      "customer": "Sachin",
      "items": [
        { "productId": "P001", "qty": 2 },
        { "productId": "P003", "qty": 10 }
      ]
    },
    {
      "orderId": "O1002",
      "customer": "Rahul",
      "items": [
        { "productId": "P002", "qty": 5 }
      ]
    }
  ],
  "productCatalog": [
    { "productId": "P001", "name": "Laptop", "price": 1000 },
    { "productId": "P002", "name": "Mouse", "price": 50 },
    { "productId": "P003", "name": "Monitor", "price": 300 }
  ]
}
Output 

[
  {
    "orderId": "O1001",
    "customer": "Sachin",
    "productName": "Laptop",
    "price": 1000,
    "qty": 2,
    "totalPrice": 2000
  },
  {
    "orderId": "O1001",
    "customer": "Sachin",
    "productName": "Monitor",
    "price": 300,
    "qty": 10,
    "totalPrice": 3000
  },
  {
    "orderId": "O1002",
    "customer": "Rahul",
    "productName": "Mouse",
    "price": 50,
    "qty": 5,
    "totalPrice": 250
  }
]
*/
var input_payload = {
  "orders": [
    {
      "orderId": "O1001",
      "customer": "Sachin",
      "items": [
        { "productId": "P001", "qty": 2 },
        { "productId": "P003", "qty": 10 }
      ]
    },
    {
      "orderId": "O1002",
      "customer": "Rahul",
      "items": [
        { "productId": "P002", "qty": 5 }
      ]
    }
  ],
  "productCatalog": [
    { "productId": "P001", "name": "Laptop", "price": 1000 },
    { "productId": "P002", "name": "Mouse", "price": 50 },
    { "productId": "P003", "name": "Monitor", "price": 300 }
  ]
}

var product_catalog = input_payload.productCatalog groupBy $.productId
---
input_payload.orders flatMap ((order) -> 
order.items map ((item) -> 
{
    "orderId": order.orderId,
    "customer": order.customer,
    "productName": product_catalog[item.productId].name[0],
    "price": product_catalog[item.productId].price[0],
    "qty": item.qty,
    "totalPrice": product_catalog[item.productId].price[0] * item.qty

}

)
)
