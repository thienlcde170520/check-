<!DOCTYPE html>
<html>
<head>
    <title>Add Format</title>
</head>
<body>
    <h2>Add Format</h2>
    <form action="AddFormatServlet" method="post">
        Type ID: <input type="text" name="typeId"><br>
        Type of Format: <input type="text" name="typeOfFormat"><br>
        <input type="submit" value="Add Format">
    </form>
    <p>${message}</p>
</body>
</html>
