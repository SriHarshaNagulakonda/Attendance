<%@ include file="adminactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rrs=st.executeQuery("select c_id from course_name");
	int count=0;
	while(rrs.next())
		count++;
	int rs=st.executeUpdate("insert into course_name values('"+(count+1)+"','"+request.getParameter("sdate")+"','"+request.getParameter("edate")+"','"+request.getParameter("course")+"')");
	out.println("<center>Successfully Course Added</center>");
}
catch(SQLIntegrityConstraintViolationException ee)
{
	out.println("<center>This Course is Already Registed</center>");
}
catch(Exception e)
{
	out.println(e);
}
%>