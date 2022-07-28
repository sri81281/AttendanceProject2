<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
String user=(String)session.getAttribute("userid");
if(user==null)
{
	request.getRequestDispatcher("index.html").forward(request, response);
}

String datas=request.getParameter("name");

System.out.println(datas);


String[]s1=datas.split(",");
String uname=s1[0];
String dt=s1[1];
String sts=s1[2];

System.out.println(uname+" "+dt+" "+sts);

String driver="com.mysql.jdbc.Driver";
String host="jdbc:mysql://localhost:3306/attendance_database";
String name="root";
String pass="mynewpassword";
String message="";
try{
	Class.forName(driver);
	Connection con=DriverManager.getConnection(host,name,pass);
	String sql="update offDuty set status=? where Name=? and Date=?";
	PreparedStatement pst=con.prepareStatement(sql);
	pst.setString(1, sts);
	pst.setString(2, uname);
	pst.setString(3, dt);
	pst.executeUpdate();
	con.close();
	message=sts;
	
	
}catch(Exception e)
{
	message="error";
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>

<h1 style="text-align: center;" ><%= message %></h1>
<script type="text/javascript">
setTimeout(function(){
    window.location.href = 'leaveApproval.jsp';
 }, 2000);
</script>
</body>
</html>