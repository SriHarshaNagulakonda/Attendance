<%@ include file="messages.jsp"%>
<%@ page import="java.util.*" %>
<%
Date date=new Date();
/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
try {
    Date date = new Date(sdf.parse(strDate).getTime());
} catch (ParseException e) {
    e.printStackTrace();
}*/
String sid=""+session.getAttribute("s_id");
session.setAttribute("from",sid);
%>
<form action="compose1.jsp">
	<table align="center" cellspacing="10">
		<tr>
			<td>To :</td>
			<td><input type="text" name="to"></td>
		</tr>
		<tr>
			<td>Message :</td>
			<td><textarea rows="5" cols="20" name="msg"></textarea></td>
		</tr>
		<tr>
			<td></td><input type="hidden" name="time" value="<%=date%>">
			<td><input type="submit" name="send" value="Send"></td>
		</tr>
	</table>
</form>