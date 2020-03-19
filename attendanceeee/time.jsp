<link rel="stylesheet" type="text/css" href="buttoncss.css">
<style type="text/css">
		table,p,center{
			color: white;
			font-size: 20px;
		}
	</style>
<link rel="stylesheet" type="text/css" href="selectboxcss.css">
<link rel="stylesheet" type="text/css" href="textboxcss.css">
<%@ include file="adminactivities.jsp"%>
<form action="timetable.jsp">
<table align="center">
	<tr>
		<td>Enter Faculty Id</td>
		<td><input type="text" name="fid"></td>
	</tr>
	<tr>
		<td></td>
		<td>
	<input type="submit" name="submit" value="Submit" class="button button5"></td>
	</tr>
</table>
</form>