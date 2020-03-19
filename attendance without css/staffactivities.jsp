<!DOCTYPE html>
<html>
<head>
	<%@ page import="java.sql.*" %>
	<title></title>
</head>

<body>
	<%
	String f_id1=""+application.getAttribute("f_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement sta=con.createStatement();
	ResultSet res=sta.executeQuery("select name from faculty where f_id='"+f_id1+"'");
	res.next();
	%>
<table align="right"><tr><td>Logged in as <b><%=res.getString(1)%></b></td><td><form action="userlogin.html"><input type="submit" name="submit" value="Log Out"></form></td></tr></table>
<table align="center" cellspacing="20">
	<tr>
		<td align="center"><h3>Staff Activities</h3></td>
		<td>
<form action="att_update.jsp">
<input type="submit" name="submit1" value="Update Attendance" ></form>
</td>
<td>
<form action="searchstudent.jsp">
<input type="submit" name="submit2" value="Search A Student" ></form>
</td>
<td>
<form action="report.jsp">
<input type="submit" name="submit3" value="Generate Report" ></form>
</td>
<td>
<form action="send_question.jsp">
<input type="submit" name="submit3" value="Send Assignments" ></form>
</td>
<td>
<form action="recv_answer.jsp">
<input type="submit" name="submit3" value="Check Assignments" ></form>
</td>
</tr>
</table>
<hr>
</body>
</html>