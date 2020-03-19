<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="buttoncss.css">
	<link rel="stylesheet" type="text/css" href="textboxcss.css">
	<meta charset="utf-8" http-equiv="Content-Type" content="text/html">
	<title></title>
	<script type="text/javascript">
		function validate(form1) {
			var sid=document.form1.sid.value;
			if(sid.length==0)
			{
				alert("SID cant be Empty");
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	<%@ include file="staffactivities.jsp" %>
	<form action="search1.jsp" enctype="multipart/form-data" name="form1">
		<table align="center">
			<tr>
				<td>Enter JNTU No. to Search</td>
				<td><input type="text" name="sid" ></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="show" value="Search" class="button button5" onclick="return validate(this)"></td>
			</tr>
		</table>
	</form>
</body>
</html>