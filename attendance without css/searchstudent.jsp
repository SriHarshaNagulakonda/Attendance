<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" http-equiv="Content-Type" content="text/html">
	<title></title>
</head>
<body>
	<%@ include file="staffactivities.jsp" %>
	<form action="search1.jsp" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td>Enter JNTU No. to Search</td>
				<td><input type="text" name="sid" ></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="show" value="Search"></td>
			</tr>
		</table>
	</form>
</body>
</html>