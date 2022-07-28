<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


    <%
    
    String name=request.getParameter("dataname");
    String from=request.getParameter("from");
    String to=request.getParameter("to");
    
    String driver = "com.mysql.jdbc.Driver";
	String database = "jdbc:mysql://localhost:3306/attendance_database";
	String uname = "root";
	String pass = "mynewpassword";
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
	String todaydate = formatter.format(date);
	
	System.out.println(name);
	System.out.println(from);
	System.out.println(to);
	
	try {
		Class.forName(driver);
		Connection con = DriverManager.getConnection(database, uname, pass);
		String query="SELECT *FROM attendance_database.AttendInfo  where Date  between '"+from+"' and '"+to+"' INTO OUTFILE '/var/lib/mysql-files/"+name+Math.random()+".xls'";
		Statement stmt=con.createStatement();
		stmt.executeQuery(query);
		con.close();
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    %>
    
    <!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>DATA to xls</title>
</head>
<body>
	
	<h1 style="text-align: center;">Data converted and stored into the root folder</h1>
	<script type="text/javascript">
	setTimeout(function(){
		window.location.href='Admin.jsp';
		
	}, 1000);
	</script>
</body>
</html>