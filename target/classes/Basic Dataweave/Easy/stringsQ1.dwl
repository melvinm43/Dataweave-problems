%dw 2.0
output application/json


/*
Q: Given an array of objects containing "name" and "age" fields, transform it to an array of strings 
where each string is in the format "Name is age years old".
["John is 30 years old","Jane is 25 years old","Bob is 40 years old"]
*/


---
payload map ((person) -> 
"$(person.name) is $(person.age) years old"
)