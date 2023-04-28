<%@ page import="model.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Comp
  Date: 28.04.2023
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Book</title>
</head>
<%
    List<Author> authors = (List<Author>) request.getAttribute("authors");
    User user = (User) session.getAttribute("user");
%>

<body>
<a href="/books"> Back </a>

<h2>Create Book</h2>
<form action="/createBook" method="post" enctype="multipart/form-data">
    <input name="user_id" type="hidden" value="<%=user.getId()%>">
   title: <input type=" text" name="title"><br>
    description: <input type="text" name="description"><br>
    price: <input type="text" name="price"><br>

    company:
    <select name="author_id">
        <% for (Author author : authors) { %>
        <option value="<%=author.getId()%>"><%=author.getName()%> <%=author.getSurname()%>
        </option>
        <% }%>
    </select><br>
    image:
    <input type="file" name="profilePic"><br>
    <input type="submit" value="create">
</form>

</body>
</html>
