<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.sql.*"%>
<%@include file="RegistrationSuccessful.html"%>


<%

String firstName = request.getParameter("FirstName");
String lastName = request.getParameter("LastName");
String email = request.getParameter("Email");
String phoneNumber = request.getParameter("PhoneNumber");
String gender = request.getParameter("Gender");
String address = request.getParameter("Address");
String[] s = email.split("@");
String ename = s[0];
String epass = phoneNumber;

String className = "com.mysql.jdbc.Driver";
String connection = "jdbc:mysql://localhost:3306/attendance_database";
String username = "root";
String pass = "mynewpassword";

try {
	Class.forName(className);
	Connection con = DriverManager.getConnection(connection, username, pass);
	String add = "INSERT INTO registered_data  "
	+ "(FirstName,LastName,Email,PhoneNumber,Gender,Address,userId,Password)" + "VALUES(?,?,?,?,?,?,?,?)";
	PreparedStatement mystmt = con.prepareStatement(add);
	mystmt.setString(1, firstName);
	mystmt.setString(2, lastName);
	mystmt.setString(3, email);
	mystmt.setString(4, phoneNumber);
	mystmt.setString(5, gender);
	mystmt.setString(6, address);
	mystmt.setString(7, ename);
	mystmt.setString(8, epass);
	mystmt.executeUpdate();
	con.close();

} catch (Exception e) {
	e.printStackTrace();
}

System.out.println("preparing to send mail");
Properties properties = new Properties();
properties.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
properties.put("mail.smtp.port", "587"); //TLS Port
properties.put("mail.smtp.auth", "true"); //enable authentication
properties.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

final String from = "nadanzoho@gmail.com";
final String password = "xvyitxhapgbyvaeo";
Session obj = Session.getInstance(properties, new Authenticator() {
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(from, password);
	}
});

Message message = new MimeMessage(obj);
try {
	message.setFrom(new InternetAddress(from));
	message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
	message.setSubject("From Nadan ZohoPvi");
	message.setText("your user Id  : " + ename + "\n" + "Your password   : " + epass);
	Transport.send(message);
} catch (Exception e) {
	e.printStackTrace();
}

System.out.println("email sent successfully" + email);
%>
