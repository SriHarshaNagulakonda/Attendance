<%@ include file="adminactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String fid="101";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	String sid=""+session.getAttribute("sid");
	String cid=""+session.getAttribute("cid");
	String date=""+session.getAttribute("date");
	int rs=st.executeUpdate("update attendence set status = case when status = 1 then 0 else 1 end where s_id='"+sid+"' and c_id='"+cid+"' and date='"+date+"'");
	out.println("<center>Successfully Updated</center>");
}
catch(Exception e)
{
	out.println(e);
}
%>