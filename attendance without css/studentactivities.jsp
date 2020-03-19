<!DOCTYPE html>
<html>
<head>
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
		<td>Logged in as <b><%=res.getString(1)%></b></td><td><form action="userlogin.html"><input type="submit" name="submit" value="Log Out"></form></td></tr></table>
<table align="center" cellspacing="20">
	<tr>
		<td align="center"><h3>Student Dash Board</h3></td>
		<td>
<form action="messages.jsp">
<input type="submit" name="submit" value="Messages" ></form>
</td>
<td>
<form action="recv_question.jsp">
<input type="submit" name="submit" value="Assignments" ></form>
</td>
<td>
<form action="personal.jsp">
<input type="submit" name="submit" value="Personal Details" ></form>
</td>
<td>
<form action="attendance.jsp">
<input type="submit" name="submit" value="Attendance Details" ></form>
</td>
<td>
<form action="give_report.jsp">
<input type="submit" name="submit" value="Report about faculty" ></form>
</td>
<td>
<form action="changepassword.jsp">
<input type="submit" name="submit" value="Change Password" ></form>
</td>
</tr>
</table>
<hr>
</body>
</html>