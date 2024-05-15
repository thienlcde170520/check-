<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="Model.Novel" %>
<%@ page import="Model.Chapter" %>
<%@ page import="Model.ChapterList" %>
<%@ page import="Model.Illustration" %>
<%@ page import="Model.IllustrationList" %>
<%@ page import="Controller.Java_JDBC" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Last Update Chapter</title>
</head>
<body>
    <h1>Hello World!</h1>
    <% 
        java.sql.Connection con = Java_JDBC.getConnectionWithSqlJdbc();
        List<Novel> novels = (List<Novel>) request.getAttribute("novels");
        
        for (Novel novel : novels) {
    %>
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
    <%
        ChapterList chapterList = Java_JDBC.getChapterFromNovel(con, novel);
        if (chapterList != null) {
            List<Chapter> chapters = chapterList.getChaptersForNovel(novel);

            if (chapters != null && !chapters.isEmpty()) {
                int flag = novel.getNumberOfChapters(); // Assuming initial flag value is 1
    %>
                <h3>Chapters for <%= novel.getNovelName() %></h3>
                <ul>
                    <% 
                        // Iterate over chapters in reverse order
                        for (int i = chapters.size() - 1; i >= 0; i--) {
                            Chapter chapter = chapters.get(i);
                            String relativeChapterPath = chapter.getLinkContent()
                                    .replace("E:\\FPT UNI\\HoaiNTT40-SP24-PRJ301-Web-based Java Applications\\Final_Project_PRJ301\\web\\Novel\\", "");
                    %>
                        <li><%= relativeChapterPath %></li>
                        <li><%= chapter.getCreationDate() %></li>
                        <form action="readNovelServlet" method="get">
                            <input type="hidden" name="novelId" value="<%= novel.getNovelId() %>">
                            <input type="hidden" name="flag" value="<%= flag %>">
                            <input type="submit" value="Read Chapter">
                        </form>
                    <% 
                            flag--; 
                            break;
                        } // End of chapter iteration
                    %>
                </ul>
            <% } // End of chapters existence check %>
        <% } // End of chapterList existence check %>
    <% } // End of novels iteration %>
</body>
</html>
