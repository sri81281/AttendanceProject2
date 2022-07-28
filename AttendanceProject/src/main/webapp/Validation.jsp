<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%



String driver = "com.mysql.jdbc.Driver";
String database = "jdbc:mysql://localhost:3306/attendance_database";
String uname = "root";
String pass = "mynewpassword";
String username = request.getParameter("uname");
String password = request.getParameter("pass");
String email="";
String phone="";
String u_name="";
try {
	Class.forName(driver);
	Connection con = DriverManager.getConnection(database, uname, pass);
	String sql = "Select * from registered_data where userId=? and Password=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, username);
	pstmt.setString(2, password);
	ResultSet rs = pstmt.executeQuery();
	if (rs.next())
	{
		session.setAttribute("userid", username);
		request.getRequestDispatcher("start.jsp").forward(request, response);
		session.setMaxInactiveInterval(18000);
		} 
	else {
		request.getRequestDispatcher("index.html").include(request, response);
	}
    con.close();
} catch (Exception e) {
	e.printStackTrace();
}



%>
