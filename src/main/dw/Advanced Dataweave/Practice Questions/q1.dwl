%dw 2.0
output application/json

/* 
Q. Given the student array convert it into a key-value object where id is the key. Inside each student’s object, replace subjects with a flattened structure, where each subject becomes a separate field (mathScore, scienceScore, etc.).
Expected output
{
  "1": {
    "name": "Faizan",
    "mathScore": 85,
    "scienceScore": 90
  },
  "2": {
    "name": "Shobhit",
    "mathScore": 75,
    "scienceScore": 80
  }
}
*/
var input_payload = {
  "students": [
    {
      "id": 1,
      "name": "Faizan",
      "subjects": [
        {
          "name": "Math",
          "score": 85
        },
        {
          "name": "Science",
          "score": 90
        }
      ]
    },
    {
      "id": 2,
      "name": "Shobhit",
      "subjects": [
        {
          "name": "Math",
          "score": 75
        },
        {
          "name": "Science",
          "score": 80
        }
      ]
    }
  ]
}
---
(input_payload.students) groupBy $.id mapObject ((value, key) -> 

(key) : (value[0] -- ["id"] )  mapObject ((value, key) -> 

if( (key) ~= "subjects"  )  (value groupBy lower($.name) ) mapObject ((value, key) -> (key ++ "Score") : value.score[0]

)
else (key) : value

)
)