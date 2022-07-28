<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log out</title>

<style>
h1 {text-align: center;}
</style>
</head>
<body>
<%

String user=(String)session.getAttribute("userid");

if(user==null)
{
	request.getRequestDispatcher("index.html").forward(request,response);
}
else{
	session.removeAttribute("userid");
}

%>
<h1>Logout Successfully  &#10003</h1>
  <script>
         setTimeout(function(){
            window.location.href = 'index.html';
         }, 2000);
      </script>

</body>
</html>

