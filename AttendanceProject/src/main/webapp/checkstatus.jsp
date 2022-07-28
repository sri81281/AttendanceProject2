<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

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
  width: 70%;
   margin-left: auto;
  margin-right: auto;
}

#user td{
  padding: 20px;
  text-align: center;
}
#user th{
 border: 2px solid #ddd;
  font-size: large;
  background-color: green;
}
#button1 {
	background-color: green;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 20px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<ul>
		<li><a href="start.jsp">Home</a></li>
	</ul>
<h1 style="text-align: center;" >Employee leave Details</h1>

<table id="user">


<tr>
<th>User</th>
<th>Date</th>
<th>Reason</th>
<th>status</th>

</tr>

<%
String user = (String) session.getAttribute("userid");
String driver="com.mysql.jdbc.Driver";
String host="jdbc:mysql://localhost:3306/attendance_database";
String name="root";
String pass="mynewpassword";
String message="";

	
	try
	{
		Class.forName(driver);
		Connection con=DriverManager.getConnection(host,name,pass);
		String sql="select Name,Date,Reason,status from offDuty   where  Name=? ";
		PreparedStatement pst=con.prepareStatement(sql);	
		pst.setString(1, user);
	    ResultSet rs=pst.executeQuery();
        

	    while(rs.next())
	    {
	    
	    	%>
	    	
	    	<tr><td> <%=rs.getString("Name") %> </td>
	        <td> <%= rs.getString("Date") %> </td>
	        <td> <%= rs.getString("Reason") %> </td>
	        <td><%= rs.getString("status") %></td>
	        </tr>
	         
	        
	        <%
	        
	    }
	}
	catch(Exception e)
	{
		message="No results found";
		e.printStackTrace();
	}
%>

 

</table>
 
</body>
</html>