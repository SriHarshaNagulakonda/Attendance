<!DOCTYPE html>
<html>
<head>
	<title>Change Password</title>
	<script type="text/javascript">
		function function1(form1) {
			//alert("hello");
			var npass=document.form1.npass.value;
			var opass=document.form1.opass.value;
			if(opass.length==0)
			{
				alert("Old Password can not be null");
				return false;
			}
			var cpass=window.document.form1.cpass.value;
			if(npass.localeCompare(cpass)==0){
                return true;
			}
			else
			{
				alert("New password and Confirm password should be equal");
				return false;
			}
		}
	</script>
</head>
<body>
<%@ include file="studentactivities.jsp"%>
<form  action="changepassword2.jsp" name="form1">
<h1 align="center">Change Password</h1>
<table align="center">
	<tr>
		<td>Enter Old Password</td>
		<td><input type="password" name="opass"></td>
	</tr>
	<tr>
		<td>Enter New Password</td>
		<td><input type="password" name="npass"></td>
	</tr>
	<tr>
		<td>Confirm Password</td>
		<td><input type="password" name="cpass"></td>
	</tr>
	<tr>
		<td></td>
		<td ><input type="submit" name="submit" value="Change Password" onclick="return function1(this)"></td>
	</tr>
</table>
</form>
</body>
</html>