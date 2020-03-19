<link rel="stylesheet" type="text/css" href="buttoncss.css">
<link rel="stylesheet" type="text/css" href="textboxcss.css">
<style type="text/css">
		table,p{
			color: white;
			font-size: 20px;
		}
	</style>
<%@ include file="adminactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String fid="101";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
%>
<h2 align="center"><font color="red">EDIT ATTANDANCE</font></h2>
<form action="att_edit1.jsp">
	<table align="center">
		<tr>
			<td>Enter Student Id</td>
			<td><input type="text" name="sid"></td>
		</tr>
		<tr>
			<td>Enter Course Id</td>
			<td><input type="text" name="cid"></td>
		</tr>
		<tr>
			<td>Select Date</td>
			<td><input type="date" name="date" required=""></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="show" value="Show" class="button button5"></td>
		</tr>
	</table>
</form>
<%
}
catch(Exception e)
{
	out.println(e);
}
%>