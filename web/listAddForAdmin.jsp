<%-- 
    Document   : listSave
    Created on : Mar 8, 2024, 6:40:53 PM
    Author     : ASUS
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Novel" %>
<%@ page import="Model.Admin" %>
<%@ page import="Model.Chapter" %>
<%@ page import="Model.ChapterList" %>
<%@ page import="Model.AddList" %>
<%@ page import="Model.Format" %>
<%@ page import="Model.Theme" %>
<%@ page import="Model.Genre" %>
<%@ page import="Model.IllustrationList" %>
<%@ page import="Model.Illustration" %>
<%@ page import="Controller.Java_JDBC" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>


 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Follow List</title>
</head>
<body>
    <h1>Follow List</h1>
    
    <% 
        AddList addList = (AddList) request.getAttribute("addList");
        Map<Admin, List<Novel>> adminNovelMap = addList.getAdminNovelMap();
        
        Set<Entry<Admin, List<Novel>>> entrySet = adminNovelMap.entrySet();
        for (Entry<Admin, List<Novel>> entry : entrySet) {
            Admin admin = entry.getKey();
            List<Novel> novels = entry.getValue();
            
            // Print admin details
            out.println("<h2>Admin: " + admin.getName() + "</h2>");
            
            // Iterate over the novels for the current admin
for (Novel novel : novels) {
    // Generate button to navigate to novelDetailServlet for each novel
    out.println("<form action='NovelDetailsServlet' method='get'>");
    out.println("<input type='hidden' name='novelId' value='" + novel.getNovelId() + "'>");
    out.println("<button type='submit'>" + novel.getNovelName() + "</button>");
    out.println("</form><br>");
}

        }
    %>

    <h1><a href="Home.jsp">Back to Home</a></h1>
    </body>
</html>
