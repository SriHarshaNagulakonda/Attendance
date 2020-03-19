<%@ include file="studentactivities.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<body>
<%
try{
	
	String sid=""+session.getAttribute("s_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select * from student where s_id='"+sid+"'");
	rs.next();
	%>
	
	
			<h2 align="center"><font color="red">PERSONAL DETAILS</font></h2>
		
		
			<table cellspacing="10" align="center">
		<tr>
			<td><b>JNTU No :</b></td>
			<td><%=sid%></td>
		</tr>
		<tr>
			<td><b>Name :</b></td>
			<td><%=rs.getString(1)%></td>
		</tr>
		<tr>
			<td><b> Father Name :</b></td>
			<td><%=rs.getString(2)%></td>
		</tr>
		<tr>
			<td><b>Mother Name :</b></td>
			<td><%=rs.getString(3)%></td>
		</tr>
		<tr>
			<td><b>Gender :</b></td>
			<td><%=rs.getString(4)%></td>
		</tr>
		<tr>
			<td><b>Date of Birth :</b></td>
			<td><%=rs.getString(5)%></td>
		</tr>
		<tr>
			<td><b>City :</b></td>
			<td><%=rs.getString(6)%></td>
		</tr>
		<tr>
			<td><b>PinCode :</b></td>
			<td><%=rs.getString(7)%></td>
		</tr>
		<tr>
			<td><b>Phone Number :</b></td>
			<td><%=rs.getString(8)%></td>
		</tr>
		<tr>
			<td><b>Email :</b></td>
			<td><%=rs.getString(9)%></td></tr>
		<tr>
			<td><b>Photo :</b></td>
			<%
		String path=rs.getString(11);
			%>

			<td><img src="<%=path%>" height="130" width="130"></td>
		</tr>

	</table></td>
	<%
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
	