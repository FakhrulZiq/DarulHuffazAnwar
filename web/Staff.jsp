<%-- 
    Document   : Staff
    Created on : Nov 29, 2022, 2:42:09 AM
    Author     : AreZieq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tahfiz Darul Anwar</title>
    </head>
    <body>
        <%
            if(session.getAttribute("login")==null || session.getAttribute("login")==" ") {//check condition unauthorize user not direct access welcome.jsp page
                response.sendRedirect("login.jsp"); 
            }
        %>
        <h1>Staff</h1>
        <a href="logout.jsp">Logout</a>
    </body>
</html>
