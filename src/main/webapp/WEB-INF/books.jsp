<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="model.UserType" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Comp
  Date: 28.04.2023
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
</head>
<% List<Book> books = (List<Book>) request.getAttribute("books");
    User user = (User) session.getAttribute("user");%>
<body>
<a href="/"> Back </a>
<h2>Books</h2> <a href="/createBook">Create Book</a>
<table border="1">
    <tr>
        <th>image</th>
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>price</th>
        <th>author name</th>
        <th>user_id</th>
        <th>action</th>
    </tr>

    <% if (books != null && !books.isEmpty()) {%>
    <% for (Book book : books) { %>
    <% if (book.getUser_id() == user.getId()) {%>
    <tr>
        <td>
            <%if (book.getPicName() == null || book.getPicName().equals("nuul")) {%>
            <img src="/image/default_pic.jpg" width="50">
            <%} else {%>
            <a href="/getImage?picName=<%=book.getPicName()%>"> <img src="/getImage?picName=<%=book.getPicName()%>"
                                                                     width="50"></a></td>
        <%}%>
        <td><%=book.getId()%>
        </td>
        <td><%=book.getTitle()%>
        </td>
        <td><%=book.getDescription()%>
        </td>
        <td><%=book.getPrice()%>
        </td>
        <td><%=book.getAuthor().getName()%>
        </td>
        <td><%=book.getUser_id()%>
        </td>

        <td><a href="/removeBook?id=<%=book.getId()%>">Delete</a>
            / <a href="updateBook?id=<%=book.getId()%>">Update</a></td>
        <%}%>
    </tr>
    <%}%>
    <%}%>
</table>

</body>
</html>
