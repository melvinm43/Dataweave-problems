%dw 2.0
output application/json


/*
["John is 30 years old","Jane is 25 years old","Bob is 40 years old"]
*/


---
payload map ((person) -> 
"$(person.name) is $(person.age) years old"
)