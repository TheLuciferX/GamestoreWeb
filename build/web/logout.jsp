<%-- 
    Document   : logout
    Created on : 23-Apr-2020, 23:00:06
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.setAttribute("email", null);
            session.setAttribute("fname", null);
            session.setAttribute("lname", null);
            session.setAttribute("admin", null);
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
