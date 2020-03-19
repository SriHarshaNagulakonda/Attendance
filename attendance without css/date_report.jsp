<%@ include file="reports.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String fid="101";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
%>
<form action="#">
	<table border=0 cellpadding="10" align="center">

			<tr>

				<td align="center">Select Course</td>
				<td align="center">
		<%
		ResultSet rs=st.executeQuery("select cname,c_id from course_name where c_id in (select c_id from courses )");
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
<td><input type="submit" name="search" value="Search"></td>
</tr></form><tr><td align="center">Select Date</td><td align="center">
<form action="date_report1.jsp">
<%
if(request.getParameter("course")!="")
	{
		int i=0;
		String cid=request.getParameter("course");
		session.setAttribute("cid",cid);
		//out.println(cid);
		rs=st.executeQuery("select date from attendence where c_id='"+cid+"' group by date");
		out.println("<select name='date'>");
		while(rs.next())
		{
			out.println("<option value="+rs.getString(1)+">"+rs.getString(1)+"</option>");
			out.println(rs.getString(1));
		}
	out.println("</td></tr>");
	}

%>
<tr><td></td><td><input type="submit" name="show" value="Show"></td></tr>
<%
}
catch(Exception e)
{
	out.println(e);
}
%>