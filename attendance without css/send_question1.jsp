<%@ include file="staffactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
String cid="",fid="";
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	  fid=""+application.getAttribute("f_id");
	 String ques=request.getParameter("ques");
	 	  cid=request.getParameter("course");
	  //out.println(cid+" "+fid);
	int count=0;
		ResultSet rs=st.executeQuery("select a_id from question where c_id='"+cid+"' and f_id='"+fid+"'");
		while(rs.next())
			count++;
		int r=st.executeUpdate("insert into question values ('"+(count+1)+"','"+fid+"','"+cid+"','"+ques+"')");
		out.println("<center>Assignment-"+(count+1)+" is Successfully Given</center>");
}
catch(Exception e)
{
	out.println(e);
}%>