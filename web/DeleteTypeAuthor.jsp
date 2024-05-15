<%-- 
    Document   : DeleteTypeAuthor
    Created on : Mar 14, 2024, 7:08:39 PM
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
        <title>Delete Type Author</title>
    </head>
    <body>
           <% 
         java.sql.Connection con = Java_JDBC.getConnectionWithSqlJdbc();
         ArrayList<Genre> genres =Java_JDBC.getAllGenres(con) ;
         ArrayList<Theme> themes =Java_JDBC.getAllThemes(con);
         ArrayList<Format> formats =Java_JDBC.getAllFormats(con);
            ArrayList<Author> authors =Java_JDBC.getAllAuthors(con);
%><form action="DeleteTypeAuthor" method="post">
    <h1>Delete Type and Author of Novel</h1>

   
    <label for="deleteFormat">Delete Format:</label><br>
    <select id="deleteFormat" name="deleteFormat" multiple >
        <% for (Format format : formats) { %>
            <option value="<%= format.getTypeId() %>"><%= format.getTypeOfFormat() %></option>
        <% } %>
    </select><br>

   

   
    <label for="deleteTheme">Delete Theme:</label><br>
    <select id="deleteTheme" name="deleteTheme" multiple >
        <% for (Theme theme : themes) { %>
            <option value="<%= theme.getTypeId() %>"><%= theme.getTypeOfTheme() %></option>
        <% } %>
    </select><br>

   

    <label for="deleteGenre">Delete Genre:</label><br>
    <select id="deleteGenre" name="deleteGenre" multiple >
        <% for (Genre genre : genres) { %>
            <option value="<%= genre.getTypeId() %>"><%= genre.getTypeOfGenre() %></option>
        <% } %>
    </select><br>

    <label for="deleteAuthor">Delete Author:</label><br>
    <select id="deleteAuthor" name="deleteAuthor" multiple >
        <% for (Author author : authors) { %>
            <option value="<%= author.getAuthorId() %>"><%= author.getAuthorName() %></option>
        <% } %>
    </select><br>

   

    <!-- Submit Button -->
    <input type="submit" value="Delete">
</form>
    </body>
</html>
