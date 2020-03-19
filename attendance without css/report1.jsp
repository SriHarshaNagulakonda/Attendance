<%@ include file="staffactivities.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
	String fid=""+application.getAttribute("f_id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	String cid=request.getParameter("cid");
	int week=(Integer.parseInt(request.getParameter("week"))-1)*7;
	ResultSet rs=st.executeQuery("select sdate,edate from course_name where c_id='"+cid+"'");
	rs.next();
	String sdate=rs.getString(1);
	String edate=rs.getString(2);
	rs=st.executeQuery("select cname from course_name where c_id='"+cid+"'");
	rs.next();
	String cname=rs.getString(1);
	rs=st.executeQuery("select date from attendence where c_id='"+cid+"' and date between  (SELECT DATE_ADD((select sdate from course_name where c_id='"+cid+"'), INTERVAL '"+week+"' DAY)) and date_add((SELECT DATE_ADD((select sdate from course_name where c_id='"+cid+"'), INTERVAL '"+week+"' DAY)),INTERVAL 7 DAY) group by date order by date");
	int count=0,i=0;
	while(rs.next())
		count++;
		if(count==0){
		%>
			<p align="center"><%="Attendance is not updated in week"+(week/7+1)%></p>
			<%}else{
		
			rs=st.executeQuery("select date from attendence where c_id='"+cid+"' and date between  (SELECT DATE_ADD((select sdate from course_name where c_id='"+cid+"'), INTERVAL '"+week+"' DAY)) and date_add((SELECT DATE_ADD((select sdate from course_name where c_id='"+cid+"'), INTERVAL '"+week+"' DAY)),INTERVAL 7 DAY) group by date order by date");
			String date[]=new String[count];
			%>
	<br><br>
			<font color="red"><h2 align="center"><%=cname%> Week <%=(week)/7+1%> Attendence </h2></font>
			<table cellpadding="10" border="1" align="center">
				<tr>
					<th>Name</th>
					<th>JNTU No.</th>
			<%
			while(rs.next())
			{
				date[i++]=rs.getString(1);
				%>
				<th><%=rs.getString(1)%></th>
			<%
		}
		%>
			<th>Total</th>
			<th>Present</th>
			<th>Absent</th>
			<th>Percentage</th>
		</tr>
			<%
			count=0;
			String sid[][]=new String[100][2];
			rs=st.executeQuery("select name,(s_id) from attendence natural join student where date in (select date from attendence where c_id='"+cid+"' and date between  (SELECT DATE_ADD((select sdate from course_name where c_id='"+cid+"'), INTERVAL '"+week+"' DAY)) and date_add((SELECT DATE_ADD((select sdate from course_name where c_id='"+cid+"'), INTERVAL '"+week+"' DAY)),INTERVAL 7 DAY) group by date order by date) group by s_id");
			i=0;
			while(rs.next())
			{
				sid[i][0]=rs.getString(1);
				sid[i][1]=rs.getString(2);
				i++;
				count++;
			}
			for(i=0;i<count;i++)
			{%>
				<tr>
					<td><%=sid[i][0]%></td>
					<td><%=sid[i][1]%></td>
					
						<%
						for(int j=0;j<date.length;j++)
						{%><td><%String stat="";
			rs=st.executeQuery("select status from attendence where s_id='"+sid[i][1]+"' and c_id='"+cid+"' and date='"+date[j]+"'");
			rs.next();
			if(rs.getString(1).equals("1"))
				stat="PRESENT";
			else
				stat="ABSENT";
			%>
			<%=stat%></td>
<%}%>
<td><%=date.length%></td>
			<%
			rs=st.executeQuery("select sum(status) from attendence where s_id='"+sid[i][1]+"' and c_id='"+cid+"' and date in (select date from attendence where c_id='"+cid+"' and date between  (SELECT DATE_ADD((select sdate from course_name where c_id='"+cid+"'), INTERVAL '"+week+"' DAY)) and date_add((SELECT DATE_ADD((select sdate from course_name where c_id='"+cid+"'), INTERVAL '"+week+"' DAY)),INTERVAL 7 DAY) group by date order by date) group by s_id ");
			rs.next();
			%>
			<td><%=rs.getString(1)%></td>
			<td><%=(date.length-Integer.parseInt(rs.getString(1)))%></td>
			<td><%=Integer.parseInt(rs.getString(1))*100/date.length%></td>
				</tr>
<%
			}


			}

	
}
catch(Exception e)
{
	out.println(e);
}
%>
<!--select (name),(s_id),(date),status from attendence natural join student where date in (select date from attendence where c_id=2 and date between  (SELECT DATE_ADD((select sdate from course_name where c_id=2), INTERVAL 8*7 DAY)) and date_add((SELECT DATE_ADD((select sdate from course_name where c_id=2), INTERVAL 8*7 DAY)),INTERVAL 7 DAY) group by date order by date)-->