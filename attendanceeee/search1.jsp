<link rel="stylesheet" type="text/css" href="buttoncss.css"><style type="text/css">
	.table2 {
  border-collapse: collapse;
  width: 50%;
}
.table2.td{
  text-.lign: left;
  padding: 8px;
}

.table2.tr:nth-child(even){background-color: #f2f2f2 ;color: black;}
.table2.th {
  background-color: #4CAF50;
  color: white;
}
center{
	font-size: 20px;
	color: white;
}
</style>
<%@ include file="staffactivities.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<body>
<%
try{
	
	String sid=request.getParameter("sid");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select * from student where s_id='"+sid+"'");
	if(rs.next()){
	%>
	
	<table border="0" cellspacing="50">
		<tr>
		<td align="left">	<h2><font color="red">PERSONAL DETAILS</font></h2></td>
		<td colspan="2" align="center"><h2><font color="red">ATTENDANCE DETAILS</font></h2></td></tr>
		<tr>

			<td>
			<table cellspacing="10" align="left">
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
	int count=0;
		rs=st.executeQuery("select * from courses where s_id='"+sid+"'");
		while(rs.next())
			count++;
			if(count!=0){
	 rs=st.executeQuery("select cname,sum(c_id/c_id),sum(status),sum(c_id/c_id)-sum(status),sum(status)*100/(sum(c_id/c_id)) from attendence natural join course_name where s_id='"+sid+"' group by c_id");
	%>
	<td colspan="2" align="right">
		<div class="table2">
	<table cellspacing="1" cellpadding="10" border="1" align="right" >
		<tr>
			<th>S.No</th>
			<th>Course Name</th>
			<th>Total Classes</th>
			<th>Present</th>
			<th>Absent</th>
			<th>Percentage</th>
		</tr>
		<%
		int j=0,i;
	while(rs.next())
	{j++;
	%>
		<tr><td><%=j%></td>
			<%
		for( i=1;i<=5;i++)
			out.println("<td>"+rs.getString(i)+"</td>");
		out.println("</tr>");
	}
	rs=st.executeQuery("select sum(c_id/c_id),sum(status),sum(c_id/c_id)-sum(status),sum(status)*100/(sum(c_id/c_id)) from attendence where s_id='"+sid+"'");
	rs.next();
	out.println("<td></td><td><b>Over all</b></td><td>");%><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=Math.round((Float.parseFloat(rs.getString(4))*100))/100%></td></tr></table></div>
</td>
	<%}
	else
	{
		out.println("<center><td>Not Registered for Any Course</td></center>");
	}
}
else
{
	out.println("<center>Invalid Id</center>");
}
}
catch(Exception e)
{
	out.println(e);
}
%>
</tr></table>
</body>