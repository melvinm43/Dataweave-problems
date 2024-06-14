%dw 2.0
output application/json
/*
Take the following CSV file:
invoiceId,vendorName,total,lineItem,lineItemAmount
1,Amazon,100,Sneakers,75
1,Amazon,100,Shirt,25
2,Walmart,38,Paper,10
2,Walmart,38,Towel,28
And transform it to the following JSON:

[
  {
    "invoiceId":  1,
    "vendorName": "Amazon",
    "total":      100,
    "lineItems": [
      {
        "item":   "Sneakers",
        "amount": 75
      },
      {
        "item":   "Shirt",
        "amount": 25
      }
    ]
  },
  {
    "invoiceId":  2,
    "vendorName": "Walmart",
    "total":      38,
    "lineItems": [
      {
        "item":   "Paper",
        "amount": 10
      },
      {
        "item":   "Towel",
        "amount": 28
      }
    ]
  }
]
*/
---
(payload groupBy ((order) -> (order.invoiceId) )) pluck ((value, key) -> 
{
    invoiceId : value.invoiceId[0],
    vendorName : value.vendorName[0],
    total: value.total[0],
    lineItems : value map(lineItem) -> {
        item : lineItem.lineItem,
        amount : lineItem.lineItemAmount
    }
}
)