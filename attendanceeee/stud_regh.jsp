<%@ include file="adminactivities.jsp"%>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="buttoncss.css">
	<link rel="stylesheet" type="text/css" href="textboxcss.css">
	<style >
		/*input[type=text] {
  width: 35%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 4px solid grey;
  border-radius: 30px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}

input[type=text]:focus {
  width: 55%;
  border: 3px solid red;
  padding: 20px 30px
}*/
.inputfile {
	width: 0.1px;
	height: 0.1px;
	opacity: 0;
	overflow: hidden;
	position: absolute;
	z-index: -1;
}
.inputfile + label {
    font-size: 1.25em;
    font-weight: 700;
    color: white;
    background-color: black;
    display: inline-block;
}

.inputfile:focus + label,
.inputfile + label:hover {
    background-color: red;
}
.inputfile + label {
	cursor: pointer; /* "hand" cursor */
}
.inputfile:focus + label {
	outline: 1px dotted #000;
	outline: -webkit-focus-ring-color auto 5px;
}
		table{
			color: white;
			font-size: 20px;
		}
		span{
			color: blue;
			font-size: 20px;
		}
		table.t1s{
			margin-left: 40%;
		}
	</style>
<script type="text/javascript">
function validate(form1)
{
  var x = document.getElementById("myFile").value;
  
  document.getElementById("demo").value = x;
var name=window.document.form1.name.value;
var fname=window.document.form1.fname.value;
var mname=window.document.form1.mname.value;
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
if(fname.length==0)
{
	document.getElementById('f').innerHTML="Father's Name should be filled";
	k=1;
}
else
document.getElementById('f').innerHTML="";
if(mname.length==0)
{
	document.getElementById('mn').innerHTML="Mother's Name should be filled";
	k=1;
}
else
document.getElementById('mn').innerHTML="";
var gender=document.form1.gender.value;
if(gender=='')
{
	document.getElementById('g').innerHTML="Gender can't be NULL";
	k=1;
}
else
document.getElementById('g').innerHTML="";
var city=document.form1.city.value;
if(city.length==0)
{
	document.getElementById('c').innerHTML="City should be filled";
	k=1;
}
else
document.getElementById('c').innerHTML="";

var pinc=document.form1.pin.value;
if(!pinc.match(pin))
{
	document.getElementById('pi').innerHTML="Invalid Pin Code ";
	k=1;
}
else
document.getElementById('pi').innerHTML="";

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
<body bgcolor="#33ccff">
	<form name="form1" method="post" action="stud_reg.jsp">
		<b>
			<center>
				<H2 STYLE="COLOR:RED">STUDENT REGISTERATION FORM</H2>
			</center>
			<table cellspacing="10" class="t1s" align="center" id="tablelable">
				<tr>
					<td>Name</td>
					<td style="width:50"><input type="text" style="width:150" name="name"></td>
					<td><font color="blue" size="1 "><span id="a"></span></font></td>
				</tr>
				<tr>
					<td>Father Name</td>
					<td style="width:50"><input type="text" style="width:150" name="fname"></td>
					<td><font color="blue" size="1 "><span id="f"></span></font></td>
				</tr>
				<tr>
					<td>Mother Name</td>
					<td style="width:50"><input type="text" style="width:150" name="mname"></td>
					<td><font color="blue" size="1 "><span id="mn"></span></font></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input type="radio" name="gender" value="Male">Male
						<input type="radio" name="gender" value="Female">Female</td>
					<td><font color="blue" size="1 "><span id="g"></span></font></td>
				</tr>
<tr>
<td> date  of birth</td>
<td> <input type="date" name= "date" /></td>
<td><font color="blue" size="1 "></font></td><br><br>
</tr>
<tr>
<td>City</td>
<td><input type="text" name="city"></td>
	<td><font color="blue" size="1 "><span id="c"></span></font></td>
</tr>
<tr>
<td>Pin Code</td>
<td><input type="text" name="pin" maxlength="6"></td>
	<td><font color="blue" size="1 "><span id="pi"></span></font></td>
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
<tr>
<td>Photo(Optional)</td>
<td>
<input type="file" name="photo" id="myFile" class="inputfile" />
<label for="myFile">Choose a file</label></td>
	<td><font color="blue" size="1 "></font></td>
<input type="hidden" name="file" id="demo" value="file">
</tr>
<tr>
	<td></td>
<td><input type="submit" VALUE="Submit" onclick="return validate(this)" class="button button5"></td>
</tr>
</table>
</b>	</form>
</body>
</html>