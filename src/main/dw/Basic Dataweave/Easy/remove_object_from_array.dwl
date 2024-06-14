%dw 2.0
output application/json

/*
Q: Remove objects in the input array where the status field of the object is "processed"

Input:
[
  {
    "id": 1,
    "status": "waiting"
  },
  {
    "id": 2,
    "status": "processed"
  },
  {
    "id": 3,
    "status": "waiting"
  }
]
*/
var payload = [
  {
    "id": 1,
    "status": "waiting"
  },
  {
    "id": 2,
    "status": "processed"
  },
  {
    "id": 3,
    "status": "waiting"
  }
]
---
payload filter $.status != "processed"