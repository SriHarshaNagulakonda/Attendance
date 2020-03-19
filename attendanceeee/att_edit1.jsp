<link rel="stylesheet" type="text/css" href="buttoncss.css">
<style type="text/css">
		table,p,center{
			color: white;
			font-size: 20px;
		}
	</style>
<%@ include file="adminactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String fid="101";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	String sid=request.getParameter("sid");
	String cid=request.getParameter("cid");
	String date=request.getParameter("date");
	session.setAttribute("sid",sid);
	session.setAttribute("cid",cid);
	session.setAttribute("date",date);
	ResultSet rs=st.executeQuery("select status from attendence where s_id='"+sid+"' and c_id='"+cid+"' and date='"+date+"'");%>
	<form action="att_edit2.jsp">
		<%
	if(rs.next()){
	if(rs.getString(1).equals("1"))
		{
			out.println("<center>The Student is present on that date</center><br>");
			out.println("<center><input type='submit' name='edit' value='Mark as absent' class='button button5'></center>");
		}
	else
	{
			out.println("<center>The Student is absent on that date</center><br>");		
			out.println("<center><input type='submit' name='edit' value='Mark as present' class='button button5'></center>");
	}}
	else
	{
		out.println("<center>Invalid details or Attendence not updated yet</center>");
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
