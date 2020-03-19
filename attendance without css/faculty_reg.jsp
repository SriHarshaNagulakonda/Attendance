<%@ include file="adminactivities.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try{
    String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String quali=request.getParameter("quali");
	String btech=request.getParameter("btech");
	String mtech=request.getParameter("mtech");
	String phd=request.getParameter("phd");
	String exp=request.getParameter("exp");
	String mail=request.getParameter("mail");
	String phone=(request.getParameter("phone"));
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","");
	Statement st=com.createStatement();
	ResultSet rs=st.executeQuery("select * from faculty");
	int count=0;
	while(rs.next())
		count++;
	PreparedStatement ps=com.prepareStatement("insert into faculty values(?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,gender);
	ps.setString(3,quali);
	ps.setString(4,btech);
	ps.setString(5,mtech);
	ps.setString(6,phd);
	ps.setString(7,exp);
	ps.setString(8,mail);
	ps.setString(9,phone);
	String uname="";
	String pwd="";
	if(count<9){
	uname="10"+String.valueOf(count+1);
		ps.setString(10,uname);
		pwd="10"+String.valueOf(count+1);
		ps.setString(11,pwd);
	}
	else
	{
		uname="1"+String.valueOf(count+1);
		ps.setString(10,uname);
		pwd="1"+String.valueOf(count+1);
		ps.setString(11,pwd);
	}
	int r=ps.executeUpdate();
	if(r>0)
	{
	%>
<p align="center"><%="Data Is Successfully Inserted"%></p>
<p align="center"><%="User name is: "+uname%></p>
<p align="center"><%="Password is: "+pwd%></p>

	<%
}
}
catch(Exception e)
{
	out.println(e);
}
%>