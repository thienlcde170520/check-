<%-- 
    Document   : EditNovelTypeAuthor
    Created on : Mar 14, 2024, 8:22:15 AM
    Author     : LENOVO
--%>
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
<%@ page import="Model.Novel" %>

<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Novel Type Author</title>
    </head>
    <body>
          <% 
         java.sql.Connection con = Java_JDBC.getConnectionWithSqlJdbc();
         ArrayList<Novel> novels = Java_JDBC.getAllNovels(con); 
         ArrayList<Genre> genres =Java_JDBC.getAllGenres(con) ;
         ArrayList<Theme> themes =Java_JDBC.getAllThemes(con);
         ArrayList<Format> formats =Java_JDBC.getAllFormats(con);
            ArrayList<Author> authors =Java_JDBC.getAllAuthors(con);
%><form action="EditTypeAuthorServlet" method="post">
    <h1>Edit Type and Author of Novel</h1>

    <!-- Novel selection -->
    <label for="novelId">Select a Novel:</label>
    <select id="novelId" name="novelId">
        <% for (Novel novel : novels) { %>
            <option value="<%= novel.getNovelId() %>"><%= novel.getNovelName() %></option>
        <% } %>
    </select><br>
    <!-- Format (multi-choice) -->
    <label for="inclusiveFormat">Inclusive Format:</label><br>
    <select id="inclusiveFormat" name="inclusiveFormat" multiple >
        <% for (Format format : formats) { %>
            <option value="<%= format.getTypeId() %>"><%= format.getTypeOfFormat() %></option>
        <% } %>
    </select><br>

    <label for="exclusiveFormat">Exclusive Format:</label><br>
    <select id="exclusiveFormat" name="exclusiveFormat" multiple >
        <% for (Format format : formats) { %>
            <option value="<%= format.getTypeId() %>"><%= format.getTypeOfFormat() %></option>
        <% } %>
    </select><br>

    <!-- Theme (multi-choice) -->
    <label for="inclusiveTheme">Inclusive Theme:</label><br>
    <select id="inclusiveTheme" name="inclusiveTheme" multiple >
        <% for (Theme theme : themes) { %>
            <option value="<%= theme.getTypeId() %>"><%= theme.getTypeOfTheme() %></option>
        <% } %>
    </select><br>

    <label for="exclusiveTheme">Exclusive Theme:</label><br>
    <select id="exclusiveTheme" name="exclusiveTheme" multiple >
        <% for (Theme theme : themes) { %>
            <option value="<%= theme.getTypeId() %>"><%= theme.getTypeOfTheme() %></option>
        <% } %>
    </select><br>

    <!-- Genre (multi-choice) -->
    <label for="inclusiveGenre">Inclusive Genre:</label><br>
    <select id="inclusiveGenre" name="inclusiveGenre" multiple >
        <% for (Genre genre : genres) { %>
            <option value="<%= genre.getTypeId() %>"><%= genre.getTypeOfGenre() %></option>
        <% } %>
    </select><br>

    <label for="exclusiveGenre">Exclusive Genre:</label><br>
    <select id="exclusiveGenre" name="exclusiveGenre" multiple >
        <% for (Genre genre : genres) { %>
            <option value="<%= genre.getTypeId() %>"><%= genre.getTypeOfGenre() %></option>
        <% } %>
    </select><br>

    <!-- Author (multi-choice) -->
    <label for="inclusiveAuthor">Inclusive Author:</label><br>
    <select id="inclusiveAuthor" name="inclusiveAuthor" multiple >
        <% for (Author author : authors) { %>
            <option value="<%= author.getAuthorId() %>"><%= author.getAuthorName() %></option>
        <% } %>
    </select><br>

    <label for="exclusiveAuthor">Exclusive Author:</label><br>
    <select id="exclusiveAuthor" name="exclusiveAuthor" multiple >
        <% for (Author author : authors) { %>
            <option value="<%= author.getAuthorId() %>"><%= author.getAuthorName() %></option>
        <% } %>
    </select><br>

    <!-- Submit Button -->
    <input type="submit" value="Upload Chapter">
</form>



    </body>
</html>
