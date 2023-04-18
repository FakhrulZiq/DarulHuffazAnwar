<%-- 
    Document   : viewStudent
    Created on : Jan 11, 2023, 4:45:28 AM
    Author     : AreZieq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("id");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "s59583_otms";
    String userid = "s59583";
    String password = "s595832w#";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%
    try{
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement=connection.createStatement();
        String sql ="select * from student where StudID="+id;
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
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
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://codepen.io/skjha5993/pen/bXqWpR.css">
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
                    <i class='bx bx-grid-alt' ></i>
                    <span class="links_name">Kemas Kini</span>
                </a>
            </li>
            <li class="log_out">
                <a href="viewRegistration.jsp">
                    <i class='bx bx-log-out'></i>
                    <span class="links_name">Kembali</span>
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

            <div class="home-content">
                <form method="post" onsubmit="return validate();" action="editRegistrationProcess.jsp">
                    <div class="container">
                        <form>
                            <h3 class="text-center">Borang Pendaftaran Kemasukan Murid</h3>
                            <div class="row jumbotron">
                                <div class="col-sm-12">
                                    <h6 class="text-uppercase">Butiran Diri Calon</h6>
                                    <!-- Solid divider -->
                                    <hr class="solid">
                                </div>
                                <div class="col-sm-12">
                                    <h1> </h1>
                                </div>
                                <div class="col-sm-12 form-group">
                                    <label for="fname">Student ID</label>
                                    <input type="text" class="form-control" name="stud_ID" id="stud_ID" value="<%=resultSet.getString("StudID") %>" readonly>
                                </div>
                                <div class="col-sm-12 form-group">
                                    <label for="fname">Nama Penuh (HURUF BESAR)</label>
                                    <input type="text" class="form-control" name="stud_fname" id="stud_fname" style="text-transform:uppercase" value="<%=resultSet.getString("FullName") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="noSuratBeranak">No. Surat Beranak</label>
                                    <input type="text" class="form-control" name="stud_certificateNO" id="stud_ICno" value="<%=resultSet.getString("birthCertificateNO") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="noMykid">No. MyKid</label>
                                    <input type="tel " class="form-control" name="stud_MyKid" id="stud_MyKid" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" value="<%=resultSet.getString("MyKid") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="address-1">Alamat-1</label>
                                    <input type="text" class="form-control" name="stud_address1" id="stud_address1" value="<%=resultSet.getString("Address1") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="address-2">Alamat-2</label>
                                    <input type="text" class="form-control" name="stud_address2" id="stud_address2" value="<%=resultSet.getString("Address2") %>" readonly>
                                </div>
                                <div class="col-sm-2 form-group">
                                    <label for="State">Poskod</label>
                                    <input type="number" class="form-control" name="stud_poscode" id="stud_poscode" value="<%=resultSet.getString("Poscode") %>" readonly>
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label for="city">Bandar</label>
                                    <input type="text" class="form-control" name="stud_city" id="stud_city" value="<%=resultSet.getString("City") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="state">Negeri</label>
                                    <input type="text" class="form-control" name="stud_state" id="stud_state" value="<%=resultSet.getString("State") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="Date">Tarikh Lahir</label>
                                    <input type="Date" name="stud_dob" class="form-control" id="stud_dob" value="<%=resultSet.getString("DOB") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="sex">Jantina</label>
                                    <input type="text" class="form-control" name="stud_sex" id="stud_sex" value="<%=resultSet.getString("Sex") %>" readonly>
                                </div>
                                <div class="col-sm-2 form-group">
                                    <label for="cod">Kod Neagara</label>
                                    <input type="text" class="form-control" name="stud_countryCode" id="stud_countryCode" placeholder="(+60)" disabled="disabled">
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label for="tel">No. Telefon</label>
                                    <input type="tel" name="stud_phone" class="form-control" id="stud_phone" pattern="[0-9]{2}-[0-9]{8}" value="<%=resultSet.getString("PhoneNo") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="pass">Kewarganegaraan</label>
                                    <input type="text" class="form-control" name="stud_nationality" id="stud_nationality" value="<%=resultSet.getString("Nationality") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="cod">Kecacatan (Jika Ada)</label>
                                    <input type="text" class="form-control" name="stud_disability" id="stud_disability" value="<%=resultSet.getString("Disability") %>" readonly>
                                </div>
                                <div class="col-sm-3 form-group">
                                    <label for="cod">No. Bilangan Adik-Beradik</label>
                                    <input type="number" class="form-control" name="stud_bilSiblings" id="stud_bilSiblings" value="<%=resultSet.getString("BillSibling") %>" readonly>
                                </div>
                                <div class="col-sm-3 form-group">
                                    <label for="cod">Anak Ke</label>
                                    <input type="number" class="form-control" name="stud_anakKe" id="stud_anakKe" value="<%=resultSet.getString("AnakKe") %>" readonly>
                                </div>
                                <div class="col-sm-12 form-group">
                                    <label for="cod">Nama Sekolah Agama Sekarang (Jika Ada)</label>
                                    <input type="text" class="form-control" name="stud_schoolName" id="stud_schoolName" value="<%=resultSet.getString("SchoolName") %>" readonly>
                                </div>
                                <div class="col-sm-12">
                                    <h1> </h1>
                                    <br>
                                    <br>
                                </div>
                                <div class="col-sm-12">
                                    <h6 class="text-uppercase">Butiran Ibu Bapa/ Penjaga</h6>
                                    <!-- Solid divider -->
                                    <hr class="solid">
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="fname">Nama Bapa/ Penjaga (HURUF BESAR)</label>
                                    <input type="text" class="form-control" name="parent_fname" id="parent_fname" style="text-transform:uppercase" value="<%=resultSet.getString("ParentFullName") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="noMykid">No. Kad Pengenalan</label>
                                    <input type="tel" class="form-control" name="parent_ICno" id="parent_ICno" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" value="<%=resultSet.getString("ParentICno") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="address-1">Alamat-1 (Surat Menyurat)</label>
                                    <input type="text" class="form-control" name="parent_address1" id="parent_address1" value="<%=resultSet.getString("ParentAddress1") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="address-2">Alamat-2 (Surat Menyurat)</label>
                                    <input type="text" class="form-control" name="parent_address2" id="parent_address2" value="<%=resultSet.getString("ParentAddress2") %>" readonly>
                                </div>
                                <div class="col-sm-2 form-group">
                                    <label for="Poscode">Poskod</label>
                                    <input type="number" class="form-control" name="parent_poscode" id="parent_poscode" value="<%=resultSet.getString("ParentPoscode") %>" readonly>
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label for="city">Bandar</label>
                                    <input type="text" class="form-control" name="parent_city" id="parent_city" value="<%=resultSet.getString("ParentCity") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="state">Negeri</label>
                                    <input type="text" class="form-control" name="parent_state" id="parent_state" value="<%=resultSet.getString("ParentState") %>" readonly>
                                </div>
                                <div class="col-sm-2 form-group">
                                    <label for="cod">Kod Neagara</label>
                                    <input type="text" class="form-control" name="parent_countryCode" id="parent_countryCode" placeholder="(+60)" disabled="disabled">
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label for="tel">No. Telefon</label>
                                    <input type="tel" name="parent_phone" class="form-control" id="parent_phone" pattern="[0-9]{2}-[0-9]{8}" value="<%=resultSet.getString("ParentPhoneNo") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="pass">Kewarganegaraan</label>
                                    <input type="text" class="form-control" name="paent_nationality" id="paent_nationality" value="<%=resultSet.getString("ParentNationality") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="cod">Pekerjaan/ Jawatan</label>
                                    <input type="text" class="form-control" name="parent_job" id="parent_job" value="<%=resultSet.getString("ParentJob") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="cod">Pendapatan</label>
                                    <input type="number" class="form-control" name="parent_income" id="parent_income" value="<%=resultSet.getString("ParentIncome") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="address-1">Alamat-1 (Pejabat)</label>
                                    <input type="text" class="form-control" name="office_address1" id="office_address1" value="<%=resultSet.getString("OfficeAddress1") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="address-2">Alamat-2 (Pejabat)</label>
                                    <input type="text" class="form-control" name="office_address2" id="office_address2" value="<%=resultSet.getString("OfficeAddress2") %>" readonly>
                                </div>
                                <div class="col-sm-2 form-group">
                                    <label for="poscode">Poskod</label>
                                    <input type="number" class="form-control" name="office_poscode" id="office_poscode" value="<%=resultSet.getString("OfficePoscode") %>" readonly>
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label for="city">Bandar</label>
                                    <input type="text" class="form-control" name="office_city" id="office_city" value="<%=resultSet.getString("OfficeCity") %>" readonly>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="state">Negeri</label>
                                    <input type="text" class="form-control" name="office_state" id="office_state" value="<%=resultSet.getString("OfficeState") %>" readonly>
                                </div>
                                <div class="col-sm-12">
                                    <h1> </h1>
                                    <br>
                                    <br>
                                </div>
                                <div class="col-sm-12 form-group mb-0">
                                    <a href="editRegistration.jsp?id=<%=resultSet.getString("StudID")%>" class="btn btn-primary float-right" name="btn_register">Kemas Kini</a>	
                                </div>
                            </div>
                        </form>
                    </div>
                </form>
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
        <%
            }
            }
            catch(Exception e){
                out.println(e);
            }
        %>
</body>
</html>