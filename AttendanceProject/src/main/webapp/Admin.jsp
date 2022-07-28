
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%

String user = (String) session.getAttribute("userid");

if (user == null) {
	request.getRequestDispatcher("index.html").forward(request, response);
}
String driver = "com.mysql.cj.jdbc.Driver";
String database = "jdbc:mysql://localhost:3306/attendance_database";
String uname = "root";
String pass = "mynewpassword";
Class.forName(driver);

ResultSet rs=null;

try{
	Connection con = DriverManager.getConnection(database, uname, pass);
	String s="select admin from Admins where admin=?";
	
	PreparedStatement ps=con.prepareStatement(s);
	ps.setString(1, user);
	rs=ps.executeQuery();
	
}
catch(Exception e)
{
	e.printStackTrace();
}

if(rs.next())
{
%>
	<!DOCTYPE html>
	<html>
	<head>
	<style type="text/css">
	
	
	#name {
	width: 200px;
	padding: 6px;
	border: none;
	outline: none;
	background: transparent;
	border-bottom: 1px solid purple;
	margin-bottom: 20px;
	color: black;
	content:none;
}
#button1 {
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
	padding-right:80px;
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
	
	</style>
	<meta charset="UTF-8">
	<title>Admin</title>
	</head>
	<body>
	
	<ul>
		<li><a href="start.jsp">Home</a></li>
	</ul>
	
	<div class="container">
	<form action="xls.jsp">
	 <input type="text" name="from" id="name"  autocomplete=off placeholder="from date"   onfocus="(this.type='date')" required><br>
     <input type="text" name="to" id="name"  autocomplete=off placeholder="to date" onfocus="(this.type='date')" required><br>
 	 <input type="text" name="dataname" id="name"  autocomplete=off placeholder="enter the file name here" required><br>
    
		<button id="button1" value="sri">convert the data to xls</button>
	</form>
	</div>
	</body>
	</html>
<%
}

else
{
	
	out.println("<h1 style = 'text-align:centre'>only Admin is allowed</h1>");
	
}
	%>

