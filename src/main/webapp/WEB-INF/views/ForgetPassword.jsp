<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
</head>
<body>
	<form action="sendotpforgetpassword" method ="post">
		
		Email:    <input type="email" name="email"><br><br>
		
		<input type="submit" value="send otp">
		
	</form>
	<a href="updatepasswordjspopen">Already have otp</a>
	<br>${error}<br>
	<a href="login">Login</a>

</body>
</html>