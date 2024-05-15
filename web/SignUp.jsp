<%-- 
    Document   : SingUp
    Created on : Feb 26, 2024, 9:57:36 PM
    Author     : ASUS
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <style>
        p{
            color: red;
            margin: 10px;
        }
    </style>
    <body>
        
        <form action="SignUpServlet" method="post">
            
                <p class="text-danger">${mess}</p> 
            
                <label>First Name:</label> <input type="text" name="firstname" placeholder="firstname"/>
                <br/>
                <label>Last Name:</label> <input type="text" name="lastname" placeholder="lastname"/>
                <br/>
                <label>Date Of Birth:</label><input type="date" name="birthday" pattern="\d{1,2}/\d{1,2}/\d{4}" placeholder="MM/DD/YYYY" required/>
                <br/>
                <label>Email:</label> <input type="text" name="email" placeholder="email"/>
                <br/>
                <br/>
                <label>Username:</label> <input type="text" name="username" placeholder="Username"/>
                <br/>
                <br/>
                <label>Password:</label> <input type="password" name="pass" placeholder="password"/>
                <br/>
                <br/>
                <label>Confirm pass:</label><input type="password" name="cpass" placeholder="Confirm password"/>
                <button type="submit">Register</button>
                <%--<a href="Login.jsp">Back</a><br/>--%>
                
                <c:choose>
                    <c:when test="${empty param.login}">
                        <a href="?login=true">Back</a>
                    </c:when>
                    <c:otherwise>
                        <c:redirect url="Login.jsp"/>
                    </c:otherwise>
                </c:choose>
                
        </form> 
        <%--        
        <h3>${requestScope.error2}</h3>
        <h3>${requestScope.error3}</h3>
        --%>
    </body>
</html>
