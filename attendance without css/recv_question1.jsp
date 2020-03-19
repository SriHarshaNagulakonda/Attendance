<%@ include file="studentactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String sid=""+session.getAttribute("s_id");
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	String cid=""+session.getAttribute("cid");
	
	String aid=request.getParameter("aid");

		if(aid!=null){
	session.setAttribute("aidd",aid);
	session.setAttribute("cid",cid);
	session.setAttribute("sid",sid);
	ResultSet rs=st.executeQuery("select question from question where c_id='"+cid+"' and a_id='"+aid+"' and f_id=(select f_id from courses where s_id='"+sid+"' and c_id='"+cid+"')");
	while(rs.next()){
	%>

<head>
	<script type="text/javascript">
		function validate(form1) {

			var text=window.document.form1.ans.value;
			if(text.length==0){
				document.getElementById('q').innerHTML="Answer can't be null";
				return false;
			}
			return true;
		}
	</script>
</head>
	<font color="red" ><b><p align="center"><%="Assignment"+aid+""%></p><b></font>
	<form name="form1" action="recv_question2.jsp">
	<table cellpadding="10" align="center">
		<tr>
			<td>Question :</td>
		<td><%=rs.getString(1)%></td>	<%}%>
		</tr><tr><td>Answer :</td>
		<td><textarea name="ans" rows="5" cols="20"></textarea></td></tr>
		<tr><td></td>
			<td><input type="submit" name="submit" value="Submit" onclick="return validate(this)"></td>
			<td><font color="blue" size="1 "><span id="q"></span></font></td>
		</tr></table></form>
		<%
}
else
{
	out.println("<center>No Assignments</center>");
}
}
catch(Exception e)
{
	out.println(e);
}
%>