<link rel="stylesheet" type="text/css" href="buttoncss.css">
<link rel="stylesheet" type="text/css" href="textboxcss.css">
<style type="text/css">
	textarea {
  width: 55%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 6px solid #ccc;
  border-radius: 20px;
  background-color: #f8f8f8;

  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
  font-size: 16px;
  resize: none;
}
textarea:focus {
  width: 85%;
  border: 3px solid red;
  padding: 20px 30px
}

</style>
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
			<td><input type="submit" name="send" value="Send" class="button button5"></td>
		</tr>
	</table>
</form>