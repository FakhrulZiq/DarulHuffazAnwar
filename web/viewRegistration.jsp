<%-- 
    Document   : viewRegistration
    Created on : Jan 10, 2023, 8:55:39 PM
    Author     : AreZieq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Darul Huffaz Anwar</title>
    <link rel="icon" type="image/x-icon" href="asset/images/logo1.png">
    <link href="asset/css/style.css" rel="stylesheet" />
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://codepen.io/skjha5993/pen/bXqWpR.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body{
             overflow-x: hidden;
        }
    </style>
  </head>
<body>
    <%
        if(session.getAttribute("login")==null || session.getAttribute("login")==" ") {//check condition unauthorize user not direct access welcome.jsp page
           response.sendRedirect("login.jsp"); 
        }
    %>
  <div class="sidebar">
    <div class="logo-details">
        <a href="#"><img src="asset/images/logo1.png" alt="logo"></a>
        <span class="logo_name">DarulHuffaz</span>
    </div>
        <ul class="nav-links">
            <li>
                <a href="#" class="active">
                    <i class='bx bx-box' ></i>
                    <span class="links_name">Senarai Pelajar</span>
                </a>
            </li>
            <li>
                <a href="Registration.jsp">
                    <i class='bx bx-grid-alt' ></i>
                    <span class="links_name">Pendaftaran</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-list-ul' ></i>
                    <span class="links_name">Yuran</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-pie-chart-alt-2' ></i>
                    <span class="links_name">Rekod Pelajaran</span>
                </a>
            </li>
            <li class="log_out">
                <a href="logout.jsp">
                    <i class='bx bx-log-out'></i>
                    <span class="links_name">Log out</span>
                </a>
            </li>
        </ul>
        </div>
        <section class="home-section">
            <nav>
                <div class="sidebar-button">
                    <i class='bx bx-menu sidebarBtn'></i>
                    <span class="dashboard">Dashboard</span>
                </div>
                <div class="search-box">
                    <input type="text" placeholder="Search...">
                    <i class='bx bx-search' ></i>
                </div>
                <div class="profile-details">
                    <img src="asset/images/profile.jpg" alt="">
                    <span class="admin_name">Fakhrul Haziq</span>
                    <i class='bx bx-chevron-down' ></i>
                </div>
            </nav>

            <div class="row" style="padding-top: 100px; padding-left: 50px">
                <%
                    try {
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/s59583_otms","s59583","s595832w#");
                        statement=connection.createStatement();
                        String sql ="select * from student";
                        resultSet = statement.executeQuery(sql);
                        int i = 0;
                        while(resultSet.next()){
                %>                  
            <div class="col-sm-2">
              <div class="card" style="width: 18rem;">
                  <a href="viewStudent.jsp?id=<%=resultSet.getString("StudID")%>"><img class="card-img-top" src="asset/images/person4.png" alt="Card image cap"></a>
                <div class="card-body"> 
                  <h5 class="card-title" style="text-transform:uppercase"><%=resultSet.getString("FullName") %></h5>
                  <a class="btn btn-primary" style="color: white; border: none" onclick="confirmUpdate(id=<%=resultSet.getString("StudID")%>)">Update</a>
                  <a class="btn btn-primary" style="color: white; background-color: tomato; border: none" onclick="confirmDelete(id=<%=resultSet.getString("StudID")%>)">Delete</a>
                </div>
              </div>
            </div>
                    <%
                        i++;
                        }
                        connection.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>        
                
            </div>
            
        </section>

        <script>
            let sidebar = document.querySelector(".sidebar");
            let sidebarBtn = document.querySelector(".sidebarBtn");
            sidebarBtn.onclick = function() {
                sidebar.classList.toggle("active");
                if(sidebar.classList.contains("active")){
                    sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
                }else{
                    sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
                }
            }
       </script>
       <script>
            function myFunction() {
              alert("Pendaftaran Selesai, Terima Kasih");
            }
        </script>
        <script type="text/javascript">
            function confirmDelete(id) {
              var confirmmessage = "Are you sure you want to delete this Student?";
              var go = "http://s59583.cursor.umt.edu.my:8080/DarulHuffazAnwar/deleteRegistration.jsp?id="+id;
              var cancel = "http://s59583.cursor.umt.edu.my:8080/DarulHuffazAnwar/viewRegistration.jsp";
              var message = "Action Was Cancelled By User";

              if (confirm(confirmmessage)) {
                  window.location = go;
              } else {
                   alert(message);
                   window.location = cancel;
              }
            }
        </script>
        <script type="text/javascript">
            function confirmUpdate(id) {
              var confirmmessage = "Are you sure you want to update this Student?";
              var go = "http://s59583.cursor.umt.edu.my:8080/DarulHuffazAnwar/editRegistration.jsp?id="+id;
              var cancel = "http://s59583.cursor.umt.edu.my:8080/DarulHuffazAnwar/viewRegistration.jsp";
              var message = "Action Was Cancelled By User";

              if (confirm(confirmmessage)) {
                  window.location = go;
              } else {
                   alert(message);
                   window.location = cancel;
              }
            }
        </script>
</body>
</html>