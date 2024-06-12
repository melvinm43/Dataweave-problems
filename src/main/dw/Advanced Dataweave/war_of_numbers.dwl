%dw 2.0
output apllication/json
/*
Create a function that determines the winner based on the sum of even numbers and the sum of odd numbers in an input array of numbers.
*/
var input_data = [16,2,3,4,9,20,98]
var object = input_data map(number) -> {
number : number,
numberType: number mod  2
}
var even_numbers = (object filter(item)-> item.numberType == 0).number
var odd_numbers = (object filter(item)-> item.numberType !=0).number

var sum_of_even_numbers = sum(even_numbers)
var sum_of_odd_numbers = sum(odd_numbers)

fun score() = if(sum_of_even_numbers > sum_of_odd_numbers) 
"Even number wins" 
else if (sum_of_odd_numbers > sum_of_even_numbers)
"Odd number wins"
else "Tie"
---
score()