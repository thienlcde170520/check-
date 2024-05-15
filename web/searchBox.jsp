<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Novel" %>
<%@ page import="Model.Illustration" %>
<%@ page import="Model.IllustrationList" %>
<%@ page import="Controller.Java_JDBC" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search Results</title>
    <style>
        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            width: 40%;
        }
        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }
        .container {
            padding: 2px 16px;
        }
    </style>
</head>
<body>
    <%
        ResultSet rs = (ResultSet) request.getAttribute("resultSet");
        if (rs != null && rs.next()) {
            do {
    %>
                <div class="card">
                    <div class="container">
                        <h4><b><%= rs.getString("NovelName") %></b></h4>
                        <p><a href="NovelDetailsServlet?novelId=<%= rs.getString("NovelID") %>">View Details</a></p>
                    </div>
                </div>
    <%
            } while (rs.next());
        } else {
    %>
            <p>No results found.</p>
    <%
        }
    %>
</body>
</html>
