<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" type="text/css" href="buttoncss.css">
	<style type="text/css">
		h1{
			color: red;
		}
	input[type=password]{
  width: 55%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 4px solid grey;
  border-radius: 10px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}

input[type=password]:focus {
  width: 85%;
  border: 3px solid red;
  padding: 20px 30px
}
</style>
	<link rel="stylesheet" type="text/css" href="buttoncss.css">
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
<%@ include file="staffactivities.jsp"%>
<form  action="changepassword2_fac.jsp" name="form1">
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
		<td ><input type="submit" name="submit" value="Change Password" onclick="return function1(this)" class="button button5"></td>
	</tr>
</table>
</form>
</body>
</html>