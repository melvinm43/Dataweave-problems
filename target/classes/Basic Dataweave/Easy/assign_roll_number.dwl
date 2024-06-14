%dw 2.0
output application/json

/*
Q: Assign roll number to the input data given below.
Input:
[
  { "name": "Archer" },
  { "name": "Cyril"  },
  { "name": "Pam"    }
]

Output:
[
  { "id": 1, "name": "Archer" },
  { "id": 2, "name": "Cyril"  },
  { "id": 3, "name": "Pam"    }
]

*/
---
payload map ((item, index) -> 
{ id : index +1} ++ item
)