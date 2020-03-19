<%@ include file="adminactivities.jsp"%>
<html>
<head>
	<style >
		table.t1s{
			margin-left: 10%;
		}
	</style>
<script type="text/javascript">
function validate(form1)
{
var name=window.document.form1.name.value;
var quali=window.document.form1.quali.value;
var btech=window.document.form1.btech.value;
var mtech=window.document.form1.mtech.value;
var phd=window.document.form1.phd.value;
var exp=window.document.form1.exp.value;
var k=0;
phn=new RegExp("[0-9]{10}","g");
pin=new RegExp("[0-9]{6}","g");
if(name.length==0)
{
	document.getElementById('a').innerHTML="Name should be filled";
	k=1;
}
else
document.getElementById('a').innerHTML="";
if(quali.length==0)
{
	document.getElementById('q').innerHTML="Specify Your Highest Qualification";
	k=1;
}
else
document.getElementById('q').innerHTML="";
if(exp.length==0)
{
	document.getElementById('exp').innerHTML="Specify Years Of Experiance";
	k=1;
}
else
document.getElementById('exp').innerHTML="";
if(btech.length==0)
{
	document.getElementById('b').innerHTML="Specify B.Tech College Name";
	k=1;
}
else
document.getElementById('b').innerHTML="";
if(mtech.length==0)
{
	document.getElementById('mt').innerHTML="Specify M.Tech College Name";
	k=1;
}
else
document.getElementById('mt').innerHTML="";
if(phd.length==0)
{
	document.getElementById('p').innerHTML="Specify Phd College Name";
	k=1;
}
else
document.getElementById('p').innerHTML="";
var gender=document.form1.gender.value;
if(gender=='')
{
	document.getElementById('g').innerHTML="Gender can't be NULL";
	k=1;
}
else
document.getElementById('g').innerHTML="";
var phone=document.form1.phone.value;
if(!phone.match(phn))
{
	document.getElementById('ph').innerHTML="Invalid Phone number";
	k=1;
}
else
document.getElementById('ph').innerHTML="";
m=new RegExp("[a-zA-Z0-9]{1,}@[a-z]{3,}\.[a-z]{2,}","g");
var mail=document.form1.mail.value; 
if(!mail.match(m))
{
	document.getElementById('m').innerHTML="Invalid Mail id";
	k=1;
}
else
document.getElementById('m').innerHTML="";
if(k==0)
	return true;
return false;
}
</script>
<head/>
<body>
	<form name="form1" method="post" action="faculty_reg.jsp">
		<b>
			<center>
				<H2 STYLE="COLOR:RED">FACULTY REGISTERATION FORM</H2>
			</CENTER>
			<table cellspacing="5" class="t1s">
				<tr>
					<td>Name</td>
					<td style="width:50"><input type="text" style="width:150" name="name"></td>
					<td><font color="blue" size="1 "><span id="a"></span></font></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input type="radio" name="gender" value="Male">Male
						<input type="radio" name="gender" value="Female">Female</td>
					<td><font color="blue" size="1 "><span id="g"></span></font></td>
				</tr>
				<tr>
					<td>Qualification</td>
					<td style="width:50"><input type="text" style="width:150" name="quali"></td>
					<td><font color="blue" size="1 "><span id="q"></span></font></td>
				</tr>
				<tr>
					<td>B.Tech</td>
					<td style="width:50"><input type="text" style="width:150" name="btech"></td>
					<td><font color="blue" size="1 "><span id="b"></span></font></td>
				</tr>
				<tr>
					<td>M.Tech</td>
					<td style="width:50"><input type="text" style="width:150" name="mtech"></td>
					<td><font color="blue" size="1 "><span id="mt"></span></font></td>
				</tr>
				<tr>
					<td>Phd</td>
					<td style="width:50"><input type="text" style="width:150" name="phd"></td>
					<td><font color="blue" size="1 "><span id="p"></span></font></td>
				</tr>
				<tr>
					<td>Experiance</td>
					<td style="width:50"><input type="text" style="width:150" name="exp"></td>
					<td><font color="blue" size="1 "><span id="exp"></span></font></td>
				</tr>
				


<tr>
<td>E-mail</td>
<td><input type="text" name="mail"></td>
	<td><font color="blue" size="1 "><span id="m"></span></font></td>
</tr>
<tr>
<td>Phone.No</td>
<td><input type="text" name="phone" maxlength="10"></td>
<td><font color="blue" size="1 "><span id="ph"></span></font></td>
</tr>
	<td></td>
<td><input type="submit" VALUE="Submit" onclick="return validate(this)"></td>
</tr>
</table>
</b>	</form>
</body>
</html>