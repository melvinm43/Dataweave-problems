%dw 2.0
output application/json
fun toDateTime(epochTime:Number) = epochTime as DateTime

/*
Q: Given a JSON array of objects containing "start" and "end" fields in Unix timestamp format, transform it to a JSON array of objects where each "start" and "end" field is formatted as ISO 8601 date/time.
output:
[
  {
    "start": "2022-04-12T00:00:00Z",
    "end": "2022-04-12T01:00:00Z"
  },
  {
    "start": "2022-04-13T03:00:00Z",
    "end": "2022-04-13T04:00:00Z"
  },
  {
    "start": "2022-04-16T00:00:00Z",
    "end": "2022-04-16T01:00:00Z"
  }
]
*/


---
payload map ((timeObj) -> 
timeObj mapObject ((epochTime, key) -> 
(key) : toDateTime(epochTime)
)
)