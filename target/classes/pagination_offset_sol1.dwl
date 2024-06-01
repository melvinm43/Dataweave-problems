%dw 2.0
output application/json
/*
Adjusting pagination offset based on input size and total count.
​*/
var payload = {
  "size": 100,
  "offset": 0,
  "totalCount" : 550
}
var size = payload.size
var totalCount = payload.totalCount
var arr = 0 to (totalCount/size)
---
/* 
[
  {
    "offset": 0
  },
  {
    "offset": 100
  },
  {
    "offset": 200
  },
  {
    "offset": 300
  },
  {
    "offset": 400
  },
  {
    "offset": 500
  }
]
*/

arr map(item) -> {
"offset" : item * size
}

