<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<style>
.formContainer{
    background-color: aliceblue;
    text-align: center;
    margin-top: 50px;
    padding: 10px;
    width: fit-content;
    margin-left: auto;
    margin-right: auto;
}
input{
    height: 30px;
}
input[type=submit]{
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
input[type=submit]:hover{
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
</style>
<body>

<div class="formContainer">

    <h2>ADD STUDENT DETAILS</h2>
    <form action="/addStudent" method="post">
    <table border="0" cellpadding="10" align="center">
    <tr>
        <td>Name:</td>
        <td><input type="text" name="name" value="${details.name}" pattern="[A-Za-z]+" title="Name should contain alphabets only" required></td>
    </tr>
    <tr>
        <td>Enrollment No.</td>
        <c:choose>
            <c:when test="${empty details}">
                <td><input type="text" name="enroll" pattern="[0-9]{1,12}" title="Enrollment should contain numbers only" required></td>
            </c:when>
            <c:otherwise>
                <td><input type="text" name="enroll" value="${details.enroll}" readonly></td>
            </c:otherwise>
        </c:choose>
    </tr>
    <tr>
        <td>Department:</td>
        <td><input type="text" name="department" value="${details.department}" pattern="[A-Za-z]+" title="Department should contain alphabets only" required></td>
    </tr>
    <tr>
        <td>Email:</td>
        <td><input type="email" name="email" value="${details.email}" required></td>
    </tr>
    <tr>
        <td><input type="submit" onclick="document.getElementById('isCancel').value = 'false' "></td>
        <td><input type="submit" value="Cancel" onclick="document.getElementById('isCancel').value = 'true' " formnovalidate></td>  
        <td><input type="hidden" name="isCancel" id="isCancel" value=""></td>
        
    </tr>
    </table>   
    </form>

</div>        
</body>
</html>