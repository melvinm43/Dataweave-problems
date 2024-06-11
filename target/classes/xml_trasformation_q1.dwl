%dw 2.0
output application/xml writeDeclaration = false

/*
input:
<employees>
    <employee>
        <id>101</id>
        <name>John Doe</name>
        <department>IT</department>
    </employee>
    <employee>
        <id>102</id>
        <name>Jane Smith</name>
        <department>HR</department>
    </employee>
</employees>

Output
<persons>
    <person>
        <employeeId>101</employeeId>
        <fullName>John Doe</fullName>
        <dept>IT</dept>
    </person>
    <person>
        <employeeId>102</employeeId>
        <fullName>Jane Smith</fullName>
        <dept>HR</dept>
    </person>
</persons>

Note:
Refer write properties: https://docs.mulesoft.com/dataweave/latest/dataweave-formats-xml#writer_properties
*/
---

persons : payload.employees mapObject person : $