<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<style>
.container{
    background-color: aliceblue;
    text-align: center;
    margin-top: 50px;
    padding: 10px;
    width: fit-content;
    margin-left: auto;
    margin-right: auto;    
}
.tableContainer{
    overflow-y: scroll;
    height: 400px;
}
.tableContainer::-webkit-scrollbar{
    display: none;
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
table td{
    text-align: center;
}
table tr{
    transition-duration: 0.4s;
}
table tr:hover{
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
tr:nth-child(even){
    background-color: lightskyblue;
}
tr:nth-child(odd){
    background-color: whitesmoke;
}
a{
    text-decoration-line: none;
}

</style>
<body>

<div class="container">
    <h1>Student Details</h1>
    <div class="tableContainer">
        <table cellspacing="0" cellpadding="20">
        <tr style="box-shadow: none;">
            <th>ENROLLMENT NO</th>
            <th>NAME</th>
            <th>DEPARTMENT</th>
            <th>EMAIL</th>
            <th>EDIT</th>
            <th>DELETE</th>
            <th>MARKSHEET</th>
        </tr>
        <c:forEach items="${students}" var="student">
                <tr>
                    <td><c:out value="${student.enroll}"/></td>
                    <td><c:out value="${student.name}"/></td>
                    <td><c:out value="${student.department}"/></td>
                    <td><c:out value="${student.email}"/></td>
                    <td style="font-size: 20px;"><a href="/editStudent/${student.enroll}" style="color: black;">&#9998;</a></td>
                    <td style="font-size: 20px;"><a href="#" onclick="confirmDelete('${student.enroll}')" style="color: crimson;">&#10006;</a></td>    
                    <td style="font-size: 20px;"><a href="/marksheet/${student.enroll}" style="color: black;">&#9783;</a></td>
                </tr>
        </c:forEach>
        </table>
    </div>

    <button onclick="window.location.href = '/addStudent'" class="button button1">ADD</button>
</div>
<div id="btnContainer">
    
</div>
<script>

    function confirmDelete(enroll) {
        var a = confirm("Are you sure you want to delete student with enrollment no - " + enroll);
        if(a == true){
            window.location.href = "/deleteStudent/"+enroll;
        }
        else{
            window.location.href = "/home";
        }
    }
</script>
</body>
</html>