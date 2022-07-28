
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!String user;
	String driver = "com.mysql.cj.jdbc.Driver";
	String database = "jdbc:mysql://localhost:3306/attendance_database";
	String uname = "root";
	String pass = "mynewpassword";
	Connection con;%>

<%
user = (String) session.getAttribute("userid");

if (user == null) {
	request.getRequestDispatcher("index.html").forward(request, response);
}

String email = "";
String phone = "";
String Address = "";
String gender = "";
String name = "";
String lname = "";
String Available = null;
Date date = new Date();
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
String todaydate = formatter.format(date);
SimpleDateFormat time_format = new SimpleDateFormat("hh:mm:ss");
String current_time = time_format.format(date);
Class.forName(driver);
con = DriverManager.getConnection(database, uname, pass);
ResultSet result = null;
try {
	String sql = "Select * from registered_data where userId=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, user);
	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		email = rs.getString("Email");
		phone = rs.getString("PhoneNumber");
		Address = rs.getString("Address");
		gender = rs.getString("Gender");
		name = rs.getString("FirstName");
		lname = rs.getString("LastName");
	}

	String query = "select admin from Admins where admin=?";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, user);
	result = ps.executeQuery();
} catch (Exception e) {
	e.getStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mini Cliq</title>

<style>
.box {
	width: 350px;
	height: 600px;
	background-color: #171717;
	color: #fff;
	padding: 40px;
	position: relative;
	margin-right: 10px;
	float: right;
	text-align: center
}

.arrow-top {
	margin-top: 20px;
}

.arrow-top:after {
	content: " ";
	position: absolute;
	right: 30px;
	top: -15px;
	border-top: none;
	border-right: 15px solid transparent;
	border-left: 15px solid transparent;
	border-bottom: 15px solid black;
}

.button {
	background-color: red;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 20px;
}

.button1 {
	background-color: green;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 20px;
}

.container {
	left: 50%;
	top: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
}

#Option
{
	background-color: #333;
    font-size: 100%;
	color: white;
	padding: 17px;
	border: none;
	col
}
.profile {
	display: block;
	color: white;
	float: right;
	text-align: center;
	padding-right: 50px;
	text-decoration: none;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 20px 30px;
	text-decoration: none;
}

li a:hover {
	background-color: red;
}

.abc {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: black;
	color: white;
	text-align: center;
}
</style>
<link rel="icon" type="image/x-icon"
	href="https://banner2.cleanpng.com/20180714/yxt/kisspng-computer-icons-clock-time-icon-design-environmental-protection-material-5b49ef02761925.2089835515315719704837.jpg">
</head>


<body>
	<ul>
		<li><a href="start.jsp">Home</a></li>
		<li><a href="userAttendance.jsp">My Attendance</a></li>
       <select id="Option"  onclick="location = this.value;">
 			<option value="leaveForm.jsp">LeaveForm</option> 
			<option value="checkstatus.jsp">Leave Status</option>
			<option value="leaveApproval.jsp">Approve </option>
		   </select>
		<%
		if (result.next()) {
		%>
		<li><a href="Admin.jsp">AdminActions</a></li>
		<%
		}
		%>
        

		<li class="profile"><h3><%=name%></h3></li>
	</ul>


	<div class="container">


		<a href="home.jsp"><button id="press" value="checkin"
				class="button1">Checkin</button></a> <a href="checkout.jsp">
			<button id="press" value="checkout" class="button">Checkout</button>
		</a>

	</div>

	<div class="box arrow-top">
		<h1 style="text-align: center"><%=(name + " " + lname).toUpperCase()%></h1>
		<h3>
			Email :
			<%=email%></h3>
		<h3>
			Phone number :
			<%=phone%></h3>
		<h3>
			DATE :
			<%=todaydate%></h3>

		<a class="button" href="logout.jsp">Log Out</a>
	</div>


	<footer class="abc">
		<h3>
			Contact us <br> <a style="color: white"
				href="mailto:nadanzoho@gmail.com">nadanzoho@gmail.com</a>
		</h3>

		<address>unknown Corp. Limited,Nadangadu-614804,TamilNadu</address>
		<br>
	</footer>
</body>

</html>





