<%-- 
    Document   : Login
    Created on : Feb 26, 2024, 7:03:34 PM
    Author     : ASUS
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
        <style>
        .red {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
        </style>
    </head>
    <body>
        <h1>Login !!!</h1>
        <%--<h3 style="color:red">${requestScope.error}</h3> --%>
        <c:if test="${not empty error}">
        <div class="${red ? 'red' : ''}">
            ${error}
        </div>
        </c:if>
        
        <form action="LoginServlet" method="post">
            Enter username: <input type="text" name="name" value="${cookie.name.value}" placeholder="name"/><br/>
            Enter email: <input type="text" name="email" value="${cookie.email.value}" placeholder="...@gmail.com"><br/>
            Enter password: <input type="password" name="pass" value="${cookie.pass.value}" placeholder="password"/><br/>
            <input type="checkbox" ${(cookie.remember.value eq 'ON')? "checked":""} name="remember" value="ON"/>Remember account<br/>
            <input type="submit" value="LOGIN"<!-- comment -->
        </form>
            <div> 
                
                <c:choose>
                    <c:when test="${empty param.signUp}">
                        <a href="?signUp=true">Sign Up</a>
                    </c:when>
                    <c:otherwise>
                        <c:redirect url="SignUp.jsp"/>
                    </c:otherwise>
                </c:choose>
            <%--<a href="SignUpController">Sign Up</a><br/> --%>
            
            </div>
    </body>
</html>
