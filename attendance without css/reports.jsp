<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<%@ include file="adminactivities.jsp"%>
<table align="center" cellspacing="20">
	<tr>
		<td>
<form action="date_report.jsp">
<input type="submit" name="submit" value="Date Wise Report" ></form>
</td>
<td>
<form action="week.jsp">
<input type="submit" name="submit2" value="Week Wise Report" ></form>
</td>
<td><form action="overallreport.jsp">
<input type="submit" name="submit1" value="Overall Report" >
</form>
</td>
</tr>
</table>
<hr>
</body>
</html>