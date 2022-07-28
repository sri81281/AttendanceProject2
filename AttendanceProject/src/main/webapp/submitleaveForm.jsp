<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
String user=(String)session.getAttribute("userid");
if(user==null)
{
	request.getRequestDispatcher("index.html").forward(request, response);
}
String date=request.getParameter("date");
String reason=request.getParameter("reason");
String submit=request.getParameter("value");

String driver="com.mysql.jdbc.Driver";
String host="jdbc:mysql://localhost:3306/attendance_database";
String name="root";
String pass="mynewpassword";
String message="";
try{
	Class.forName(driver);
	Connection con=DriverManager.getConnection(host,name,pass);
	String sql="insert into offDuty (Name,Date,Reason,Submitting_to) values(?,?,?,?)";
	PreparedStatement pst=con.prepareStatement(sql);
	pst.setString(1, user);
	pst.setString(2, date);
	pst.setString(3, reason);
	pst.setString(4, submit);
	pst.executeUpdate();
	con.close();
	message="successfully applied for leave";
	
	
}catch(Exception e)
{
	message="form is not submitted try again";
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <h1 style="text-align:centre;"><%=message %></h1>
      <script type="text/javascript">
      setTimeout(function() {
    	  window.location.href = 'leaveForm.jsp';
	}, 1000);
      </script>
</body>
</html>