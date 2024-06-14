%dw 2.0
output application/json


/*
Output:
[{"id":1,"name":"John","department":"IT"},{"id":2,"name":"Jane","department":"Sales"},{"id":3,"name":"Bob","department":"Marketing"}]
*/

var fieldsToRemove = ["age","salary"]
---
// payload.employees map $ - "age" - "salary" // option 1
payload.employees map(emp) -> emp -- fieldsToRemove // option 2