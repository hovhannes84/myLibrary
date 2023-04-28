<%@ page import="model.Book" %>
<%@ page import="model.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Comp
  Date: 28.04.2023
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Book</title>
</head>
<%User user = (User) session.getAttribute("user");%>
<body>

<% Book book = (Book) request.getAttribute("book"); %>

<% List<Author> authors = (List<Author>) request.getAttribute("authors"); %>
<a href="/books"> Back </a>

<h2>Update Book</h2>
<form action="/updateBook" method="post">
    <input name="id" type="hidden" value="<%=book.getId()%>">
    <input name="user_id" type="hidden" value="<%=user.getId()%>">
    title: <input type="text" name="title" value="<%=book.getTitle()%>"><br>
    description: <input type="text" name="description" value="<%=book.getDescription()%>"><br>
    price:<input type="text" name="price" value="<%=book.getPrice()%>"><br>
    author:
    <select name="author_id">
        <% for (Author author : authors) { %>
        <option value="<%=author.getId()%>"><%=author.getName()%></option>
        <% }%>
    </select>

    <input type="submit" value="update">
</form>
</body>
</html>
