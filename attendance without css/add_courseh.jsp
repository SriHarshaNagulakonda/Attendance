<%@ include file="adminactivities.jsp"%>
<form action="add_course.jsp">

<html>
<head>
	<title>Add Course</title>
</head>
<body>
<form action="add_course.jsp">

	<center><font color="red"><h2>ADD COURSE</h2></font></center>
	<BR>
	<table align="center" cellpadding="10">
		<tr>
			<td>Course Name</td>
			<td><input type="text" name="course"></td>
		</tr>
		<tr>
			<td>Enter Course Start Date</td>
			<td><input type="date" name="sdate"></td>
		</tr>
		<tr>
			<td>Enter Course End Date</td>
			<td><input type="date" name="edate"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="submit" value="Submit"></td>
		</tr>
	</table>
</form>
</body>
</html>