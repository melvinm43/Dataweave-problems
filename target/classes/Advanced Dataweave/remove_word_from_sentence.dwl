%dw 2.0
output application/json
/* Remove all occurances of a given word from a sentence*/

var inputString = "Hello world , this is world of Melvin"
var word_to_remove = "world"
fun remove_word(sentence : String, word: String) : String = 
(sentence splitBy /\s+/) - word joinBy " "
---
remove_word(inputString,"world")

/* A different implementation
%dw 2.0
output application/json
import remove from dw::core::Strings

var inputString = "Hello world , this is world of Merlin"
var word_to_remove = "world"

---
inputString remove word_to_remove 
*/