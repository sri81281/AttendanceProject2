<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

	#name {
	width: 200px;
	padding: 6px;
	border: none;
	outline: none;
	background: transparent;
	border-bottom: 1px solid purple;
	margin-bottom: 20px;
	color: black;
	content:none;
}
#button1 {
	background-color: green;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 20px;
}

.container {
	left: 50%;
	top: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	padding-right:80px;
	padding:30px;
}
	
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
</style>
<meta charset="UTF-8">
<title>Leave Form</title>
</head>
<body>

<ul>
		<li><a href="start.jsp">Home</a></li>
	</ul>
	<div class="container">
	<form action="submitleaveForm.jsp">
	 <input type="text" name="date" id="name"  autocomplete=off placeholder="from date"   onfocus="(this.type='date')" required><br>
     <textarea type="text" name="reason" id="name"  style="resize: none;"  autocomplete=off placeholder="Reason"  cols="5" rows ="5" required></textarea><br>
 	  <input type="text" name="value" id="name" onfocus="(this.value='arsithkavisaran1998')" placeholder="Submittingto" readonly="readonly" required><br>
    
		<button id="button1" value="sri">Submit</button>
	</form>
	</div>
</body>
</html>