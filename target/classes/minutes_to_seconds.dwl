%dw 2.0
output application/json

fun convert(timeinMinutes:  Number) :Number = timeinMinutes * 60
---
convert(2)
