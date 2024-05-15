<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Novel" %>
<%@ page import="Model.Illustration" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="Controller.Java_JDBC" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Illustration</title>
    </head>
    <body>
         <form action="DeleteIllustration" method="get" >
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
        <br>
        <input type="submit" value="Choose Novel ">

    </form>
                <%
                    List<Illustration> illuList = (List<Illustration> )request.getAttribute("illuList"); 
                if (illuList != null){
                %>
                <form action="DeleteIllustration" method="post" >
        <label for="IllustrationId">Select a Illustration</label>
        <select name="IllustrationId">
            <%
              
               
                    for (Illustration illu : illuList) {
            %>
            <option value="<%= illu.getIllustrationId() %>"><%= illu.getIlluName() %></option>
            <% }
                
            %>
        </select>
        <br>
        
        <input type="submit" value="Choose Illu ">

    </form>
                
                
                
                <%
                    } 
               
                %>
    </body>
</html>
