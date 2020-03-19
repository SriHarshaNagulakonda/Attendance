<%@ include file="studentactivities.jsp"%>
<%@ page import="java.sql.*"%>
	<%
	try{
	String s_id=""+session.getAttribute("s_id");
	String pass=request.getParameter("opass");
	String npass=request.getParameter("npass");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select * from student where s_id='"+s_id+"' and pass='"+pass+"' ");
	int r;
	if(rs.next())
	{
		r=st.executeUpdate("update  student set pass='"+npass+"' where s_id='"+s_id+"' ");
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
