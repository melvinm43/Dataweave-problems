%dw 2.0
fun returnValueByType(key,val) =  
         if ((typeOf(val) as String) == "String")  marshallStringType(val)
    else if ((typeOf(val) as String) == "Number")   marshallNumberType(val)
    else if ((typeOf(val) as String) == "Null") marshallNullType(val)
    else if ((typeOf(val) as String) == "Boolean")  marshallBoolType(val)
    else if ((typeOf(val) as String) == "Object") {"M" :    marshallMapType(val) }
    else if ((typeOf(val) as String) == "Array")    marshallListType(val)
    else marshallStringType(val)


fun marshallStringType(val)= 
{"S" : val as String }


fun marshallNumberType(val)=
{"N" : val as String}


fun marshallNullType(val)=
{"nullvalue" : true }


fun marshallBoolType(val)=
{"Bool" : val as Boolean}


fun marshallMapType(val)=
val mapObject ((value, key, index) -> 
{ (key) : (returnValueByType(key,value))  }
)


fun marshallListType(val)=
"L":  val map ((item, index) -> 
(item) mapObject ((value, key, index) -> 
 (returnValueByType(key,item))
)
)


fun marshallDynamoJson(json) = json mapObject (
            (val, key, index2) -> (key): (returnValueByType(key,val))
)

var inputData = {"message" : "hello world!"}
---
marshallDynamoJson(inputData)