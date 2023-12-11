<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<style>
.container{
    background-color: aliceblue;
    text-align: center;
    margin-top: 50px;
    padding: 30px;
    width: fit-content;
    margin-left: auto;
    margin-right: auto;    
}
#details{
    margin-bottom: 20px;
    text-align: left;
    float: left;
}
.button {
  background-color: lightblue;
  border: none;
  color: white;
  padding: 5px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 10px 2px;
  cursor: pointer;
  transition-duration: 0.4s;
}
.button1:hover{
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
#btnContainer{
    margin-left: auto;
    margin-right: auto;
}
table{
    margin-left: auto;
    margin-right: auto;
}
th{
    position: sticky;
    z-index: 3;
    top: 0;
    background-color: aliceblue;
}
#grades{
    width: 100%;
    text-align: center;
}
a{
    text-decoration-line: none;
}

</style>
<body>

<div class="container">
    <h1>Student Marksheet</h1>
    <div>

        <table id="details" align="left">
            <tr>
                <td>Enroll : </td>
                <td><c:out value="${marksheet.enroll}"/></td>
            </tr>
            <tr>
                <td>Name : </td>
                <td><c:out value="${name}"/></td>
            </tr>
        </table>
        <br>
        <table id="grades" border="1" cellspacing="0" cellpadding="5">
        
        <tr>
            <td><b>Subject</b></td>
            <td><b>Grade</b></td>
        </tr>
        <c:forEach items="${grades.keys()}" var="key">
                <tr>
                    <td>${key}</td>
                    <td>${grades.getString(key)}</td>
                </tr>
        </c:forEach>
        <tr>
            <td>Total Grade</td>
            <td>${marksheet.totalGrade}</td>
        </tr>
        <tr>
            <td>Pass/Fail</td>
            <c:choose>
                <c:when test="${marksheet.pass}">
                    <td style="color: green;">PASS</td>
            </c:when>
            <c:otherwise>
                <td style="color: red;">FAIL</td>
            </c:otherwise>
        </c:choose>
            </td>
        </tr>
        </table>
    </div>

</div>
</body>
</html>