<%-- 
    Document   : Update
    Created on : Mar 10, 2024, 7:26:43 PM
    Author     : ASUS
--%>
<%@ page import="Model.Customer" %>
<%@ page import="Model.Users" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    <style>
        p{
            color: red;
            margin: 10px;
        }
    </style>
    <body>
        <form action="UpdateServlet" method="get">
            <p class="text-danger">${mess}</p> 
            <label>First Name: </label><input type="text" name="newFirstname" placeholder="new firstname"/>           
            <label>Last Name: </label><input type="text" name="newLastname" placeholder="new lastname"/>
            <br/>
            <br/>
            <label>New Date: </label><input type="date" name="newBirthday" pattern="\d{1,2}/\d{1,2}/\d{4}" placeholder="MM/DD/YYYY" required/>
            <label>New Email: </label><input type="text" name="newEmail" placeholder="new email"/>
            <label>New Password: </label><input type="password" name="newPassword" placeholder="new password" />
            <label>Confirm Pass: </label><input type="password" name="cpass" placeholder="confirm password"/>
            <input type="submit" value="UPDATE"<!-- comment -->           
        </form>
            
    </body>
</html>