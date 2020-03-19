<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="buttoncss.css">
	<style type="text/css">
		table{
			color: white;
			font-size: 20px;
		}
	</style>
	<title></title>
</head>
<body>
	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.Statement"%>
	<%@ page import="java.sql.ResultSet"%>
	<%@ page import="java.sql.DriverManager"%>
	<%
	String s_id1=""+session.getAttribute("s_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement sta=con.createStatement();
	ResultSet res=sta.executeQuery("select name from student where s_id='"+s_id1+"'");
	res.next();
	%>
<table align="right">
	<tr>
		<td>Logged in as <b><%=res.getString(1)%></b></td><td><form action="home.html"><input type="submit" name="submit" value="Log Out" class="button button5"></form></td></tr></table>
<table align="center" cellspacing="20">
	<tr>
		<td align="center"><h3>Student Dash Board</h3></td>
		<td>
<form action="messages.jsp">
<input type="submit" name="submit" value="Messages" class="button button5"></form>
</td>
<td>
<form action="recv_question.jsp">
<input type="submit" name="submit" value="Assignments" class="button button5"></form>
</td>
<td>
<form action="personal.jsp">
<input type="submit" name="submit" value="Personal Details" class="button button5"></form>
</td>
<td>
<form action="attendance.jsp">
<input type="submit" name="submit" value="Attendance Details" class="button button5"></form>
</td>
<td>
<form action="give_report.jsp">
<input type="submit" name="submit" value="Report about faculty" class="button button5"></form>
</td>
<td>
<form action="changepassword.jsp">
<input type="submit" name="submit" value="Change Password" class="button button5"></form>
</td>
</tr>
</table>
<hr>
</body>
</html>