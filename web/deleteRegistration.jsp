<%-- 
    Document   : deleteRegistration
    Created on : Jan 11, 2023, 4:08:03 AM
    Author     : AreZieq
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String id=request.getParameter("id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/s59583_otms", "s59583", "s595832w#");
        Statement st=conn.createStatement();
        int i=st.executeUpdate("DELETE FROM student WHERE StudID="+id);
         response.sendRedirect("viewRegistration.jsp"); //after login success redirect to viewStaff.jsp page
    } catch(Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>

