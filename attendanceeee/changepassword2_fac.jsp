<link rel="stylesheet" type="text/css" href="buttoncss.css">
<style type="text/css">
p,center{
	font-size: 20px;
	color: white;
}	
</style>
<%@ include file="staffactivities.jsp"%>
<%@ page import="java.sql.*"%>
	<%
	try{
	String f_id=""+session.getAttribute("f_id");
	String pass=request.getParameter("opass");
	String npass=request.getParameter("npass");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select * from faculty where f_id='"+f_id+"' and pass='"+pass+"' ");
	int r;
	if(rs.next())
	{
		r=st.executeUpdate("update  faculty set pass='"+npass+"' where f_id='"+f_id+"' ");
if(r!=0)
{
		%>
<p align="center"><%="New Password is successfully updated."%></p>
		<%
	}
	}
	else{
	%>
	<p align="center"><%="Invalid Old Password, New Password can not be updated."%></p>
	<%
}
}
catch(Exception e)
{
out.println(e);
}	%>
