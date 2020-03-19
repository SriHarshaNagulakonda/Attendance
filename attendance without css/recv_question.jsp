<%@ include file="studentactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String sid=""+session.getAttribute("s_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select c_id,cname from course_name natural join courses where s_id='"+sid+"'");
	%>
	<form action="#">
	<table align="center" cellspacing="10">
		<tr>
			<td>Select Course</td>
			<td>
				<select name="course">
		<%
	while(rs.next())
	{
		%>
		<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
	<%}%>
</select></td><td><input type="submit" name="show" value="Get Assignments"></td></tr></form>
<%
	if(request.getParameter("course")!=""){
	String cid=request.getParameter("course");
	session.setAttribute("cid",cid);
	rs=st.executeQuery("select a_id from question where c_id='"+cid+"' and f_id=(select f_id from courses where c_id='"+cid+"' and s_id='"+sid+"') and a_id not in (select a_id from answer where s_id='"+sid+"' and c_id='"+cid+"')");
%>
<form action="recv_question1.jsp">
<tr>
			<td>Select Pending Assignment</td>
			<td>
				<select name="aid">
		<%
	while(rs.next())
	{
		%>
		<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
	<%}%>
</select></td><tr><td></td><td><input type="submit" name="show" value="Show Assignment"></td></tr></tr>
		<%
}
	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>