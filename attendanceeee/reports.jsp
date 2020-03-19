<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="buttoncss.css">
	<style type="text/css">
		table,p,center{
			color: white;
			font-size: 20px;
		}
	</style>
	<title></title>
</head>
<body>
	<%@ include file="adminactivities.jsp"%>
<table align="center" cellspacing="20">
	<tr>
		<td>
<form action="date_report.jsp">
<input type="submit" name="submit" value="Date Wise Report" class="button button5"></form>
</td>
<td>
<form action="week.jsp">
<input type="submit" name="submit2" value="Week Wise Report" class="button button5"></form>
</td>
<td><form action="overallreport.jsp">
<input type="submit" name="submit1" value="Overall Report" class="button button5">
</form>
</td>
<td><form action="course_wise_report.jsp">
<input type="submit" name="submit1" value="Course wise Report" class="button button5">
</form>
</td>
</tr>
</table>
<hr>
</body>
</html>