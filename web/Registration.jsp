<%-- 
    Document   : headmaster
    Created on : Nov 29, 2022, 1:53:40 AM
    Author     : AreZieq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%
    try {
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/s59583_otms","s59583","s595832w#"); //create connection
	
	if(request.getParameter("btn_register")!=null){ //check register button click event not null
		
            PreparedStatement pstmt=null; //create statement
	
            //create statement to insert data into database
            pstmt=con.prepareStatement("INSERT INTO student(FullName,birthCertificateNO,MyKid,Address1,Address2,Poscode,City,State,DOB,Sex,PhoneNo,Nationality,Disability,BillSibling,AnakKe,SchoolName,ParentFullName,ParentICno,ParentAddress1,ParentAddress2,ParentPoscode,ParentCity,ParentState,ParentPhoneNo,ParentNationality,ParentJob,ParentIncome,OfficeAddress1,OfficeAddress2,OfficePoscode,OfficeCity,OfficeState) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); //sql insert query
            pstmt.setString(1,request.getParameter("stud_fname")); 
            pstmt.setString(2,request.getParameter("stud_certificateNO")); 
            pstmt.setString(3,request.getParameter("stud_MyKid")); 
            pstmt.setString(4,request.getParameter("stud_address1")); 
            pstmt.setString(5,request.getParameter("stud_address2")); 
            pstmt.setString(6,request.getParameter("stud_poscode")); 
            pstmt.setString(7,request.getParameter("stud_city")); 
            pstmt.setString(8,request.getParameter("stud_state")); 
            pstmt.setString(9,request.getParameter("stud_dob")); 
            pstmt.setString(10,request.getParameter("stud_sex")); 
            pstmt.setString(11,request.getParameter("stud_phone")); 
            pstmt.setString(12,request.getParameter("stud_nationality")); 
            pstmt.setString(13,request.getParameter("stud_disability")); 
            pstmt.setString(14,request.getParameter("stud_bilSiblings")); 
            pstmt.setString(15,request.getParameter("stud_anakKe")); 
            pstmt.setString(16,request.getParameter("stud_schoolName")); 
            pstmt.setString(17,request.getParameter("parent_fname")); 
            pstmt.setString(18,request.getParameter("parent_ICno")); 
            pstmt.setString(19,request.getParameter("parent_address1")); 
            pstmt.setString(20,request.getParameter("parent_address2")); 
            pstmt.setString(21,request.getParameter("parent_poscode")); 
            pstmt.setString(22,request.getParameter("parent_city")); 
            pstmt.setString(23,request.getParameter("parent_state")); 
            pstmt.setString(24,request.getParameter("parent_phone")); 
            pstmt.setString(25,request.getParameter("paent_nationality")); 
            pstmt.setString(26,request.getParameter("parent_job")); 
            pstmt.setString(27,request.getParameter("parent_income")); 
            pstmt.setString(28,request.getParameter("office_address1")); 
            pstmt.setString(29,request.getParameter("office_address2")); 
            pstmt.setString(30,request.getParameter("office_poscode")); 
            pstmt.setString(31,request.getParameter("office_city")); 
            pstmt.setString(32,request.getParameter("office_state")); 
		
            pstmt.executeUpdate(); //execute query
		
            request.setAttribute("successMsg","Register Successfully...!"); //register success messeage
            
            con.close(); //close connection
	}
    }
    catch(Exception e){
	out.println(e);
    }
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
                <a href="viewRegistration.jsp">
                    <i class='bx bx-box' ></i>
                    <span class="links_name">Senarai Pelajar</span>
                </a>
            </li>
            <li>
                <a href="#" class="active">
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

            <div class="home-content">
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
                                <label for="fname">Nama Penuh (HURUF BESAR)</label>
                                <input type="text" class="form-control" name="stud_fname" id="stud_fname" style="text-transform:uppercase" placeholder="Nama penuh pelajar" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="noSuratBeranak">No. Surat Beranak</label>
                                <input type="text" class="form-control" name="stud_certificateNO" id="stud_certificateNO" placeholder="No. Surat Beranak" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="noMykid">No. MyKid</label>
                                <input type="tel " class="form-control" name="stud_MyKid" id="stud_ICno" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" placeholder="000000-00-0000" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="address-1">Alamat-1</label>
                                <input type="text" class="form-control" name="stud_address1" id="stud_address1" placeholder="Alamat-1" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="address-2">Alamat-2</label>
                                <input type="text" class="form-control" name="stud_address2" id="stud_address2" placeholder="Alamat-2" required>
                            </div>
                            <div class="col-sm-2 form-group">
                                <label for="State">Poskod</label>
                                <input type="number" class="form-control" name="stud_poscode" id="stud_poscode" placeholder="Poskod" required>
                            </div>
                            <div class="col-sm-4 form-group">
                                <label for="city">Bandar</label>
                                <input type="text" class="form-control" name="stud_city" id="stud_city" placeholder="Bandar" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="state">Negeri</label>
                                <select class="form-control custom-select browser-default" name="stud_state" id="stud_state">
                                    <option value="">--Pilih--</option>
                                    <option value="Johor">Johor</option>
                                    <option value="Kedah">Kedah</option>
                                    <option value="Kelantan">Kelantan</option>
                                    <option value="Melaka">Melaka</option>
                                    <option value="Negeri Sembilan">Negeri Sembilan</option>
                                    <option value="Pahang">Pahang</option>
                                    <option value="Perak">Perak</option>
                                    <option value="Perlis">Perlis</option>
                                    <option value="Pulau Pinang">Pulau Pinang</option>
                                    <option value="Sabah">Sabah</option>
                                    <option value="Sarawak">Sarawak</option>
                                    <option value="Selangor">Selangor</option>
                                    <option value="Terengganu">Terengganu</option>
                                    <option value="Wilayah Persekutuan Kuala Lumpur">Wilayah Persekutuan Kuala Lumpur</option>
                                    <option value="Wilayah Persekutuan Kuala Labuan">Wilayah Persekutuan Labuan</option>
                                    <option value="Wilayah Persekutuan Kuala Putrajaya">Wilayah Persekutuan Putrajaya</option>
                                </select>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="Date">Tarikh Lahir</label>
                                <input type="Date" name="stud_dob" class="form-control" id="stud_dob" placeholder="" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="sex">Jantina</label>
                                <select id="sex" class="form-control browser-default custom-select" name="stud_sex" id="stud_sex">
                                    <option value="Lelaki">Lelaki</option>
                                    <option value="Perempuan">Perempuan</option>
                                </select>
                            </div>
                            <div class="col-sm-2 form-group">
                                <label for="cod">Kod Neagara</label>
                                <input type="text" class="form-control" name="stud_countryCode" id="stud_countryCode" placeholder="(+60)" disabled="disabled">
                            </div>
                            <div class="col-sm-4 form-group">
                                <label for="tel">No. Telefon</label>
                                <input type="tel" name="stud_phone" class="form-control" id="stud_phone" pattern="[0-9]{2}-[0-9]{8}" placeholder="00-00000000" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="pass">Kewarganegaraan</label>
                                <select id="warganeagara" class="form-control browser-default custom-select" name="stud_nationality" id="stud_nationality">
                                    <option value="Warganegara">Warganegara</option>
                                    <option value="Bukan Warganegara">Bukan Warganegara</option>
                                </select>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="cod">Kecacatan (Jika Ada)</label>
                                <input type="text" class="form-control" name="stud_disability" id="stud_disability" placeholder="Nyatakan (Jika Ada)">
                            </div>
                            <div class="col-sm-3 form-group">
                                <label for="cod">No. Bilangan Adik-Beradik</label>
                                <input type="number" class="form-control" name="stud_bilSiblings" id="stud_bilSiblings" placeholder="Bilangan Adik-Beradik" required>
                            </div>
                            <div class="col-sm-3 form-group">
                                <label for="cod">Anak Ke</label>
                                <input type="number" class="form-control" name="stud_anakKe" id="stud_anakKe" placeholder="Anak Ke?" required>
                            </div>
                            <div class="col-sm-12 form-group">
                                <label for="cod">Nama Sekolah Agama Sekarang (Jika Ada)</label>
                                <input type="text" class="form-control" name="stud_schoolName" id="stud_schoolName" placeholder="Nama Sekolah Agama (Jika Ada)" required>
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
                                <input type="text" class="form-control" name="parent_fname" id="parent_fname" style="text-transform:uppercase" placeholder="Nama penuh penjaga" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="noMykid">No. Kad Pengenalan</label>
                                <input type="tel" class="form-control" name="parent_ICno" id="parent_ICno" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" placeholder="000000-00-0000" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="address-1">Alamat-1 (Surat Menyurat)</label>
                                <input type="text" class="form-control" name="parent_address1" id="parent_address1" placeholder="Alamat-1" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="address-2">Alamat-2 (Surat Menyurat)</label>
                                <input type="text" class="form-control" name="parent_address2" id="parent_address2" placeholder="Alamat-2" required>
                            </div>
                            <div class="col-sm-2 form-group">
                                <label for="Poscode">Poskod</label>
                                <input type="number" class="form-control" name="parent_poscode" id="parent_poscode" placeholder="Poskod" required>
                            </div>
                            <div class="col-sm-4 form-group">
                                <label for="city">Bandar</label>
                                <input type="text" class="form-control" name="parent_city" id="parent_city" placeholder="Bandar" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="state">Negeri</label>
                                <select class="form-control custom-select browser-default" name="parent_state" id="parent_state">
                                    <option value="">--Pilih--</option>
                                    <option value="Johor">Johor</option>
                                    <option value="Kedah">Kedah</option>
                                    <option value="Kelantan">Kelantan</option>
                                    <option value="Melaka">Melaka</option>
                                    <option value="Negeri Sembilan">Negeri Sembilan</option>
                                    <option value="Pahang">Pahang</option>
                                    <option value="Perak">Perak</option>
                                    <option value="Perlis">Perlis</option>
                                    <option value="Pulau Pinang">Pulau Pinang</option>
                                    <option value="Sabah">Sabah</option>
                                    <option value="Sarawak">Sarawak</option>
                                    <option value="Selangor">Selangor</option>
                                    <option value="Terengganu">Terengganu</option>
                                    <option value="Wilayah Persekutuan Kuala Lumpur">Wilayah Persekutuan Kuala Lumpur</option>
                                    <option value="Wilayah Persekutuan Kuala Labua">Wilayah Persekutuan Labuan</option>
                                    <option value="Wilayah Persekutuan Kuala Putrajaya">Wilayah Persekutuan Putrajaya</option>
                                </select>
                            </div>
                            <div class="col-sm-2 form-group">
                                <label for="cod">Kod Neagara</label>
                                <input type="text" class="form-control" name="parent_countryCode" id="parent_countryCode" placeholder="(+60)" disabled="disabled">
                            </div>
                            <div class="col-sm-4 form-group">
                                <label for="tel">No. Telefon</label>
                                <input type="tel" name="parent_phone" class="form-control" id="parent_phone" pattern="[0-9]{2}-[0-9]{8}" placeholder="00-00000000" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="pass">Kewarganegaraan</label>
                                <select id="warganeagara" class="form-control browser-default custom-select" name="paent_nationality" id="paent_nationality">
                                    <option value="Warganegara">Warganegara</option>
                                    <option value="Bukan Warganegara">Bukan Warganegara</option>
                                </select>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="cod">Pekerjaan/ Jawatan</label>
                                <input type="text" class="form-control" name="parent_job" id="parent_job" placeholder="Pekerjaan/ Jawatan" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="cod">Pendapatan</label>
                                <input type="number" class="form-control" name="parent_income" id="parent_income" placeholder="RM " required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="address-1">Alamat-1 (Pejabat)</label>
                                <input type="text" class="form-control" name="office_address1" id="office_address1" placeholder="Alamat-1" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="address-2">Alamat-2 (Pejabat)</label>
                                <input type="text" class="form-control" name="office_address2" id="office_address2" placeholder="Alamat-2" required>
                            </div>
                            <div class="col-sm-2 form-group">
                                <label for="poscode">Poskod</label>
                                <input type="number" class="form-control" name="office_poscode" id="office_poscode" placeholder="Poskod" required>
                            </div>
                            <div class="col-sm-4 form-group">
                                <label for="city">Bandar</label>
                                <input type="text" class="form-control" name="office_city" id="office_city" placeholder="Bandar" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="state">Negeri</label>
                                <select class="form-control custom-select browser-default" name="office_state" id="office_state">
                                    <option value="">--Pilih--</option>
                                    <option value="Johor">Johor</option>
                                    <option value="Kedah">Kedah</option>
                                    <option value="Kelantan">Kelantan</option>
                                    <option value="Melaka">Melaka</option>
                                    <option value="Negeri Sembilan">Negeri Sembilan</option>
                                    <option value="Pahang">Pahang</option>
                                    <option value="Perak">Perak</option>
                                    <option value="Perlis">Perlis</option>
                                    <option value="Pulau Pinang">Pulau Pinang</option>
                                    <option value="Sabah">Sabah</option>
                                    <option value="Sarawak">Sarawak</option>
                                    <option value="Selangor">Selangor</option>
                                    <option value="Terengganu">Terengganu</option>
                                    <option value="Wilayah Persekutuan Kuala Lumpur">Wilayah Persekutuan Kuala Lumpur</option>
                                    <option value="Wilayah Persekutuan Kuala Labua">Wilayah Persekutuan Labuan</option>
                                    <option value="Wilayah Persekutuan Kuala Putrajaya">Wilayah Persekutuan Putrajaya</option>
                                </select>
                            </div>
                            <div class="col-sm-12">
                                <h1> </h1>
                                <br>
                                <br>
                            </div>
                            <div class="col-sm-12">
                                <h6 class="text-uppercase">Pengakuan Ibu Bapa/ Penjaga</h6>
                                <!-- Solid divider -->
                                <hr class="solid">
                            </div>
                            <div class="col-sm-12">
                                <input type="checkbox" class="form-check d-inline" id="chb" required>
                                <label for="chb" class="form-check-label">&nbsp;Saya mengaku segala keterangan yang dinyatakan dalam borang ini adalah betul dan benar. </label>
                            </div>
                            <div class="col-sm-12 form-group mb-0">
                               <button class="btn btn-primary float-right" name="btn_register">Daftar</button>
                            </div>
                        </div>
                    </form>
                </div>
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
</body>
</html>

