<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Comp
  Date: 28.04.2023
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<% User user = (User) session.getAttribute("user"); %>
Welcome <%=user.getName()%> <%=user.getSurname()%> <a href="/logout">logout</a> <br>
<a href="/books"> Books</a> |
<a href="/authors"> Authors</a>
</body>
</html>
