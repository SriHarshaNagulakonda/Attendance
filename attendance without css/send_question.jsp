<%@ include file="staffactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
String cid=" ";
try{
	String fid=""+application.getAttribute("f_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();

%>
<head>
	<script type="text/javascript">
		function validate(form1) {
			var text=window.document.form1.ques.value;
			if(text.length==0){
				document.getElementById('q').innerHTML="question can't be null";
				return false;
			}
			return true;
		}
	</script>
</head><body>
	<table cellspacing="10" align="center">
		<form action="send_question1.jsp" name="form1">

			
		<%
		ResultSet rs=null;
		int temp=0;
		rs=st.executeQuery("select * from courses where f_id='"+fid+"'");
		while(rs.next())
		{
			temp++;
		}
		if(temp!=0){
		rs=st.executeQuery("select cname,c_id from course_name where c_id in (select c_id from courses where f_id='"+fid+"')");
	%>
	<tr>
				<td>Select Course</td>
				<td>
<select name="course">
<%
	while(rs.next())
	{
%>
	<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
<%
	}
%>
</select></td>
</tr>
<%
if(request.getParameter("course")!="")
	{
		int i=0;
		cid=request.getParameter("course");
		session.setAttribute("cid",cid);
		session.setAttribute("f_id",fid);
		int count=0;

		 rs=st.executeQuery("select a_id from question where c_id='"+cid+"' and f_id='"+fid+"'");
		while(rs.next())
			count++;
			
			%>
			<table cellspacing="10" align="center">
				<tr>
				<td>Enter Question</td>
				<td><textarea rows="5" cols="20" name="ques" ></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" name="send" value="Send" onclick="return validate(this)"></td>
					<td><font color="blue" size="1 "><span id="q"></span></font></td>
				</tr>
			</table>
		</form></table></body><%
	}
}
else
{
	out.println("<center>No students for your course</center>");
}
}
//out.println("<center>No students for your course</center>");

catch(Exception e)
{
	out.println(e);
}
		%>
