<%-- 
    Document   : novelDetail
    Created on : Mar 8, 2024, 10:18:11 AM
    Author     : LENOVO
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Novel" %>
<%@ page import="Model.Chapter" %>
<%@ page import="Model.Author" %>
<%@ page import="Model.ChapterList" %>
<%@ page import="Model.Admin" %>
<%@ page import="Model.Customer" %>

<%@ page import="Model.Format" %>
<%@ page import="Model.Theme" %>
<%@ page import="Model.Genre" %>
<%@ page import="Model.IllustrationList" %>
<%@ page import="Model.Illustration" %>
<%@ page import="Controller.Java_JDBC" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.Map" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Novel Details</title>
</head>
<body>
 <h1>Novel Details</h1>
    
   <h2>Name </h2>
    <% String name = (String) request.getAttribute("name"); %>
    <%= name %>

    <h2>Description</h2>
    <% String description = (String) request.getAttribute("description"); %>
    <%= description %>
<h1>List of Authors</h1>
      <%
        ArrayList<Author> authors = (ArrayList<Author>) request.getAttribute("authors");
        if (authors != null && !authors.isEmpty()) {
    %>
            <h3>Authors</h3>
            <%
                for (Author author : authors) {
            %>
                    <a href='authorDetailServlet?authorId=<%= author.getAuthorId() %>'><%= author.getAuthorName() %></a><br>
            <%
                }
            %>
    <%
        }
    %>


    <h2>Illustrations</h2>
    <% 
        IllustrationList illustrationList = (IllustrationList) request.getAttribute("illustration");
        if (illustrationList != null) {
            for (Map.Entry<Novel, List<Illustration>> entry : illustrationList.getIllustrationsForNovel().entrySet()) {
                List<Illustration> illustrations = entry.getValue();
                for (Illustration illustration : illustrations) {
                    // Replace the local file system path with a relative path
                    String relativeImagePath = illustration.getIllutrastionLink()
                            .replace("‪D:\\PRJ301\\Final_Project_PRJ301\\web", "");
    %>
                    <img src="<%= relativeImagePath %>">
    <%          }
            }
        }
ArrayList<Format> formats = (ArrayList<Format>) request.getAttribute("formats");
        if (formats != null && !formats.isEmpty()) {
            out.println("<h3>Formats</h3>");
            for (Format format : formats) {
                out.println(format.getTypeOfFormat() + "<br>");
            }
        }

        // Print themes
        ArrayList<Theme> themes = (ArrayList<Theme>) request.getAttribute("themes");
        if (themes != null && !themes.isEmpty()) {
            out.println("<h3>Themes</h3>");
            for (Theme theme : themes) {
                out.println(theme.getTypeOfTheme() + "<br>");
            }
        }

        // Print genres
        ArrayList<Genre> genres = (ArrayList<Genre>) request.getAttribute("genres");
        if (genres != null && !genres.isEmpty()) {
            out.println("<h3>Genres</h3>");
            for (Genre genre : genres) {
                out.println(genre.getTypeOfGenre() + "<br>");
            }
        
    }
 Novel novel = (Novel) request.getAttribute("novel");
%>
<%
        ChapterList chapterList = (ChapterList) request.getAttribute("chapterList");
    if (chapterList != null) {
       
        List<Chapter> chapters = chapterList.getChaptersForNovel(novel);

        if (chapters != null && !chapters.isEmpty()) {
            int flag = 1; // Assuming initial flag value is 1

            %>
            <h3>Chapters for <%= novel.getNovelName() %></h3>
            <ul>
                <% for (Chapter chapter : chapters) {
                    String relativeChapterPath = chapter.getLinkContent()
                            .replace("D:\\PRJ301\\Final_Project_PRJ301\\web\\Novel\\", "");
                %>
                <li><%= relativeChapterPath %></li>
              <form action="readNovelServlet" method="get">
    <input type="hidden" name="novelId" value="<%= novel.getNovelId() %>">
    <input type="hidden" name="flag" value="<%= flag %>">
    <input type="submit" value="Read Chapter">
</form>
      
                

                <% 
                    flag++;
                } %>
                
                
                
             <%
    // Retrieve HttpSession object from the request
    HttpSession session1 = request.getSession();

    // Try to retrieve the "account" attribute from the session and cast it to Customer
    Customer customer = null;
    Admin admin = null;
    try {
        customer = (Customer) session1.getAttribute("account");
    } catch (ClassCastException e) {
        try {
            admin = (Admin) session1.getAttribute("account");
        } catch (ClassCastException ex) {
            // Handle the case where the attribute cannot be cast to Admin
            // Log the exception or perform other error handling
            ex.printStackTrace(); // Example: print the stack trace
        }
    }

    if (customer != null) {
%>
        <form action="FollowNovelServlet" method="post">
            <input type="hidden" name="novelId" value="<%= novel.getNovelId() %>">
            <input type="submit" value="Follow" >
        </form>
        <form action="UnFollowNovelServlet" method="post">
            <input type="hidden" name="novelId" value="<%= novel.getNovelId() %>">
            <input type="submit" value="UnFollow" >
        </form>
        <a href="FollowListServlet">Back to Follow List</a>
<%
    } else if (admin != null) {
%>
        <!-- Add admin-specific functionality here if needed -->
<% 
        } 
}
}

%>

    <h1><a href="Home.jsp">Back to Home</a></h1>
  
</body>
</html>