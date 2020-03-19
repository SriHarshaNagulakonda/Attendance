<%@ include file="studentactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String sid=""+session.getAttribute("s_id");
	session.setAttribute("sid",sid);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select distinct(f_id) from courses where s_id='"+sid+"'");
	%>
	<head>
	<script type="text/javascript">
		function validate(form1){

			var text=window.document.form1.report.value;
			if(text.length==0){
				document.getElementById('q').innerHTML="Report can't be null";
				return false;
			}
			return true;
		}
	</script>
</head>
<form action="give_report1.jsp" name="form1">
	<font style="color: red"><h3 align="center">Report About Faculty</h3></font>
		<table align="center">
		<tr>
			<td>Select Faculty Id</td>
			<td><select name="fid">
	<%while(rs.next())
	{%>
		<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>	
<%}%>
	</select></td>
		</tr>
		<tr>
			<td>Enter Reports/ Feedback</td>
			<td><textarea cols="20" rows="5" name="report"></textarea></td>
			<td><font color="blue" size="1 "><span id="q"></span></font></td>
		
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="submit" value="Report" onclick="return validate(this)"></td>
		</tr>
	</table>
</form>
<%
}
catch(Exception e)
{
	out.println(e);
}%>