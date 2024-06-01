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

fun offset_builder(offset,totalCount,size,arr =[]) = do {
var arr_size = floor(totalCount/size)
fun offset_object(offset) = { "offset" : offset}
---
  if(offset >totalCount) arr
  else offset_builder( offset + size,totalCount,size,arr + offset_object(offset)  )

}
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
offset_builder(payload.offset,payload.totalCount,payload.size)