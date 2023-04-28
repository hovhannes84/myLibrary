<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Comp
  Date: 28.04.2023
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Author</title>
</head>

<body>
<a href="/authors"> Back </a>
<h2>Create Author</h2>
<form action="/createAuthor" method="post">
  name: <input type="text" name="name"><br>
  surname:<input type="text" name="surname"><br>
  email:<input type="text" name="email"><br>
  age:<input type="text" name="age"><br>
  country:
  <input type="submit" value="create">
</form>
</body>
</html>
