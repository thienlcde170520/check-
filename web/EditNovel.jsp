<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Novel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Controller.Java_JDBC" %>
<%@ page import="Model.Novel" %>
<%@ page import="Model.Chapter" %>
<%@ page import="Model.Author" %>
<%@ page import="Model.ChapterList" %>
<%@ page import="Model.Format" %>
<%@ page import="Model.Theme" %>
<%@ page import="Model.Genre" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Novel</title>
    <link rel="stylesheet" type="text/css" href="css/addNovel.css">
</head>
<body>
    
     <% 
         java.sql.Connection con = Java_JDBC.getConnectionWithSqlJdbc();
         ArrayList<Novel> novels = Java_JDBC.getAllNovels(con); 
         ArrayList<Genre> genres =Java_JDBC.getAllGenres(con) ;
         ArrayList<Theme> themes =Java_JDBC.getAllThemes(con);
         ArrayList<Format> formats =Java_JDBC.getAllFormats(con);
            ArrayList<Author> authors =Java_JDBC.getAllAuthors(con);
%>
 <form action="EditNovelServlet" method="post">
    <h1>Edit Novel</h1>

    <!-- Novel selection -->
    <label for="novelId">Select a Novel:</label>
    <select id="novelId" name="novelId">
        <% for (Novel novel : novels) { %>
            <option value="<%= novel.getNovelId() %>"><%= novel.getNovelName() %></option>
        <% } %>
    </select><br>

    <!-- Language -->
    <label for="novelLanguage">Language:</label><br>
    <input type="text" id="novelLanguage" name="novelLanguage" required><br>

    <!-- Name -->
    <label for="novelName">Name:</label><br>
    <input type="text" id="novelName" name="novelName" required><br>

    <!-- Profit -->
    <label for="profit">Profit:</label><br>
    <input type="text" id="profit" name="profit" required><br>

    <!-- License fee -->
    <label for="licenseProfit">License fee:</label><br>
    <input type="text" id="licenseProfit" name="licenseProfit" required><br>

    <!-- Publication Year -->
    <label for="publicationYear">Publication Year (yyyy-MM-dd):</label><br>
    <input type="text" id="publicationYear" name="publicationYear" placeholder="yyyy-MM-dd" required><br>

    <!-- Publication Status -->
    <label for="publicationStatus">Publication Status:</label><br>
    <select id="publicationStatus" name="publicationStatus" required>
        <option value="Ongoing">Ongoing</option>
        <option value="Completed">Completed</option>
        <option value="Hiatus">Hiatus</option>
        <option value="Cancelled">Cancelled</option>
    </select><br>

    <!-- Description -->
    <label for="description">Description:</label><br>
    <textarea id="description" name="description" required></textarea><br>

    <!-- Submit Button -->
    <input type="submit" value="Upload Chapter">
</form>
 

    
</body>
</html>
