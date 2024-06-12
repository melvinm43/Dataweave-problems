%dw 2.0
output application/json

/*
To determine whether the two strings given are anagrams.

If two strings have the same set of characters in a different order, 
they are anagrams.
*/

var string1 = "listen"
var string2 = "silent"



fun isAnagram(word1 : String, word2 : String) : Boolean = do {
var string1Ordered = word1 splitBy  "" orderBy $
var string2Ordered = word2 splitBy  "" orderBy $
---
    if(string1Ordered == string2Ordered)  true else false
}
---

isAnagram(string1,string2)
