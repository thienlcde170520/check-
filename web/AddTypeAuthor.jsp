<%-- 
    Document   : AddTypeAuthor
    Created on : Mar 15, 2024, 7:32:39 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Type Author</title>
    </head>
    <body>
        <jsp:include page="addAuthorName.jsp" />
          <jsp:include page="addTheme.jsp" />
            <jsp:include page="addGenre.jsp" />
              <jsp:include page="addFormat.jsp" />
    </body>
</html>
