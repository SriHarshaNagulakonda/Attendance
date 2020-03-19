<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="buttoncss.css">
  <style type="text/css">
    table{
      font-size: 20px;
      color:white;
    }
  </style>
	<%@ page import="java.sql.*" %>
	<title></title>
	<link rel="stylesheet" type="text/css" href="buttoncss.css">

<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
}

.button5 {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}
.button5 {border-radius: 30px;}
.button5:hover {
  background-color: #555555;
  color: white;
}
</style>
</head>

<body >
	<%
	String f_id1=""+application.getAttribute("f_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement sta=con.createStatement();
	ResultSet res=sta.executeQuery("select name from faculty where f_id='"+f_id1+"'");
	res.next();
	%>
<table align="right"><tr><td>Logged in as <b><%=res.getString(1)%></b></td><td><form action="home.html"><input type="submit" name="submit" value="Log Out" class="button button5"></form></td></tr></table>
<table align="center" cellspacing="20">
	<tr>
		<td align="center"><h3>Staff Activities</h3></td>
		<td>
<form action="att_update.jsp">
<input type="submit" name="submit1" value="Update Attendance" class="button button5" ></form>
</td>
<td>
<form action="searchstudent.jsp">
<input type="submit" name="submit2" value="Search A Student" class="button button5"></form>
</td>
<td>
<form action="report.jsp">
<input type="submit" name="submit3" value="Generate Report"  class="button button5"></form>
</td>
<td>
<form action="send_question.jsp">
<input type="submit" name="submit3" value="Send Assignments" class="button button5" ></form>
</td>
<td>
<form action="recv_answer.jsp">
<input type="submit" name="submit3" value="Check Assignments" class="button button5"></form>
</td>
<td>
<form action="changepassword_fac.jsp">
<input type="submit" name="submit3" value="Change Password" class="button button5"></form>
</td>
</tr>
</table>
<hr>
</body>
</html>