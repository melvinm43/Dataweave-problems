%dw 2.0
output application/xml writeDeclaration = false
/*
Q: Aggregate data from two different XML inputs into a single XML output
input1:
<employees>
    <employee>
        <id>101</id>
        <name>John Doe</name>
    </employee>
        <employee>
        <id>102</id>
        <name>Jane Smith</name>
    </employee>
</employees>
Input2:
<salaries>
    <employee>
        <id>101</id>
        <salary>50000</salary>
    </employee>
        <employee>
        <id>102</id>
        <salary>20000</salary>
    </employee>
</salaries>

Output:
<employeeDetails>
  <employee>
    <id>101</id>
    <name>John Doe</name>
    <age>50000</age>
  </employee>
  <employee>
    <id>102</id>
    <name>Jane Smith</name>
    <age>20000</age>
  </employee>
</employeeDetails>

*/
---
employeeDetails : employee :
(payload.employees.*employee) map ((employee) -> 
employee ++ { age: (payload2.salaries.*employee filter $.id == employee.id)[0].salary}
)