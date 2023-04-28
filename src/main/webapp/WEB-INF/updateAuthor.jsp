<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: Comp
  Date: 28.04.2023
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Author</title>
</head>

<body>
<% Author author = (Author) request.getAttribute("author"); %>
<a href="/authors"> Back </a>

<h2>Update Author</h2>
<form action="/updateAuthor" method="post">
    <input name="id" type="hidden" value="<%=author.getId()%>">
    name: <input type="text" name="name" value="<%=author.getName()%>"><br>
    surname: <input type="text" name="surname" value="<%=author.getSurname()%>"><br>
    email:<input type="text" name="email" value="<%=author.getEmail()%>">
    age: <input type="text" name="age" value="<%=author.getAge()%>"> <br>
    <input type="submit" value="update">
</form>

</body>
</html>
