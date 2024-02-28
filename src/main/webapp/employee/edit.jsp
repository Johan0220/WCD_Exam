<%@ page import="wcd.jpa.entities.Employee" %><%--
  Created by IntelliJ IDEA.
  User: quanghoatrinh
  Date: 22/01/2024
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
    <jsp:include page="/layout/header.jsp"/>
    <div class="container">
        <h1>Add Student Demo</h1>
        <!--  Table students -->
        <div class="row">
            <div class="col-6">
                <% Employee employee = (Employee)request.getAttribute("employee"); %>
                <form method="post" action="edit-employee?employee_id=<%= employee.getEmployee_id() %>">
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Full name</label>
                        <input type="text" value="<%= employee.getEmployee_name() %>" name="employee_name" class="form-control" aria-describedby="emailHelp"/>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                        <input type="email" value="<%= employee.getEmail() %>" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Address</label>
                        <input type="text" name="phone_number" value="<%= employee.getPhone_number() %>" class="form-control" aria-describedby="emailHelp"/>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Address</label>
                        <input type="text" name="birthday" value="<%= employee.getBirthday() %>" class="form-control" aria-describedby="emailHelp"/>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>


</body>
</html>
