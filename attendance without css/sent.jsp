<%@ include file="messages.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	String sid=""+session.getAttribute("s_id");
	ResultSet rs=st.executeQuery("select too,msg,time from messages where fromm='"+sid+"' order by time desc");
	int count=0;
	while(rs.next())
	{
		count++;
	}
	//out.println(count);
	if(count!=0)
	{
	%>
	<table cellpadding="10" align="center">
		<tr>
		<th>To</th>
		<th>Message</th>
		<th>Date and Time</th>
	</tr>
		<%
		rs=st.executeQuery("select too,msg,time from messages where fromm='"+sid+"' order by time desc");
	while(rs.next())
	{%>
		<tr>
			<%
			for(int i=1;i<=3;i++)
			{%>
				<td><%=rs.getString(i)%></td>
<%
			}%>
		</tr>
<%
	}
}
else
{
	%>
	<p align="center"><%="No Messages"%></p>
	<%
}
}
	catch(Exception e)
	{
		out.println(e);
	}
	%>