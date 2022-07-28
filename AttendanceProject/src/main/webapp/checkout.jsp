<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>

<%
String user = (String) session.getAttribute("userid");


if (user == null) {
	request.getRequestDispatcher("index.html").forward(request, response);
}
Date date = new Date();
SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd");
String todaydate = formatter.format(date);
SimpleDateFormat time_format = new SimpleDateFormat("hh:mm:ss");
String current_time = time_format.format(date);
if (user == null) {
	request.getRequestDispatcher("index.html").forward(request, response);
}
String n = (String) session.getAttribute("userid");
String driver = "com.mysql.jdbc.Driver";
String database = "jdbc:mysql://localhost:3306/attendance_database";
String uname = "root";
String pass = "mynewpassword";
String p = "present";
String message = "";
Class.forName(driver);
String Available = null;
Connection con = DriverManager.getConnection(database, uname, pass);
try {
	String check = "select Available from AttendInfo where Date='" + todaydate + "' and userID='" + user + "'";

	Statement st = con.createStatement();

	ResultSet res = st.executeQuery(check);
	if (res.next()) {
		Available = res.getString("Available");
		String query = "update AttendInfo set Checkout='" + current_time + "' where Date='" + todaydate
		+ "' and userID='" + user + "'";
		st.execute(query);
		message="Checkout Successfully";
	}
	else
	{
		message ="Checkin First";
	}
	

} catch (Exception e) {
	e.printStackTrace();
	message ="Already checkout";
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

