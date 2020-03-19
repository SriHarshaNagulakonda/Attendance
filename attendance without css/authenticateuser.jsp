<%@ page import="java.sql.*" %>
<%
try{
	String user=request.getParameter("name");
	String pass=request.getParameter("pass");
	

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");	
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from student where s_id='"+user+"' and pass='"+pass+"'");
int count=0;
if(rs.next())
{
	count++;
}
if(count>0){
session.setAttribute("s_id",user);
%>
<jsp:forward page="studentactivities.jsp"/>
<%
}
else
{
	rs=st.executeQuery("select * from faculty where f_id='"+user+"' and pass='"+pass+"'");
if(rs.next())
{
	count++;
	
}
if(count>0)
{
	application.setAttribute("f_id",user);
	
	//response.sendRedirect("staffactivities.jsp");
%>
<jsp:forward page="staffactivities.jsp"/>
<%
}
else
out.println("<center><h1>Invalid details</h1></center>");
}

}
catch(Exception e){
	out.println(e);
}
%>