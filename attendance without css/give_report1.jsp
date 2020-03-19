<%@ include file="studentactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	String fid=request.getParameter("fid");
	String sid=""+session.getAttribute("sid");
	String rep=request.getParameter("report");
	int  rs=st.executeUpdate("insert into  report values('"+sid+"','"+fid+"','"+rep+"')");
	%>
	<p align="center"><%="Successfully Submitted Report"%></p>
	<%
}
catch(Exception e)
{
	out.println(e);
}
%>
