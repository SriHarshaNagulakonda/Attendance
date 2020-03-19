<link rel="stylesheet" type="text/css" href="buttoncss.css"><%@ page import="java.sql.*" %>
<%
	String user=request.getParameter("name");
	String pass=request.getParameter("pass");
	if(user.equals("admin") && pass.equals("admin"))
		{
	%>
<jsp:forward page="adminactivities.jsp"/>
<%
}
	else
		{
		out.println("not valid");
		}
%>