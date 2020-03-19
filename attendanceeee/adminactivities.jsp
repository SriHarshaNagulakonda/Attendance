<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="buttoncss.css">
	<title></title>

</head>
<body >
<table align="right"><tr><td style="color: white;">Logged in as <b>Admin</b></td><td><form action="home.html"><input type="submit" name="submit" value="Log Out" class="button button5"></form></td></tr></table>
<table align="center" cellspacing="20">
	<tr>
		<td align="center"><h3 style="color: white;">Admin Activities</h3></td>
		<td>
<form action="stud_regh.jsp">
<input type="submit" name="submit" value="Add Student" class="button button5" ></form>
</td>
<td>
<form action="faculty_regh.jsp">
<input type="submit" name="submit2" value="Add Faculty" class="button button5" ></form>
</td>
<td><form action="subjectallocate.jsp">
<input type="submit" name="submit1" value="Allocate Subject" class="button button5">
</form>
</td>
<td><form action="att_edit.jsp">
<input type="submit" name="submit1" value="Edit Attendance" class="button button5"></form>
</td>
<td><form action="reports.jsp">
<input type="submit" name="submit1" value="Attendance Reports" class="button button5"></form>
</td>
<td><form action="time.jsp">
<input type="submit" name="submit1" value="Generate Time Table" class="button button5"></form>
</td>
<td><form action="add_courseh.jsp">
<input type="submit" name="submit1" value="Add Course" class="button button5"></form>
</td>
</tr>
</table>
<hr>
</body>
</html>