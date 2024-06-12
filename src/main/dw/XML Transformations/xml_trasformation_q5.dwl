%dw 2.0
output application/xml writeDeclaration=false
var emp = payload.employees.*employee


/*
Hard Question
Output XML (sorted and grouped):
<departments>
    <IT>
        <employee>
            <id>101</id>
            <name>John Doe</name>
        </employee>
        <employee>
            <id>103</id>
            <name>Michael Johnson</name>
        </employee>
    </IT>
    <HR>
        <employee>
            <id>102</id>
            <name>Jane Smith</name>
        </employee>
    </HR>
</departments>

*/
---
departments:  
    (emp groupBy $.department) mapObject ((value, key) -> 
    (key) : (value groupBy $.department) mapObject ((value, key) -> 
    employee : value map ((item) -> item - "department") orderBy $.id
    )
    )