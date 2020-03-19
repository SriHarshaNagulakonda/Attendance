<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="head.css">
</head>
<body>
<table align="right"><tr><td>Logged in as <b>Admin</b></td><td><form action="adminlogin.html"><input type="submit" name="submit" value="Log Out"></form></td></tr></table>
<table align="center" cellspacing="20">
	<tr>
		<td align="center"><h3>Admin Activities</h3></td>
		<td>
<form action="stud_regh.jsp">
<input type="submit" name="submit" value="Add Student" class="submit" ></form>
</td>
<td>
<form action="faculty_regh.jsp">
<input type="submit" name="submit2" value="Add Faculty" ></form>
</td>
<td><form action="subjectallocate.jsp">
<input type="submit" name="submit1" value="Allocate Subject" >
</form>
</td>
<td><form action="att_edit.jsp">
<input type="submit" name="submit1" value="Edit Attendance" ></form>
</td>
<td><form action="reports.jsp">
<input type="submit" name="submit1" value="Attendance Reports" ></form>
</td>
<td><form action="time.jsp">
<input type="submit" name="submit1" value="Generate Time Table" ></form>
</td>
<td><form action="add_courseh.jsp">
<input type="submit" name="submit1" value="Add Course" ></form>
</td>
</tr>
</table>
<hr>
</body>
</html>