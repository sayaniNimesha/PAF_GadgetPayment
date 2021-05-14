<%@page import="com.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payment</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/payment.js"></script>
<meta name="viewpoint" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
	<center><h1>payment Management</h1></center>
	
	<div class="container"> <div class="row"> <div class="col-6"> 
 		
 	<form id='formItem' name='formItem' method='post' action='pay.jsp'>
			Payment Description: <input id='pyDes' name='pyDes' type='text' class='form-control form-control-sm'><br>
			Date: <input id='pyDate' name='pyDate' type='text' class='form-control form-control-sm'><br> 
			Amount: <input id='amount' name='amount' type='text' class='form-control form-control-sm'><br> 
			<input id="btnSave" name="btnSave" type="button" value="Save" class='btn btn-primary'>
			<input type='hidden' id='hidPayIDSave' name='hidPayIDSave' value=''>
	</form>
	
	
	<br>
	<div id="alertSuccess" class="alert alert-success"></div>
	<div id="alertError" class="alert alert-danger"></div>

	<br>
	<div id="divPayGrid">
	<%
		Payment payObj = new Payment();
		out.print(payObj.readPayment());
	%>
	
	</div>
</div> </div> </div>

	
</body>
</html>