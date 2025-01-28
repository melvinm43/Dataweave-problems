%dw 2.0
output application/xml writeDeclaration = false

/*
Input:

{
  "name": "John",
  "age": 30,
  "address": {
    "city": "New York",
    "zip": "10001"
  }
}

Expected Output
<person>
  <name>John</name>
  <age>30</age>
  <city>New York</city>
  <zip>10001</zip>
</person>

*/

var address_obj = address: payload.address
---
person : payload -- ["address"] ++ address_obj.address
