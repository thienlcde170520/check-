<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Novel" %>
<%@ page import="Model.Customer" %>
<%@ page import="Model.FollowList" %>
<%@ page import="Controller.Java_JDBC" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="Model.IllustrationList" %>
<%@ page import="Model.Illustration" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Follow List</title>
</head>
<body>
    <h1>Follow List</h1>
    <%
java.sql.Connection con = Java_JDBC.getConnectionWithSqlJdbc();

        FollowList followList = (FollowList) request.getAttribute("followList");
        Map<Customer, List<Novel>> customerNovelMap = followList.getCustomerNovelMap();
        
        // Iterate over the map entries
        Set<Entry<Customer, List<Novel>>> entrySet = customerNovelMap.entrySet();
        for (Entry<Customer, List<Novel>> entry : entrySet) {
            Customer customer = entry.getKey();
            List<Novel> novels = entry.getValue();
            
            // Print customer details
            out.println("<h2>Customer: " + customer.getName() + "</h2>");
            
            // Iterate over the novels for the current customer
            for (Novel novel : novels) {
                // Retrieve illustration list for the current novel
                IllustrationList illustrationList = Java_JDBC.getIllustrationListByNovel(con, novel);
                if (illustrationList != null) {
                    // Iterate over the illustrations for the current novel
                    for (Map.Entry<Novel, List<Illustration>> entry2 : illustrationList.getIllustrationsForNovel().entrySet()) {
                        List<Illustration> illustrations = entry2.getValue();
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
           
                // Generate button to navigate to novelDetailServlet for each novel
    %>
    <form action='NovelDetailsServlet' method='get'>
        <input type='hidden' name='novelId' value='<%= novel.getNovelId() %>'>
        <button type='submit'><%= novel.getNovelName() %></button>
    </form><br>
    <%
            }
        }
    %>

    <h1><a href="Home.jsp">Back to Home</a></h1>
</body>
</html>
