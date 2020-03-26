<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Register as a Customer</title>
	<link rel="stylesheet" href="css/style.css" >
	<link rel="stylesheet" href="../css/jquery-ui.min.css">
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
	<div align="center">
		<h2 class="pageheading">
			Register as a customer
		</h2>
	</div>
	
	<div align="center">
		
			<form action="register_customer" method="post" id="customerForm" >
		
		<table class="form">
			
			<tr>
				<td align="right">E-Mail:</td>
				<td align="left"><input type="text" id="email" name="email" size="20"  /></td>
			</tr>
			<tr>
				<td align="right">Full Name:</td>
				<td align="left"><input type="text" id="fullName" name="fullName" size="30"  /></td>
			</tr>
			<tr>
				<td align="right">Password :</td>
				<td align="left"><input type="password" id="password" name="password" size="20"  /></td>
			</tr>
			<tr>
				<td align="right">Confirm Password :</td>
				<td align="left"><input type="password" id="confirmPassword" name="confirmPassword" size="20"  /></td>
			</tr>
			<tr>
				<td align="right">Phone:</td>
				<td align="left"><input type="text" id="phone" name="phone" size="15"  /></td>
			</tr>
			<tr>
				<td align="right">Address:</td>
				<td align="left"><input type="text" id="address" name="address" size="30" /></td>
			</tr>
			<tr>
				<td align="right">City:</td>
				<td align="left"><input type="text" id="city" name="city" size="20" /></td>
			</tr>
			<tr>
				<td align="right">Zip Code:</td>
				<td align="left"><input type="text" id="zipcode" name="zipcode" size="10" /></td>
			</tr>
			<tr>
				<td align="right">Country:</td>
				<td align="left"><input type="text" id="country" name="country" size="20" /></td>
			</tr>
			
				
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button id="buttonCancel">Cancel</button>
				</td>
			</tr>				
		</table>
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">

	$(document).ready(function() {
		
		$("#customerForm").validate({
			rules: {
				email:{
					required: true,
					email: true
				},
				fullName: "required",
				password: "required",
				confirmPassword: {
					required: true,
					equalTo: "#password"
				},
				phone: "required",
				address: "required",
				city:"required",
				zipcode: "required",
				country:"required",
			},
			
			messages: {

				email:{
					required: "Please enter an e-mail address",
					email: "Please enter a valid e-mail address"
					},
				fullName: "Please enter Full Name",
				password: "Please confirm Password",
				confirmPassword: {
					required: "Please enter Password",
					equalTo: "Confirm password does not math password"
				},
				phone: "Please enter phone",
				address: "please enter address",
				city:"please enter city",
				zipcode: "please enter zipcode",
				country:"please enter country",
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
	
	function showImageThumbnail(fileInput){
		var file = fileInput.files[0];
		
		var reader = new FileReader();
		
		reader.onload = function(e){
			$('#thumbnail').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	}
	
</script>
</html>