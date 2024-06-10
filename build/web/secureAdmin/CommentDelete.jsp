<%-- 
    Document   : CommentDelete
    Created on : Apr 7, 2022, 1:58:01 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("commentUser"));
            response.sendRedirect("CommentDelete?commentUser="+id);
        %>

    </body>
</html>
