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
	ResultSet rs=null;
	int j=0,i;
		int count=0;
		rs=st.executeQuery("select * from courses where s_id='"+sid+"'");
		while(rs.next())
			count++;
			if(count!=0){
	  rs=st.executeQuery("select cname,sum(c_id/c_id),sum(status),sum(c_id/c_id)-sum(status),sum(status)*100/(sum(c_id/c_id)) from attendence natural join course_name where s_id='"+sid+"' group by c_id");
	%>
	<h2 align="center"><font color="red">ATTENDANCE DETAILS</font></h2>
	<table cellspacing="1" cellpadding="10" border="1" align="center">
		<tr>
			<th>S.No</th>
			<th>Course Name</th>
			<th>Total Classes</th>
			<th>Present</th>
			<th>Absent</th>
			<th>Percentage</th>
		</tr>
		<%

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
	out.println("<td></td><td><b>Over all</b></td><td>");%><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=Math.round((Float.parseFloat(rs.getString(4))*100))/100%></td></tr></table>
	<%
}
else
{
	out.println("<center>Not Registered for Any Course</center>");
}
}
catch(Exception e)
{
	out.println(e);
}
%>

</body>