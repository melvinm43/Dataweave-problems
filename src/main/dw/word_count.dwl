%dw 2.0
output application/json
fun countWords(sentence: String) = sizeOf(sentence splitBy  /\s+/)
---
countWords("The sun rises in the east.")