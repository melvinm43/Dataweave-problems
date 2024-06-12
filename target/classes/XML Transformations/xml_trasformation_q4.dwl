%dw 2.0
output application/xml writeDeclaration = false

type employee = {|department: String, id: String, name: String|}
fun addBonus(emp:employee) =  
( if (emp.department == "IT") {bonus : "1000"} else {})


/*
Input:
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

Output XML (add a bonus element for employees from the IT department):
<employees>
    <employee>
        <id>101</id>
        <name>John Doe</name>
        <department>IT</department>
        <bonus>1000</bonus>
    </employee>
    <employee>
        <id>102</id>
        <name>Jane Smith</name>
        <department>HR</department>
    </employee>
</employees>

*/
---

employees : employee : 
payload.employees.*employee  map ((emp) -> 
emp ++ addBonus(emp)
)
