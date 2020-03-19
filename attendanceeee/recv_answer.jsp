<link rel="stylesheet" type="text/css" href="buttoncss.css">
<link rel="stylesheet" type="text/css" href="textboxcss.css">

<link rel="stylesheet" type="text/css" href="tablecss.css">
<style type="text/css">
	center,p{
		font-size: 20px;
		color: white;
	}
</style>
<link rel="stylesheet" type="text/css" href="selectboxcss.css">
<%@ include file="staffactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String fid=""+application.getAttribute("f_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	%>
	<form action="#" name="form1">
<table cellspacing="10" align="center">
			<tr>
				<td>Select Course</td>
				<td style="width: 200px;">
		<%
		ResultSet rs=st.executeQuery("select cname,c_id from course_name where c_id in (select c_id from courses where f_id='"+fid+"')");
	%>
<select name="course">
	<!--<option value=""></option>-->
<%
	while(rs.next())
	{
%>
	<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
<%
	}
%>
</select></td>
<td><input type="submit" name="show" value="Show" class="button button5"></td>
</tr></form></table>

<%
if(request.getParameter("course")!="")
	{
		int i=0;
		ResultSet rrs;
		String q[][]=new String[100][2];
	String	cid=request.getParameter("course");
		//out.println(cid);
		 rs=st.executeQuery("select a_id,question from question where f_id='"+fid+"' and c_id='"+cid+"'");
		while(rs.next()){
			q[i][0]=rs.getString(1);
			q[i][1]=rs.getString(2);
			i++;
		}
		int count=i;
		//out.println(count);
		rs=st.executeQuery("select a_id,question from question where f_id='"+fid+"' and c_id='"+cid+"'");
			for(i=0;i<count;i++){		
			String aid=q[i][0];
			%>
			<h4 align="center"><font color="red">Assignment <%=aid%>:  </font></h4 ><center><%=q[i][1]%></center>
			<table cellpadding="10" border="1"  align="center"><tr>
	<th>Name</th>
	<th>JNTU NO</th>
	<th>Answer</th>
</tr>
			<%
			 rrs=st.executeQuery("select s_id,name,answer from answer natural join student where a_id='"+aid+"' and s_id in ( SELECT s_id FROM answer WHERE a_id ='"+aid+"' AND s_id IN ( SELECT s_id FROM courses WHERE f_id ='"+fid+"' AND c_id ='"+cid+"')) ");
			while(rrs.next())
			{
			%>
			<tr>
				<td><%=rrs.getString(1)%></td>
				<td><%=rrs.getString(2)%></td>
				<td><%=rrs.getString(3)%></td>
			</tr>
		<%}
%></table>
<br>
<br>
<center>
Students who didn't submit Assignment-<%=q[i][0]%> are:</center> <br><%

rs=st.executeQuery("select s_id,name from courses natural join student where f_id='"+fid+"' and c_id='"+cid+"' and s_id not in (select s_id from answer where a_id='"+q[i][0]+"')");
while(rs.next()){%>
<table  align="center">
	<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
	</tr>
		<%
	}%>
	</table><%
}}}
catch(Exception e)
{
	out.println(e);
}%>