<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="icon" type="image/x-icon"
	href="https://banner2.cleanpng.com/20180714/yxt/kisspng-computer-icons-clock-time-icon-design-environmental-protection-material-5b49ef02761925.2089835515315719704837.jpg">




<%
String user = (String) session.getAttribute("userid");
Date date = new Date();
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
String todaydate = formatter.format(date);
SimpleDateFormat time_format = new SimpleDateFormat("hh:mm:ss");
String current_time = time_format.format(date);

if (user == null) {
	request.getRequestDispatcher("index.html").forward(request, response);
}
String n = (String) session.getAttribute("userid");
System.out.println(n);
String driver = "com.mysql.jdbc.Driver";
String database = "jdbc:mysql://localhost:3306/attendance_database";
String uname = "root";
String pass = "mynewpassword";
String p = "present";
String message = "";
String username = request.getParameter("uname");
String password = request.getParameter("pass");
Class.forName(driver);
Connection con = DriverManager.getConnection(database, uname, pass);
try {

	System.out.println("attendance Success");
	String query = "insert into AttendInfo (userId ,Date,Available,Checkin) values(?,sysdate(),?,?)";
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.setString(1, n);
	stmt.setString(2, p);
	stmt.setString(3, current_time);
	stmt.executeUpdate();
	con.close();
	message="Checkin successfully";

	
} catch (Exception e) {
	e.printStackTrace();
	message ="Already checkin today "+todaydate;
}
%>

<!DOCTYPE html>
<html>
<head>
<style>
h1 {text-align: center;}
</style>
</head>
   <body>
      <script>
         setTimeout(function(){
            window.location.href = 'start.jsp';
         }, 1000);
      </script>
      <h1> <%= message %> </h1>
     
   </body>
</html>

