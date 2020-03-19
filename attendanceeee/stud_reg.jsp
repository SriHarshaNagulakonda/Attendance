<!DOCTYPE html>
<%@ include file="adminactivities.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="buttoncss.css">
	<style type="text/css">
		table,p{
			color: white;
			font-size: 20px;
		}
	</style>
	<title></title>
</head>
<body bgcolor="#0099ff">

<%
try{
	String add="hello world";
	String name=request.getParameter("name");
	String fname=request.getParameter("fname");
	String mname=request.getParameter("mname");
	String gender=request.getParameter("gender");
	String city=request.getParameter("city");
	String pin=request.getParameter("pin");
	String phone=request.getParameter("phone");
	String mail=request.getParameter("mail");
	String date=(request.getParameter("date"));
	 add=request.getParameter("photo");
	 String a="\\";
	 String b="\\\\";
	 add=add.replaceAll(b,b+b);

 	//File file=new File(add);//"C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\attendance\\"+add);
 	String  path="C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\attendance\\"+add;
	File file=new File(path);

	FileInputStream img=new FileInputStream(file);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select * from student");
	int count=0;
	while(rs.next())
		count++;
	PreparedStatement ps=com.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,fname);
	ps.setString(3,mname);
	ps.setString(4,gender);
	ps.setString(5,date);
	ps.setString(6,city);
	ps.setString(7,pin);
	ps.setString(8,phone);
	ps.setString(9,mail);
	ps.setBinaryStream(10, (InputStream) img, (int) (file.length()));
	ps.setString(11,add);
	String uname="";
	String pwd="";
	if(count<9){
	uname="17341A050"+String.valueOf(count+1);
			ps.setString(12,uname);
			pwd="17341A050"+String.valueOf(count+1);
		ps.setString(13,pwd);
	}
	else
	{
		uname="17341A05"+String.valueOf(count+1);
			ps.setString(12,uname);
			pwd="17341A05"+String.valueOf(count+1);
		ps.setString(13,pwd);
	}
	int r=ps.executeUpdate();
	%>
<p align="center"><%="Data Is Successfully Inserted"%></p>
<p align="center"><%="User name is: "+uname%></p>
<p align="center"><%="Password is: "+pwd%></p>		
	<%
}
catch(Exception e)
{
	out.println("<p align='center'>"+e+"</p>");
}
%>
</body>
</html>