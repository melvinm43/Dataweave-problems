%dw 2.0
output application/json


/* 
Input 
{
  "name": "John",
  "metadata": {
    "age": 30,
    "address": {
      "city": "New York",
      "zip": "10001"
    }
  }
}

Expected Output
{
  "name": "John",
  "age": 30,
  "city": "New York",
  "zip": "10001"
}
 */

fun build_output(obj :Object) : Object = obj mapObject ((value,key) -> if( typeOf(value) == Object) build_output(value)
else {} ++ { (key) : value }
)
---
build_output(payload)
