<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Admin" %>
<%@ page import="Model.Customer" %>
<%@ page import="Model.Users" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Novel" %>
<%@ page import="Model.Chapter" %>
<%@ page import="Model.Author" %>
<%@ page import="Model.ChapterList" %>
<%@ page import="Model.Format" %>
<%@ page import="Model.Theme" %>
<%@ page import="Model.Genre" %>
<%@ page import="Model.IllustrationList" %>
<%@ page import="Model.Illustration" %>
<%@ page import="Controller.Java_JDBC" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Random" %>

<%
    // Check if a valid user is logged in
    if (session.getAttribute("account") == null) {
        // Redirect to login page if not logged in
        response.sendRedirect("Login.jsp");
        return; // Exit the JSP execution
    }
    java.sql.Connection con = Java_JDBC.getConnectionWithSqlJdbc();
    List<Novel> novels = Java_JDBC.getAllNovels(con);

    // Select a random novel from the list
    Random random = new Random();
    Novel randomNovel = novels.get(random.nextInt(novels.size()));

    // Retrieve illustration list for the random novel
   
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
</head>
<body>
     <h1>Hello ${sessionScope.account.name}</h1>
    <div>
        <a href="logoutServ">LOG OUT</a><br/>
    </div>
    <h2> Novel: <%= randomNovel.getNovelName() %></h2>
    <h3>Illustrations:</h3>
    <% IllustrationList illustrationList = Java_JDBC.getIllustrationListByNovel(con, randomNovel);
        if (illustrationList != null) {
            for (Map.Entry<Novel, List<Illustration>> entry : illustrationList.getIllustrationsForNovel().entrySet()) {
                List<Illustration> illustrations = entry.getValue();
                for (Illustration illustration : illustrations) {
                    // Replace the local file system path with a relative path
                    String relativeImagePath = illustration.getIllutrastionLink()
                            .replace("E:\\FPT UNI\\HoaiNTT40-SP24-PRJ301-Web-based Java Applications\\Final_Project_PRJ301\\web\\", "");
    %>
 <a href="NovelDetailsServlet?novelId=<%= randomNovel.getNovelId() %>"><img src="<%= relativeImagePath %>"></a>


    <%              // Break after displaying the first illustration
                    break;
                }
            }
        }
    %>
    <div>
            <form action="SearchServlet" method="get">
                <label for="searchType">Search by:</label>
                <select id="searchType" name="searchType">
                    <option value="NovelName">Novel Name</option>
                    <option value="NovelFormat">Novel Format</option>
                    <option value="NovelTheme">Novel Theme</option>
                    <option value="NovelGenre">Novel Genre</option>
                </select>
                <label for="query">Search term:</label>
                <input type="text" id="query" name="query">
                <input type="submit" value="Search">
            </form>
        </div>
          <div>
            <a href="AddTypeAuthor.jsp">Add category and author</a><br/>
        </div>
    <div>
        <a href="AllNovel.jsp">All Novel</a><br/>
    </div>
  
        <div>
            <a href="addNovel.jsp">Add Novel</a><br/>
        </div>
     <div>
            <a href="AddIllustrationServlet">Add Novel Illustrations</a><br/>
        </div>
    
<div>
            <a href="UploadChapterServlet">Add Chapter</a><br/>
        </div>
      <div>
            <a href="EditNovel.jsp">Edit Novel</a><br/>
        </div>
       <div>
    <a href="EditNovelTypeAuthor.jsp">Edit category and author</a><br/>
</div>
        <div>
            <a href="FollowListServlet">Bookshelf</a><br/>
        </div>
      <div>
            <a href="LastestUpdateServlet">Latest Update</a><br/>
        </div>
    <div>
            <a href="DeleteTypeAuthor.jsp">Delete category and author</a><br/>
        </div>
     <div>
            <a href="InformationCus">Account</a><br/>
        </div>
      <div>
            <a href="DeleteChapter">Delete Chapter</a><br/>
        </div>
    <div>
            <a href="DeleteIllustration">Delete IlluStration</a><br/>
            
        </div>
     <div>
            <a href="DeleteNovelServlet">Delete Novel</a><br/>
            
        </div>
</body>
</html>
