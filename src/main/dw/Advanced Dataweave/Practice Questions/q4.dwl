%dw 2.0
output application/json

/* 
Q4. You’re given transaction data where each entry contains multiple product purchases. You need to split the transactions into individual line items, transforming the structure completely.

Input 

{
  "transactions": [
    {
      "txnId": "T001",
      "customer": "Sachin",
      "items": [
        { "product": "Laptop", "price": 1000, "qty": 4 },
        { "product": "Mouse", "price": 50, "qty": 2 }
      ]
    },
    {
      "txnId": "T002",
      "customer": "Rahul",
      "items": [
        { "product": "Keyboard", "price": 80, "qty": 9 },
        { "product": "Monitor", "price": 300, "qty": 5 }
      ]
    }
  ]
}
Output

[
  {
    "txnId": "T001",
    "customer": "Sachin",
    "product": "Laptop",
    "price": 1000,
    "qty": 4,
    "totalPrice": 4000,
    "lineItemId": "T001_Laptop"
  },
  {
    "txnId": "T001",
    "customer": "Sachin",
    "product": "Mouse",
    "price": 50,
    "qty": 2,
    "totalPrice": 100,
    "lineItemId": "T001_Mouse"
  },
  {
    "txnId": "T002",
    "customer": "Rahul",
    "product": "Keyboard",
    "price": 80,
    "qty": 9,
    "totalPrice": 720,
    "lineItemId": "T002_Keyboard"
  },
  {
    "txnId": "T002",
    "customer": "Rahul",
    "product": "Monitor",
    "price": 300,
    "qty": 5,
    "totalPrice": 1500,
    "lineItemId": "T002_Monitor"
  }
]
*/
var input_payload = {
  "transactions": [
    {
      "txnId": "T001",
      "customer": "Sachin",
      "items": [
        { "product": "Laptop", "price": 1000, "qty": 4 },
        { "product": "Mouse", "price": 50, "qty": 2 }
      ]
    },
    {
      "txnId": "T002",
      "customer": "Rahul",
      "items": [
        { "product": "Keyboard", "price": 80, "qty": 9 },
        { "product": "Monitor", "price": 300, "qty": 5 }
      ]
    }
  ]
}

---
input_payload.transactions flatMap ((txn) -> 
    txn.items map ((item) -> {
        "txnId": txn.txnId,
        "customer": txn.customer,
        "product": item.product,
        "price": item.price,
        "qty": item.qty,
        "totalPrice": item.price * item.qty,
        "lineItemId": txn.txnId ++ "_" ++ item.product
    })
)