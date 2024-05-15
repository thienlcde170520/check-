<%-- 
    Document   : deleteNovel
    Created on : Mar 16, 2024, 5:34:56 PM
    Author     : tuanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Novel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="Controller.Java_JDBC" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Novel</title>
    </head>
    <body>
         <form action="DeleteNovelServlet" method="post">
            <label for="novelId">Select a Novel:</label>
            <select name="novelId">
                <%
              

            ArrayList<Novel> novels = ( ArrayList<Novel>)request.getAttribute("novels");
               
                        for (Novel novel : novels) {
                %>
                <option value="<%= novel.getNovelId() %>"><%= novel.getNovelName() %></option>
                <% }
                
                %>
            </select>
             <br><br>
        <input type="submit" value="Delete Novel">
         </form>
            
    </body>
</html>
