<%@ page language="java"%>
<%@ include file="header.jsp"%>
<%@ include file="ConnForIncident.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<html>
<head>

<script type="text/javascript">

function showVisitingCardDetailsHod(username)
{
	 //alert("in fun");
	 document.getElementById("hod").value=username;
	 //Changing(username);
	 document.getElementById("userlist").style.visibility='hidden';
	 
}
function getUserHod()
{
	 //alert(" in fun");
	 
	 //alert("1");
	 var username=document.getElementById("hod").value;

	
		 if(username.length=="")
			{
			 document.getElementById("userlist").style.visibility="hidden";
			 document.getElementById("hod").value="";
			}
		 else
		 {
			 document.getElementById("userlist").style.visibility='visible';
		 
	 		//alert(username);
	 		var ajaxRequest;  // The variable that makes Ajax possible!
	    try
	    {
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
	    }  
		catch (e)
		{
			// Internet Explorer Browsers
			try
			{
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} 
			catch (e)
			{
				try
				{
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} 
				catch (e)
				{
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;
				//alert(">>>    "+reslt);
				
				//alert(reslt);
				document.getElementById("userlist").innerHTML=reslt;
			} 
		}
		
		var queryString = "?action=hod&name="+username;
		//alert(queryString);
		
		ajaxRequest.open("GET", "AjaxEditUser.jsp" + queryString, true);
		ajaxRequest.send(null); 

		 }//end of else
	 
}



function validate()
{
	//alert("in fun");
	
	var letters = /^[A-Za-z ]+$/;  
	var letters=letters.test(document.AddNewUser.FullName.value);
    if(letters==false)
     {     
         alert('Full name must have characters only');  
          
       return false;  
      }  
 

    var username=document.AddNewUser.UserName.value;
	if(username=="")
	{
	alert("Please Enter the User Name");
     return false;
	}


	var pwd=document.AddNewUser.Password.value;
	if(pwd=="")
	{
      alert("Please Enter the Password");
      return false;
	}   


	var ulaccess=document.AddNewUser.UserLevelAccess.value;
	if(ulaccess=="")
	{
       alert("Please Enter the Company User Level Access");
       return false;
	}
	
	  if(document.AddNewUser.Department.value=="Select")
	    {
	    	alert("Please Select Department");
	    	//document.AddNewUser.emailid.focus();
	    	return false;
	    }

	var empcode=document.AddNewUser.EmpCode.value;
     if(empcode=="")
     {
       alert("Please Enter Employee Code");
       return false;
     }
	
	if(isNaN(empcode))
	{
	alert("Employee code should be valid digits only...");
	//document.AddNewUser.Mobno.focus();
	return false;
	}
	
	var mob=document.AddNewUser.Mobno.value;
	if(mob=="")
	{
	alert("Please Enter the Mobile Number");
	//documnet.AddNewUser.Mobno.focus();
	return false;
	}
	if(isNaN(mob))
	{
	alert("Enter the Valid Mobile Number(10 Digit Number)");
	//document.AddNewUser.Mobno.focus();
	return false;
	}
	if((mob.length<10)||(mob.length>10))
	{
	alert("Your Mobile Number Should be Valid 10 Digit Number");
	document.AddNewUser.Mobno.select();
	return false;
	}



	var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i;
	var email=emailfilter.test(document.AddNewUser.emailid.value);
	if(email==false)
	{
	alert("Please Enter valid E-Mail ID");
	//document.AddNewUser.emailid.focus();
	return false;
	}

    if(document.AddNewUser.hod.value=="")
    {
    	alert("Please Enter Hod Name");
    	//document.AddNewUser.emailid.focus();
    	return false;
    }

  

}

</script>


<title>New User Entry Form</title>
</head>
<body>






<form name="AddNewUser" method="post" action="InsertNewUserDetails.jsp" onsubmit="return validate();">

<center><h1><a>Add New User</a></h1></center>
<br/>
<div style="width: 40%; float:left;margin-left:25%">
<table border="0" align="center" style="background-color: #C6DEFF;font-family: arial;font-size:12;border-left: 170px">

<tr>
<td colspan="2">
<p style="color:red;" >Note:(*)indicates mandatory fields..</p>
</td>

</tr>

<tr>
<td><b>Full Name:</b><font size="2">*</font></td>

<td><input type="text" name="FullName"style="width:150px; padding: 4px 5px 2px 5px;
	border-color: activeborder; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	color: #000000;"" /></input></td>
</tr>

<tr>
<td><b>User Name:</b><font size="2">*</font></td>
<td><input type="text" name="UserName" value="" style="width:150px; padding: 4px 5px 2px 5px;
	border-color: activeborder; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	color: #000000;"" /></input></td>
</tr>

<tr>
<td><b>Password:</b><font size="2">*</font></td>
<td><input type="password" name="Password" value="" style="width:150px; padding: 4px 5px 2px 5px;
	border-color: activeborder; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	color: #000000;"" /></input></td>
</tr>

<tr>
<td><b>User Level:</b><font size="2">*</font></td>
<td>
<select name="UserLevel" style="width: 80px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000;border-color: activeborder;">
<option value="Level1">Level 1</option>
<option value="Level2">Level 2</option>
<option value="Level3">Level 3</option>
<option value="Level4">Level 4</option>
<option value="Level5">Level 5</option>
</select>
</td>
</tr>

<tr>
<td><b>Department:</b><font size="2">*</font></td>
<td>
<select name="Department" style="width: 80px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000;border-color: activeborder;">

<option value="All">All</option>
<option value="Purchase">Purchase</option>
<option value="Sales">Sales</option>
<option value="Marketing">Marketing</option>
<option value="Accounts">Accounts</option>
<option value="Hr">HR</option>
<option value="Finance">Finance</option>
<option value="Software">Software</option>
<option value="Other">Other</option>
</select>
</td>
</tr>


<tr>
<td><b>Company UserLevel Access:</b><font size="2">*</font></td>
<td><input type="text" name="UserLevelAccess"style="width:150px; padding: 4px 5px 2px 5px;
	border-color: activeborder; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	color: #000000;" value="1,2,3" /></input></td>
</tr>

<tr>
<td><b>Employee Code:</b><font size="2">*</font></td>
<td><input type="text" name="EmpCode"style="width:150px; padding: 4px 5px 2px 5px;
	border-color: activeborder; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	color: #000000;"" /></input></td>
</tr>

<tr>
<td><b>TA Level:</b><font size="2">*</font></td>
<td>
<select name="TALevel" style="width: 80px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000;border-color: activeborder;">
<option value="M1">M1</option>
<option value="M2">M2</option>
<option value="M3">M3</option>
<option value="M4">M4</option>
<option value="M5">M5</option>
</select>
</tr>

<tr>
<td><b>Mobile Number:</b><font size="2">*</font></td>
<td><input type="text" name="Mobno"style="width:150px; padding: 4px 5px 2px 5px;
	border-color: activeborder; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	color: #000000;" /></input></td> 
</tr>

<tr>
<td><b>Email-Id:</b><font size="2">*</font></td>
<td><input type="text" name="emailid"style="width:150px; padding: 4px 5px 2px 5px;
	border-color: activeborder; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	color: #000000;" /></input></td>
</tr>




<tr>
<td><b>Active Status:</b><font size="2">*</font></td>
<td>
<select name="ActiveStatus" id="ActiveStatus"  style="width: 80px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000;border-color: activeborder;">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
</tr>
<tr>
<td><b>HOD:</b><font size="2">*</font></td>
<td><input type="text" name="hod" id="hod" onkeyup="getUserHod();" style="width:150px; padding: 4px 5px 2px 5px;
	border-color: activeborder; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	color: #000000;"" /></input></td>
</tr>


<tr>

<td  colspan="2" width="400px" align="center">

<br/>
<input type="submit" name="Submit" value="Submit"style="border: outset; background-color: #FFFFFF" /></input>&nbsp;&nbsp;
</td>
</tr>


<!--<tr>-->
<!--<td>-->
<!--<p style="color:red;" >Note:(*)indicates Mandatory fields..</p>-->
<!--</td>-->
<!--</tr>-->



</table>
</div>
<div style="width: 1%; float:left">
<table border="0" align="center" style="font-family: arial;font-size:12; border-left: 120px">
<tr><td></td></tr>
  <tr><td>
  <div id='userlist' style="width:160px;position:relative; margin-top:5%; margin-left:3%; height:200px;overflow: auto; background:#94ECF6;border:thin solid black;" >
	</div>
  </td></tr>
</table>
</div>
<script type="text/javascript">document.getElementById("userlist").style.visibility="hidden";</script>
<br/>
<br/>
<br/>
<br/>
<br/>

<div id="footer" style="float: left;width:100%;margin-top:5%">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
</form>
</body>
</html>
</jsp:useBean>