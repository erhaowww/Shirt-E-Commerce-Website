<%-- 
    Document   : redirect
    Created on : Apr 16, 2022, 2:48:34 AM
    Author     : star
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            function pageRedirect() {
                window.location.replace("http://localhost:8080/Peace/secureStaff/Peace.jsp");
            }
            setTimeout("pageRedirect()", 0);
        </script>
    </body>
</html>
