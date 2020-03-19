<link rel="stylesheet" type="text/css" href="buttoncss.css">
<link rel="stylesheet" type="text/css" href="tablecss.css">

<link rel="stylesheet" type="text/css" href="selectboxcss.css">
<%@ include file="reports.jsp"%>
<%@ page import="java.sql.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select cname,c_id from course_name where c_id in (select distinct(c_id) from attendence)");
	%>
	<table align="center">
		<form action="#">
			<tr>
				<td>Select Course</td>
				<td style="width: 200px;"><select name="course">
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
<td><input type="submit" name="search" value="Search" class="button button5"></td>
</tr>
<%
if(request.getParameter("course")!="")
{
	String cid=request.getParameter("course");
	rs=st.executeQuery("select name,s_id,sum(c_id/c_id),sum(status),sum(c_id/c_id)-sum(status),round(sum(status)*100/sum(c_id/c_id)*100)/100 from attendence natural join student where c_id='"+cid+"' group by c_id,s_id");%>
</form></table><FONT COLOR="RED"><h2 align="center">ATTENDANCE DETAILS</h2></FONT>
	<table cellspacing="1" cellpadding="10" border="1" align="center">
		<tr>
			<th>S.No</th>
			<th>Name</th>
			<th>JNTU No</th>
			<th>Total Classes</th>
			<th>Present</th>
			<th>Absent</th>
			<th>Percentage</th>
			<th>Eligibility</th>
		</tr>
		<%
		int j=0,i;
	while(rs.next())
	{j++;
	%>
		<tr><td><%=j%></td>
			<%
		for( i=1;i<=6;i++)
			out.println("<td>"+rs.getString(i)+"</td>");

		if(Float.parseFloat(rs.getString(6))>=75)
			out.println("<td>Eligible</td>");
		else{
			out.println("<td>Not Eligible</td>");
		}
		out.println("</tr>");
	}
}
}
catch(Exception e)
{
	out.println(e);
}
%>