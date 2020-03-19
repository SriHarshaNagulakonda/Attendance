<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="buttoncss.css">
	<style type="text/css">
		input[type=text]{
  width: 70%;
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

input[type=text]:focus {
  width: 85%;
  border: 3px solid red;
  padding: 20px 30px
}
		table{
			color: white;
			font-size: 20px;
		}
	</style>
	<title></title>
</head>
<body>
<%@ include file="adminactivities.jsp" %>
<form action="allocatesubject.jsp">
	<table align="center">
		<tr>
			<td>Enter Faculty Id</td>
			<td><input type="text" name="f_id"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="submit" value="Allocate" class="button button5"></td>
		</tr>
	</table>
</form>
</body>
</html>