%dw 2.0
output application/json
/*
To remove all occurrences of a given character from the input string.
*/
fun removeCharacter(inString : String, char : String) : String = 
    inString replace char with ""

var inputString = "Hello, World!"
var characterToRemove = "o"

---
{
    "InputString": inputString,
    "CharacterToRemove": characterToRemove,
    "StringWithoutCharacter": removeCharacter(inputString, characterToRemove)
}