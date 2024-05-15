<!DOCTYPE html>
<html>
<head>
    <title>Add Genre</title>
</head>
<body>
    <h2>Add Genre</h2>
    <form action="AddGenreServlet" method="post">
        Type ID: <input type="text" name="typeId"><br>
        Type of Genre: <input type="text" name="typeOfGenre"><br>
        <input type="submit" value="Add Genre">
    </form>
    <p>${message}</p>
</body>
</html>
