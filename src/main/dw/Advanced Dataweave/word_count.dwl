%dw 2.0
output application/json
/*
create a function that takes an string and returns the word count. The string will be a sentence.
*/
fun countWords(sentence: String) = sizeOf(sentence splitBy  /\s+/)
---
countWords("The sun rises in the east.")