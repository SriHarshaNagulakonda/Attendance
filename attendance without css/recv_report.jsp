<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("SELECT f.name,s.name,r.report FROM report r INNER JOIN faculty f ON r.f_id = f.f_id INNER JOIN student s ON r.s_id = s.s_id");
	%>
	<table>
		<tr>
			<th>Faculty Name</th>
			<th>Student Name</th>
			<th>Report/Complaint</th>
		</tr>
		<%
		while(rs.next())
		{
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
			</tr>
		<%}%>
	</table>
	<%
}
catch(Exception e)
{
	out.println(e);
}
%>