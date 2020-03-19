<link rel="stylesheet" type="text/css" href="buttoncss.css">
<link rel="stylesheet" type="text/css" href="selectboxcss.css">
<style type="text/css">
	p{
		font-size: 20px;
		color: white;
	}
</style>
<%@ include file="staffactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
	<title>Attendance Update</title>
</head>
<body>
	<form action="#">
		<CENTER><h3><font color="red">UPDATE ATTENDANCE</font></h3>

		<table>
			<tr>
				<td>Select Course</td>
				<td>

<%
try{
	
	String fid=""+application.getAttribute("f_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select cname,c_id from course_name where c_id in (select c_id from courses where f_id='"+fid+"')");
	%>
<select name="course">
	<!--<option value=""></option>-->
<%
	while(rs.next())
	{
%>
	<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
<%
	}
%>
</select></td>
<td><input type="submit" name="search" value="Get Students" class="button button5"></td>
</tr>
<tr>
	</FORM>
<FORM action="att_update1.jsp">
	<td>Select Date</td>
	<td><input type="date" name="date" required=""></td>
</tr>
</table>
	<input type="hidden" name="fid" value="<%=fid%>">
<%
if(request.getParameter("course")!="")
	{
		
		out.println("<TABLE cellspacing='10'><tr><th>S.No</th><th>Name</th><th>JNTU No</th><th colspan='2'>STATUS</th></tr>");
		
		int count=0;
		String cid=request.getParameter("course");
	ResultSet rs1=st.executeQuery("select name,s_id from student where s_id in (select s_id from courses where c_id='"+cid+"' and f_id='"+fid+"')");
	while(rs1.next())
	{
		count++;
		String sid=rs1.getString(2);
		%>
		<input type="hidden" name="cid" value="<%=cid%>">
		<tr>
		<td><%=count%></td>
		<td><%=rs1.getString(1)%></td>
		<td><%=sid%></td>
		<td><input type="radio" name="<%=sid%>" value="1" checked="checked">PRESENT</td>
		<td><input type="radio" name="<%=sid%>" value="0" >ABSENT</td>
	</tr>
		<%
	}
	%>
	<tr><td></td><td></td><td colspan="3" align="center"><input type="submit" name="update" value="Update" class="button button5"></td></tr>
</TABLE></FORM>
	<%
	
}
}
catch(Exception e){
	out.println("<p>"+e+"</p>");
}
%>
</CENTER></form></body></html>