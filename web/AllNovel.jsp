<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="Model.Novel" %>
<%@ page import="Model.Author" %>
<%@ page import="Model.Illustration" %>
<%@ page import="Model.IllustrationList" %>
<%@ page import="Controller.Java_JDBC" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of Novels</title>
</head>
<body>
    <h1>List of Novels</h1>
    
    <% 
        java.sql.Connection con = Java_JDBC.getConnectionWithSqlJdbc();
        List<Novel> novels = Java_JDBC.getAllNovels(con); // Replace with your actual method to retrieve novels
        novels.sort((novel1, novel2) -> novel1.getPublicationYear().compareTo(novel2.getPublicationYear()));
        
        // Iterate over the list of novels and print each novel's information
        for (Novel novel : novels) {
    %>
        <div>
            <h2><%= novel.getNovelName() %></h2>
            <p>Description: <%= novel.getDescription() %></p>
            <% 
                ArrayList<Author> authors = (ArrayList<Author>) Java_JDBC.getAuthorByNovel(con, novel);
                if (authors != null && !authors.isEmpty()) {
                    out.println("<h3>Authors</h3>");
                    for (Author author : authors) {
                        out.println("<p>" + author.getAuthorName() + "</p>");
                    }
                }
            %>
            
            <!-- Display illustrations for the current novel -->
            <%
                IllustrationList illustrationList = Java_JDBC.getIllustrationListByNovel(con, novel);
                if (illustrationList != null) {
                    for (Map.Entry<Novel, List<Illustration>> entry : illustrationList.getIllustrationsForNovel().entrySet()) {
                        List<Illustration> illustrations = entry.getValue();
                        for (Illustration illustration : illustrations) {
                            // Replace the local file system path with a relative path
                            String relativeImagePath = illustration.getIllutrastionLink()
                                    .replace("E:\\FPT UNI\\HoaiNTT40-SP24-PRJ301-Web-based Java Applications\\Final_Project_PRJ301\\web\\", "");
            %>
            <!-- Add hyperlink to each illustration -->
            <a href="NovelDetailsServlet?novelId=<%= novel.getNovelId() %>">
                <img src="<%= relativeImagePath %>">
            </a>
            <%                  
                            // Break after displaying the first illustration
                            break;
                        }
                    }
                }
            %>
            
            <!-- Add a hyperlink to novelDetail.jsp with novelId as a parameter -->
            <a href="NovelDetailsServlet?novelId=<%= novel.getNovelId() %>">View Details</a>
        </div>
    <%
        }
    %>
    <h1><a href="Home.jsp">Back to Home</a></h1>
</body>
</html>
