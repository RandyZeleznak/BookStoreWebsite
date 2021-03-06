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
			Customer Edit Self  Profile Page
		</h2>
	</div>
	
	<div align="center">
		
			<form action="update_profile" method="post" id="customerForm" >
		
		<table class="form">
			
	  		<tr>
				<td align="right">E-Mail:</td>
				<td align="left">${loggedCustomer.email}
				<input type="hidden" name="email" value="${loggedCustomer.email}"/></td>
			</tr>
			<tr>
				<td align="right">First Name:</td>
				<td align="left"><input type="text" id="firstName" name="firstName" size="30" value="${loggedCustomer.firstName}" /></td>
			</tr>
			<tr>
				<td align="right">Last Name:</td>
				<td align="left"><input type="text" id="lastName" name="lastName" size="30" value="${loggedCustomer.lastName}" /></td>
			</tr>
			
			<tr>
				<td align="right">Phone:</td>
				<td align="left"><input type="text" id="phone" name="phone" size="15" value="${loggedCustomer.phone}"  /></td>
			</tr>
			<tr>
				<td align="right">Address Line 1:</td>
				<td align="left"><input type="text" id="addressLine1" name="addressLine1" size="30" value="${loggedCustomer.addressLine1}"/></td>
			</tr>
			<tr>
				<td align="right">Address Line 2:</td>
				<td align="left"><input type="text" id="addressLine2" name="addressLine2" size="30" value="${loggedCustomer.addressLine2}"/></td>
			</tr>
			<tr>
				<td align="right">City:</td>
				<td align="left"><input type="text" id="city" name="city" size="20" value="${loggedCustomer.city}" /></td>
			</tr>
			<tr>
				<td align="right">State:</td>
				<td align="left"><input type="text" id="state" name="state" size="20" value="${loggedCustomer.state}" /></td>
			</tr>	
			<tr>
				<td align="right">Country:</td>
				<td align="left">
					<select name="country" id="country">
					<c:forEach items="${mapCountries}" var="country">
						<option value="${country.value}" <c:if test="${loggedCustomer.country eq country.value}">selected='selected'</c:if> >${country.key}</option>
					</c:forEach>
					</select>
			</tr>
			<tr>
				<td align="right">Zip Code:</td>
				<td align="left"><input type="text" id="zipcode" name="zipcode" size="10" value="${loggedCustomer.zipcode}"  /></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<i>Leave password fields blank if you are not changing your password!
				</td>
			</tr>
			
			<tr>
				<td align="right">Password :</td>
				<td align="left"><input type="password" id="password" name="password" size="20"  /></td>
			</tr>
			<tr>
				<td align="right">Confirm Password :</td>
				<td align="left"><input type="password" id="confirmPassword" name="confirmPassword" size="20"  /></td>
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
				confirmPassword: {
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
					equalTo: "Confirm password does not match password"
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