<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Details</title>
<style type="text/css">

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
#user
{

border-collapse: collapse;
  width: 100%;
}

#user td{
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}
#user th{
 border: 2px solid #ddd;
  font-size: large;
  background-color: green;
}
</style>
<meta charset="UTF-8">

</head>
<body>

<ul>
		<li><a href="start.jsp">Home</a></li>
	</ul>
<h1 style="text-align: center;" >Attendance Details</h1>
<table id="user">

<tr>
<th>Date</th>
<th>Available</th>
<th>Check IN</th>

</tr>

<%
String user = (String) session.getAttribute("userid");
String driver = "com.mysql.jdbc.Driver";
	String database = "jdbc:mysql://localhost:3306/attendance_database";
	String uname = "root";
	String pass = "mynewpassword";
	 String from=request.getParameter("from");
	    String to=request.getParameter("to");
	try {
		Class.forName(driver);
		Connection con = DriverManager.getConnection(database, uname, pass);
		String query="SELECT Date,Available,Checkin FROM attendance_database.AttendInfo  where Date  between '"+from+"' and '"+to+"' and userID='"+user+"'";
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{
		%>
		
	    <tr><td><%= rs.getDate("Date") %> </td>
        <td> <%= rs.getString("Available") %> </td>
        <td> <%= rs.getString("Checkin") %> </td></tr>
	        
		<%
		}
		con.close();
		
		
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>

</table>
</body>
</html>