<!DOCTYPE html>
<html>
<head>
    <title>Add Theme</title>
</head>
<body>
    <h2>Add Theme</h2>
    <form action="AddThemeServlet" method="post">
        Type ID: <input type="text" name="typeId"><br>
        Type of Theme: <input type="text" name="typeOfTheme"><br>
        <input type="submit" value="Add Theme">
    </form>
    <p>${message}</p>
</body>
</html>
