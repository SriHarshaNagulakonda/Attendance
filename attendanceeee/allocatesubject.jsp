<link rel="stylesheet" type="text/css" href="buttoncss.css">
<style type="text/css">
	table,p,center{
			color: white;
			font-size: 20px;
		}
</style>
<%@ include file="adminactivities.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
int count1;
try{
	
	String fid=request.getParameter("f_id");
	String cid="";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select count(distinct(c_id)) from subjectalloc where f_id='"+fid+"' group by f_id");
	rs.next();
	 try{
	 count1=rs.getInt(1);
	}
	catch(SQLException se)
{
	count1=0;
}
	rs=st.executeQuery("select c_id,count(distinct(f_id)) from  subjectalloc  group by c_id");
	String cids[]=new String[100];
	int cidcount[]=new int[100];
    int cidcount2[]=new int[100];
	for(int i=0;rs.next();i++)
	{
       cids[i]=rs.getString(1);
       cidcount[i]=rs.getInt(2);
	}
	rs=st.executeQuery("select c_id from course_name");
	String s[]=new String[100];
	for(int i=0;rs.next();i++)
	{
       s[i]=rs.getString(1);
	}
	rs=st.executeQuery("select c_id from  subjectalloc where f_id='"+fid+"'");
	String fc[]=new String[100];
	String fc2[]=new String[100];
	for(int i=0;rs.next();i++)
	{
       fc[i]=rs.getString(1);
	}
	int k=0,p=0;
	for(int i=0;i<s.length&&s[i]!=null;i++)
	{
		k=0;
		for(int j=0;j<fc.length&&fc[j]!=null;j++)
		{
			if(s[i].equals(fc[j]))
			{
				k=1;
				break;
			}
		}
		if(k==0)
			{
				fc2[p]=s[i];
				cidcount2[p]=cidcount[i];
				p++;
			}
	}
	int result=0,flag=0;
	if(count1>=3)
	{
	%>
	<p align="center" style="color: white;font-size: 20px;"><%="This faculty has already allocated for 3 subjects"%></p>
	<%
}
else
{
	
	
	
	for(int i=0;fc2[i]!=null;i++)
	{
		if(cidcount2[i]<3 && count1!=3)
		{
			cid=fc2[i];
	result=st.executeUpdate("insert into subjectalloc values('"+cid+"','"+fid+"')");
    count1++;
flag=1;
}
}
}
if(flag==1)
{
	%>
<p align="center" style="color: white;font-size: 20px;"><%="Subjects are successfully allocated"%></p><br>
	<%
}
if(count1<3 &&flag==0)
{
	%>
	<p align="center" style="color: white;font-size: 20px;"><%="Courses are not available for allocation"%></p>
	<%
}
%>
<p align="center" style="color: white;font-size: 20px;"><%="The Courses Allocated For The Faculty Are:"%></p><br>
<table align="center">
		<tr>
			<td>Course_Id</td>
			<td>Course Name</td>
		</tr>
<%
rs=st.executeQuery("select c_id,cname from course_name natural join subjectalloc where f_id='"+fid+"'");
while(rs.next())
{
	%>
	<tr>
		<td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
	</tr>
	<%
}
%>
</table>
<%
}
catch(Exception e)
{
	%>
	<p align="center"><%="Please Enter A Valid Faculty Id"%></p>
	<%
}
%>
