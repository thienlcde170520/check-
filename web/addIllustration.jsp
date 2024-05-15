<%-- 
    Document   : addIllustration
    Created on : Mar 15, 2024, 12:00:42 AM
    Author     : tuanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="Controller.Java_JDBC" %>
<%@ page import="Model.Novel" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Illustration</title>
    </head>
    <body>

        <form action="AddIllustrationServlet" method="post" enctype="multipart/form-data">
            <label for="novelId">Select a Novel:</label>
            <select name="novelId">
                <% 
                ArrayList<Novel> novels = (ArrayList<Novel>) request.getAttribute("novels");
                if (novels !=null){
                for (Novel novel : novels) {
                %>
                <option value="<%= novel.getNovelId() %>"><%= novel.getNovelName() %></option>
                <% }
                }%>
            </select>
            <br>
            <label for="file">Choose file (JPG or PNG only):</label>
    <input type="file" id="file" name="file" accept=".jpg, .png" required><br><br>

            <input type="submit" value="Upload">
        </form>

    </body>
</html>
