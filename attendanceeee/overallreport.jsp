<link rel="stylesheet" type="text/css" href="buttoncss.css">
<link rel="stylesheet" type="text/css" href="tablecss.css">
<%@ include file="reports.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String fid="101";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();%>
<h2 align="center"><font color="red">ELIGIBILITY CRITERIA FOR END EXAMS</font></h2>
	<%
	 ResultSet 	rs=st.executeQuery("select s_id,name,count(status) as total,sum(status) as present,(count(status)-sum(status)) as absent,sum(status)*100/count(status) as percentage from attendence natural join student where s_id in (select s_id from student) group by s_id");
	%>
	<table cellspacing="1" cellpadding="10" border="1" align="center">
		<tr>
			<th>S.No</th>
			<th>JNTU No</th>
			<th>Name</th>
			<th>Total Classes</th>
			<th>Present</th>
			<th>Absent</th>
			<th>Percentage</th>
			<th>Eligibility</th>
			<th>Eligibility with condonation</th>
		</tr>
		<%
		int j=0,i;
	while(rs.next())
	{j++;
	%>
		<tr><td><%=j%></td>
			<%
		for( i=1;i<=6;i++){
			out.println("<td>"+rs.getString(i)+"</td>");
		}
		if(Float.parseFloat(rs.getString(6))>=75)
			out.println("<td>Eligible</td><td>-</td>");
		else{
			out.println("<td>Not Eligible</td>");
			if(Float.parseFloat(rs.getString(6))>=65)
				out.println("<td>Eligible</td>");
			else
				out.println("<td>Not Eligible</td>");
		}

		out.println("</tr>");

	}
	
}
catch(Exception e)
{
	out.println(e);
}
%>