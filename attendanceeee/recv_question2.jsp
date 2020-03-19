<link rel="stylesheet" type="text/css" href="buttoncss.css">
<%@ include file="studentactivities.jsp"%>
<style type="text/css">
table,p,center{
	font-size: 20px;
	color: white;
}
</style>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	String aid=""+session.getAttribute("aidd");
	String cid=""+session.getAttribute("cid");
	String sid=""+session.getAttribute("s_id");
	String ans=request.getParameter("ans");
	int rs=st.executeUpdate("insert into answer values ('"+aid+"','"+cid+"','"+sid+"','"+ans+"')");
		out.println("<center>Successfully submitted Assignment"+aid+"</center>");
}
catch(Exception e)
{
	//out.println(e);
	out.println("<center>Not submitted</center>");
}
%>