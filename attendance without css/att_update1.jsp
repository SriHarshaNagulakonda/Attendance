<%@ include file="staffactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	
	String fid=""+application.getAttribute("f_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	String date=request.getParameter("date");
	String cid=request.getParameter("cid");
	ResultSet rs=st.executeQuery("select c_id from course_name where c_id='"+cid+"' and '"+date+"' between sdate and edate");
	int count=0;
	while(rs.next())
		count++;
	if(count==0)
		out.println("<center>Course doesn't exist on "+date+"</center>");
	else
	{
		rs=st.executeQuery("select s_id from courses where c_id='"+cid+"' and f_id='"+fid+"'");
		String p[]=new String[100];
		String s[]=new String[100];
		int i=0;
		while(rs.next()){
			s[i]=rs.getString(1);
			p[i]=request.getParameter(s[i]);
			//out.println(p[i]);
			i++;
		}
		count=i;
		int r;
		for(int j=0;j<count;j++){
			r=st.executeUpdate("insert into attendence values ('"+s[j]+"','"+cid+"','"+date+"','"+p[j]+"')");
		}
	%>
	<p align="center"><%="Attandence is Successfully Updated"%></p>
	
	<%
}	
}
catch(SQLIntegrityConstraintViolationException  ee)
{
	%>

	<p align="center"><%="Already Updated, Can't update again"%></p>
<%
}
catch(Exception e)
{
	out.println(e);
}
%>