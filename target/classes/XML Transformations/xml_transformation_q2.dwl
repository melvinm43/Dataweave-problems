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

Output: Output XML (only IT department employees):
<persons>
<itEmployees>
    <employee>
        <id>101</id>
        <name>John Doe</name>
    </employee>
</itEmployees>
*/
---
itEmployees : (payload.employees) filterObject $.department ~= "IT"