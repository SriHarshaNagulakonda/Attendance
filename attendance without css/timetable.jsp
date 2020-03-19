<%@ include file="adminactivities.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%
int s[][]=new int[6][7];
int x,y,z,i,j,k,p,q,r;
for(i=0;i<s.length;i++)
{
	for(j=0;j<s[i].length;j++)
		s[i][j]=0;
}
Random rand=new Random();
int a=0,b=0,c=0;
for(i=1;i<=3;i++)
{
	k=rand.nextInt(6);
	while(s[k][1]!=0||s[k][2]!=0||s[k][5]!=0)
		k=rand.nextInt(6);
	if(i==1)
		a=k;
	else if(i==2)
		b=k;
	else
		c=k;
	p=rand.nextInt(3);
	q=rand.nextInt(3);
	if(p==0){
		s[k][1]=i*(-1);
		s[k][q+4]=i;
	}
	else if(p==1){
		s[k][2]=i*(-1);
		s[k][q+4]=i;
	}
	else{
		s[k][5]=i*(-1);
		s[k][rand.nextInt(4)]=i;
	}
}
for(i=0;i<s.length;i++)
{
	if(i==a||i==b||i==c)
		continue;
	p=rand.nextInt(7);
	s[i][p]=2;
	q=rand.nextInt(7);
	while(q==p||q==p+1||q==p-1)
		q=rand.nextInt(7);
	s[i][q]=1;
	r=rand.nextInt(7);
	while(r==p||r==p+1||r==p-1||r==q||r==q-1||r==q+1)
		r=rand.nextInt(7);
	s[i][r]=3;
}
%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
i=0;
int count=0;
String fid=request.getParameter("fid");
ResultSet rs=st.executeQuery("select cname from course_name where c_id in (select c_id from subjectalloc where f_id='"+fid+"')");
String sub[]=new String[3];
while(rs.next()){
count++;
	sub[i++]=rs.getString(1);
//	out.println(sub[i-1]);
}
if(count==0)
	out.println("<center>Invalid Faculty Id</center>");
if(count<3)
	out.println("<center>Time Table can not be generated.</center>");
else
{
	out.println("<center>Timetable for Faculty "+fid+" is :<br><br></center>");
	String day[]={"MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY"};
	%>
	<table border=1 cellpadding="10" align="center">
		<tr>
			<th>DAY/PERIOD</th>
		<%for(i=1;i<=4;i++){%>
		<th><%=i%></th>
		<%}%>
		<th rowspan="7" width="1px">L U N C H  B R E A K</th>
		<%for(i=5;i<=7;i++){%>
		<th><%=i%></th>
		<%}%>
		</tr>
		<%
		for(i=0;i<6;i++)
		{
			out.println("<tr><td><b>"+day[i]+"</b></td>");
			for(j=0;j<7;j++)
			{
				if(j==0||j==1||j==4){
				if(s[i][j+1]<0){
					out.println("<td colspan='3' align='center'>"+sub[s[i][j+1]/(-1)-1]+" LAB</td>");
					j=j+2;
					continue;
				}
			}
				if(s[i][j]>0){
					out.println("<td>"+sub[s[i][j]-1]+"</td>");
				}
				else
					out.println("<td>----</td>");
				}

		out.println("</tr>");
			}
		}%>
	</table>
	<%		
}
catch(Exception e)
{
	out.println(e);
}
%>