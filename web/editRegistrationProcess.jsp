<%-- 
    Document   : editRegistrationProcess
    Created on : Jan 11, 2023, 3:11:45 AM
    Author     : AreZieq
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/s59583_otms";%>
<%!String user = "s59583";%>
<%!String psw = "s595832w#";%>
<%
    String studID = request.getParameter("stud_ID"); 
    String fname = request.getParameter("stud_fname"); 
    String certificationNO = request.getParameter("stud_certificateNO"); 
    String MyKid = request.getParameter("stud_MyKid"); 
    String address1 = request.getParameter("stud_address1"); 
    String address2 = request.getParameter("stud_address2"); 
    String postcode = request.getParameter("stud_poscode"); 
    String city = request.getParameter("stud_city"); 
    String state = request.getParameter("stud_state"); 
    String dob = request.getParameter("stud_dob"); 
    String sex = request.getParameter("stud_sex"); 
    String phone = request.getParameter("stud_phone"); 
    String nationality = request.getParameter("stud_nationality"); 
    String disability = request.getParameter("stud_disability"); 
    String billSiblings = request.getParameter("stud_bilSiblings"); 
    String anakKe = request.getParameter("stud_anakKe"); 
    String schoolName = request.getParameter("stud_schoolName"); 
    String parentFname = request.getParameter("parent_fname"); 
    String parentICno = request.getParameter("parent_ICno"); 
    String parentAddress1 = request.getParameter("parent_address1"); 
    String parentAddress2 = request.getParameter("parent_address2"); 
    String parentPostcode = request.getParameter("parent_poscode"); 
    String parentCity = request.getParameter("parent_city"); 
    String parentState = request.getParameter("parent_state"); 
    String parentPhoneNo = request.getParameter("parent_phone"); 
    String parentNationality = request.getParameter("paent_nationality"); 
    String parentJob = request.getParameter("parent_job"); 
    String parentIncome = request.getParameter("parent_income"); 
    String officeAddress1 = request.getParameter("office_address1"); 
    String officeAddress2 = request.getParameter("office_address2"); 
    String officePostcode = request.getParameter("office_poscode"); 
    String officeCity = request.getParameter("office_city"); 
    String officeState = request.getParameter("office_state"); 
    
    
    if(studID != null) {
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(studID);
        try
        {
            Class.forName(driverName);
            con = DriverManager.getConnection(url,user,psw);
            String sql="Update student set StudID=?, FullName=?, birthCertificateNO=?, MyKid=?, Address1=?, Address2=?, Poscode=?, City=?, State=?, DOB=?, Sex=?, PhoneNo=?, Nationality=?, Disability=?, BillSibling=?, AnakKe=?, SchoolName=?, ParentFullName=?, ParentICno=?, ParentAddress1=?, ParentAddress2=?, ParentPoscode=?, ParentCity=?, ParentState=?, ParentPhoneNo=?, ParentNationality=?, ParentJob=?, ParentIncome=?, OfficeAddress1=?, OfficeAddress2=?, OfficePoscode=?, OfficeCity=?, OfficeState=? where studID="+studID;
            ps = con.prepareStatement(sql);
            ps.setString(1,studID);
            ps.setString(2, fname);
            ps.setString(3, certificationNO);
            ps.setString(4, MyKid);
            ps.setString(5, address1);
            ps.setString(6, address2);
            ps.setString(7, postcode);
            ps.setString(8, city);
            ps.setString(9, state);
            ps.setString(10, dob);
            ps.setString(11, sex);
            ps.setString(12, phone);
            ps.setString(13, nationality);
            ps.setString(14, disability);
            ps.setString(15, billSiblings);
            ps.setString(16, anakKe);
            ps.setString(17, schoolName);
            ps.setString(18, parentFname);
            ps.setString(19, parentICno);
            ps.setString(20, parentAddress1);
            ps.setString(21, parentAddress2);
            ps.setString(22, parentPostcode);
            ps.setString(23, parentCity);
            ps.setString(24, parentState);
            ps.setString(25, parentPhoneNo);
            ps.setString(26, parentNationality);
            ps.setString(27, parentJob);
            ps.setString(28, parentIncome);
            ps.setString(29, officeAddress1);
            ps.setString(30, officeAddress2);
            ps.setString(31, officePostcode);
            ps.setString(32, officeCity);
            ps.setString(33, officeState);
            int i = ps.executeUpdate();
            if(i > 0) {
                response.sendRedirect("viewRegistration.jsp"); //after login success redirect to viewStaff.jsp page
            } else {
                out.print("There is a problem in updating Record.");
            } 
        }
        catch(SQLException sql)
        {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>
