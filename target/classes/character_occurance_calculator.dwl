%dw 2.0
output application/json
/*
Find the number of occurrences of a character in a String.
*/
fun charOcurrencesCount(inString: String, char_to_search : String) : Number = 
    inString reduce ((char, accumulator=0) -> 
    if(char == char_to_search)  accumulator + 1
    else accumulator + 0
) 

fun countOccurrences(str, character) =
    sizeOf((str splitBy character)) - 1

var inputString = "Hello, Mulesoft Community!"
var characterToCount = "o"

---
{
    "InputString": inputString,
    "CharacterToCount": characterToCount,
    "charOcurrencesCount": charOcurrencesCount(inputString, characterToCount)
}