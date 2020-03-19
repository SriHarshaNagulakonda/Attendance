<%@ include file="reports.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String fid=""+application.getAttribute("f_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
%>
<form action="#">
	<table align="center">

			<tr>
				<td>Select Course</td>
				<td>
		<%
		ResultSet rs=st.executeQuery("select cname,c_id from course_name where c_id in (select c_id from courses)");
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
</tr></form>
<form action="week1.jsp">
<%
if(request.getParameter("course")!="")
	{
		int i=0;
		String cid=request.getParameter("course");
		%>
		<tr>
			<td>Select Week</td><input type="hidden" name="cid" value="<%=cid%>">
	<%
	 rs=st.executeQuery("select floor(DATEDIFF((select edate from course_name where c_id='"+cid+"'),(select sdate from course_name where c_id='"+cid+"'))/7+1)");
		//out.println(cid);
	
	rs.next();
	%>
	<td><select name="week">
	<%	for( i=1;i<=Integer.parseInt(rs.getString(1));i++)
	{
	%>
	<option value="<%=i%>">Week<%=i%></option>


<%}%></select></td></tr><tr><td></td><td><input type="submit" name="show" value="Show"></td>
<%


}
		}
	catch(Exception e)
	{
		out.println(e);
	}
	%>	</tr>
	</table>
</form>