<%-- 
    Document   : login
    Created on : Nov 29, 2022, 1:49:52 AM
    Author     : AreZieq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<%
    try {
        String username = request.getParameter("txt_username"); //txt_email
        String password = request.getParameter("txt_password"); //txt_password
    
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/s59583_otms","s59583","s595832w#"); //create connection
	
        PreparedStatement hm = hm = con.prepareStatement("select * from employee where Username=? AND Password=? AND Position = 'Headmaster'"); //sql select query 
        hm.setString(1,username);
        hm.setString(2,password);
        ResultSet PosHead = hm.executeQuery(); //execute query and store in resultset object rs.
        
        PreparedStatement tchr = tchr = con.prepareStatement("select * from employee where Username=? AND Password=? AND Position = 'Teacher'"); //sql select query 
        tchr.setString(1,username);
        tchr.setString(2,password);
        ResultSet PosTeacher = tchr.executeQuery(); //execute query and store in resultset object rs.
        
        PreparedStatement stff = stff = con.prepareStatement("select * from employee where Username=? AND Password=? AND Position = 'Staff'"); //sql select query 
        stff.setString(1,username);
        stff.setString(2,password);
        ResultSet PosStaff= stff.executeQuery(); //execute query and store in resultset object rs.
        
	if(request.getParameter("btn_login")!=null) {//check login button click event not null
            String dbusername,dbpassword;

            if(PosHead.next()) {
		dbusername=PosHead.getString("Username");
		dbpassword=PosHead.getString("Password");
			
		if(username.equals(dbusername) && password.equals(dbpassword)) {
                    session.setAttribute("login",dbusername); //session name is login and store fetchable database email address
                    response.sendRedirect("viewRegistration.jsp"); //after login success redirect to welcome.jsp page
		}
            } else if(PosTeacher.next()) {
		dbusername=PosTeacher.getString("Username");
		dbpassword=PosTeacher.getString("Password");
			
		if(username.equals(dbusername) && password.equals(dbpassword)) {
                    session.setAttribute("login",dbusername); //session name is login and store fetchable database email address
                    response.sendRedirect("Teacher.jsp"); //after login success redirect to welcome.jsp page
		}
            } else if(PosStaff.next()) {
		dbusername=PosStaff.getString("Username");
		dbpassword=PosStaff.getString("Password");
			
		if(username.equals(dbusername) && password.equals(dbpassword)) {
                    session.setAttribute("login",dbusername); //session name is login and store fetchable database email address
                    response.sendRedirect("Staff.jsp"); //after login success redirect to welcome.jsp page
		}
            }    
            else {
		request.setAttribute("errorMsg","Invalid username or password"); //invalid error message for email or password wrong
            }
            con.close(); //close connection	
	}
    }
    catch(Exception e) {
            out.println(e);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="asset/images/logo1.png">
    <link rel="stylesheet" href="asset/css/logincss.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <title>Darul Huffaz Anwar</title>
    <script>
        function validate() {
            var email = document.myform.txt_email;
            var password = document.myform.txt_password;

            if (email.value === null || email.value === "") {//check email textbox not blank
                window.alert("please enter email ?"); //alert message
                email.style.background = '#f08080';
                email.focus();
               return false;
            }
            if (password.value === null || password.value === "") {//check password textbox not blank
                window.alert("please enter password ?"); //alert message
                password.style.background = '#f08080'; 
                password.focus();
                return false;
            }
        }
    </script>
</head>
<body>
    <section class="login">
        <div class="login_box">
            <div class="left">
                <div class="top_link"><a href="index.html"><img src="https://drive.google.com/u/0/uc?id=16U__U5dJdaTfNGobB_OpwAJ73vM50rPV&export=download" alt="">Kembali</a></div>
                <div class="contact">
                    <form action="">
                        <h3>SIGN IN</h3>
                        <p align="center" style="color: red">				   		
                            <%
                                if(request.getAttribute("errorMsg")!=null) {
                                    out.println(request.getAttribute("errorMsg")); //error message for email or password 
                                }
                            %>
                        </p>
                        <input name="txt_username" id="Email" type="text" align="center" placeholder="Username">
                        <input name="txt_password" id="Password" type="password" align="center" placeholder="Katalaluan">
                        <button class="submit" type="submit" name="btn_login" value="Login">Log Masuk</button>
                    </form>
                </div>
            </div>
            <div class="right">
                <div class="right-text">
                    <h2>KELAS MENGAJI</h2>
                    <h5>Darul Huffaz Anwar</h5>
                </div>
                <div class="right-inductor"><img src="_0Rn3StU39D2rP3i80zESJJY56faKsA5GVCIFiUtc3EewSM_C0bkJSMiobIWiXFz7pMcadgZlweUdjBcjvaepHBe8wou0ZtDM9TKom0hs_nx_AKy0dnXGNWI1qftTjAg=w1920-h979-ft" alt=""></div>
            </div>
        </div>
    </section>
</body>
</html>
