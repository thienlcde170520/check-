<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Author</title>
</head>
<body>
    <h2>Add Author</h2>
    <form action="AddAuthorNameServlet" method="post">
        Author ID: <input type="text" name="authorId"><br>
        Author Name: <input type="text" name="authorName"><br>
        Author Description: <input type="text" name="authorDescription"><br>
        <input type="submit" value="Add Author">
    </form>
    <h2>Add Author Result</h2>
    <p>${requestScope.mes}</p>
</body>
</html>
