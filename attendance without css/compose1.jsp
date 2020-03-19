<%@ include file="messages.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	String to=request.getParameter("to");
	String time=request.getParameter("time");
	String msg=request.getParameter("msg");
	String from=""+session.getAttribute("from");
	int count=0;
	ResultSet r=st.executeQuery("select s_id from student where s_id='"+to+"' and s_id <> '"+from+"'");
	while(r.next())
		count++;
	if(count>0)
	{
	int rs=st.executeUpdate("insert into messages values('"+from+"','"+to+"','"+msg+"','"+time+"')");
	if(rs==1)
		out.println("<center>Message is successfully sent</center>");
	else
		out.println("<center>Message is not sent</center>");
	}
	else
	{
		out.println("<center>Invalid Recieptent</center>");
	}

}
catch(Exception e)
{
	out.println(e);
}
%>