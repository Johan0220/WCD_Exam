<%@ page import="wcd.jpa.entities.Employee" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
    <jsp:include page="/layout/header.jsp"/>
    <div class="container">
        <h1>List Student Demo</h1>
        <a href="create-employee">Create</a>
        <!--  Table students -->
        <table class="table">
            <thead>
                <th>Id</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Birthday</th>
                <th></th>
                <th></th>
            </thead>
            <tbody>
                <% for (Employee s : (List<Employee>)request.getAttribute("students")){ %>
                    <tr>
                        <td><%= s.getEmployee_id()  %></td>
                        <td><%= s.getEmployee_name()  %></td>
                        <td><%= s.getEmail()  %></td>
                        <td><%= s.getPhone_number()  %></td>
                        <td><%= s.getBirthday()  %></td>
                        <td><a href="edit-student?id=<%= s.getEmployee_id() %>">Edit</a> </td>
                        <td><a class="text-danger" onclick="deleteStudent(<%= s.getEmployee_id() %>)" href="javascript:void(0);">Delete</a> </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
<script type="text/javascript">
    function deleteStudent(id) {
        if(confirm("Are you sure?")) {
            var url = `list-employee?id=` + id;
            fetch(url, {
                method: 'DELETE'
                // body: formData
            }).then(rs => {
                if (confirm("Delete successfully! Reload page?"))
                    window.location.reload();
            }).error(err => {
                alert(err)
            })
        }
    }
    function likeStudent(id){
        if(confirm("Are you sure?")) {
            var url = `list-student?id=` + id;
            fetch(url, {
                method: 'POST'
                // body: formData
            }).then(rs => {
                if (confirm("Like student successfully! Reload page?"))
                    window.location.reload();
            }).error(err => {
                alert(err)
            })
        }
    }
</script>
</body>
</html>
