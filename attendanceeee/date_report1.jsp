<link rel="stylesheet" type="text/css" href="buttoncss.css">
<link rel="stylesheet" type="text/css" href="tablecss.css">
<%@ include file="reports.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String fid="101";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	String cid=""+session.getAttribute("cid");
	String date=request.getParameter("date");
	ResultSet rs=st.executeQuery("select name,s_id,status from attendence natural join student where c_id='"+cid+"' and date='"+date+"'");
	%>
	<table border="1" cellpadding="5" align="center">
		<tr>
		<th>Name</th>
		<th>JNTU No.</th>
		<th>Status</th>
		</tr>
		<%
		while(rs.next())
		{
			%>
		<tr>
			<%
			for(int i=1;i<=2;i++)
			{%>
			<td><%=rs.getString(i)%></td>
			<%}%>
			<%
			if(rs.getString(3).equals("1")){
				%>
			<td><%="PRESENT"%></td>
			<%}
			else{%>
			<td><%="ABSENT"%></td>
			<%}%>
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