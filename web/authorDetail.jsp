<%@ page import="Model.Author" %>
<%@ page import="Model.Novel" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.AuthorList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Author Detail</title>
</head>
<body>
    <h1>Author Detail</h1>
    <%
        Author author = (Author) request.getAttribute("author");
        List<Novel> novels = (List<Novel>) request.getAttribute("novels");

        if (author != null && novels != null) {
    %>
    <p><strong>Author Name:</strong> <%= author.getAuthorName() %></p>
    <p><strong>Author Description </strong> <%= author.getAuthorDescription() %></p>

    <h2>Novels by <%= author.getAuthorName() %></h2>
    <ul>
        <% for (Novel novel : novels) { %>
            <li>
                
                <a href="NovelDetailsServlet?novelId=<%= novel.getNovelId() %>"><%= novel.getNovelName() %></a>
            </li>
        <% } %>
    </ul>
    <% } else { %>
        <p>No author or novels found.</p>
    <% } %>
       <h1><a href="Home.jsp">Back to Home</a></h1>
</body>
</html>
