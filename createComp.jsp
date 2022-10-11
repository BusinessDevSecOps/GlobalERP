<%@ page language="java"%>
<%@ include file="header.jsp" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/cpanel_002.css" rel="stylesheet" type="text/css"  />
<title>Add New Company</title>
</head>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script LANGUAGE="JavaScript" type="text/javascript">


function is_valid_url(url)
{ //  return url.match(/^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/);
	 var RegExp = /^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/; 
	 if(RegExp.test(url)){
	        return true;
	    }else{
	        return false;
	    } 
    
}

function validate()
{//alert("call");
	
	var compName = document.getElementById("compName").value;
	var compAdd= document.getElementById("compAdd").value;
	var compGdAdd = document.getElementById("compGdAdd").value;
	var phNo = document.getElementById("phNo").value;
	var faxNo = document.getElementById("faxNo").value;
	var email = document.getElementById("email").value;
	var adnemail = document.getElementById("adnemail").value;

	var compBstNO =document.getElementById("compBstno").value;
	var adn=document.getElementById("adn").value;
	var uadn=document.getElementById("uadn").value;
	var compCstNO= document.getElementById("compCstno").value;
	var website= document.getElementById("website").value;
	var letters = /^[A-Z a-z 0-9]+$/;  
	
	
	compAdd=compAdd.replace(/\s/g,"");
	compGdAdd=compGdAdd.replace(/\s/g,"");
	compName=compName.replace(/\s/g,"");
	phNo=phNo.replace(/\s/g,"");
	faxNo=faxNo.replace(/\s/g,"");
	email=email.replace(/\s/g,"");
	adnemail=adnemail.replace(/\s/g,"");
	compBstNO=compBstNO.replace(/\s/g,"");
	compCstNO=compCstNO.replace(/\s/g,"");
	website=website.replace(/\s/g,"");
	
		if(compName.length==0)
	{
		alert("Please Enter The Company Name");
		return false;
	}
	
	if(!isNaN(compName))
	{
	
	alert("Invalid Company Name");
	return false;
	}
	if(uadn.length==0)
	{
		alert("Please Enter User Name");
		return false;
	}
	if(adn.length==0)
	{
		alert("Please Enter Admin User Name");
		return false;
	}

	if(phNo.length==0)
	{
		alert("Please Enter Phone Number");
		return false;
	}
	
	if(isNaN(phNo))
	{
	alert("Enter The Valid Phone Number");
	return false;
	}

	 if (phNo.length<10 || phNo.length>=14)
    {
		alert("Phone Number Should Be 10-13 Digit");
    return false;   
  }	 

	
	if(compAdd.length==0)
	{   
		alert("Please Enter The Company Address");
		return false;
    }
	
	if(compGdAdd.length==0)
	{
		alert("Please Enter The Company Godown Address");
		return false;
	}
	
	
	var regularExpression = /^[a-z A-Z 0-9]+$/;
	 
	if(!(regularExpression.test(compBstNO)))
	{
		alert("BST Number Should Be Alpha-Numeric Only");
	    return false;   
	}
	if(compBstNO.length==0)
	{
		alert("Please Enter The Company BST No.");
		return false;
	}
	if (compBstNO.length <= 9 || compBstNO.length >= 15 )
    {
		alert("BST Number Maximum Limit Is 9-15 Digit ");
    	return false;   
  	}	 
	
	
	if(!(regularExpression.test(compCstNO)))
	{
		alert("CST Number Should Be Alpha-Numeric Only");
		return false;   
	}	
	if(compCstNO.length==0)
	{
		alert("Please Enter The Company CST NO.");
		return false;
	}
	if (compCstNO.length <=9 || compCstNO.length >= 15 )
    {
		alert("CST Number Maximum Limit Is 9-15 Digit ");
		return false;   
  	}	 
	
	if(faxNo.length==0)
	{
		alert("Please Enter The Fax Number");
		return false;
	}
	if(isNaN(faxNo))
	{
		alert("Please Enter The Valid Fax Number");
		return false;
	}

	 if (faxNo.length< 10 || faxNo.length>=14)
	    {
			alert("Fax Number Should Be 10-13 Digit ");
	    return false;   
	  }	 
	
	
	if(email.length==0)
	{
		alert("Please Enter The Email ID");
		return false;
	}
	else
	{
		// var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-]{1,3})+\.)+([a-zA-Z0-9]{2,4})+$/;
		 var filter = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		    if (!filter.test(email)) {
		    alert('Please Enter Valid Email ID');
		    email.focus;
		    return false;
	} 
	}
	if(adnemail.length==0)
	{
		alert("Please Enter The Admin Email ID");
		return false;
	}
	else
	{
		// var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-]{1,3})+\.)+([a-zA-Z0-9]{2,4})+$/;
		 var filter = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		    if (!filter.test(adnemail)) {
		    alert('Please Enter Valid Admin Email ID');
		    adnemail.focus;
		    return false;
	} 
	}
	if(website.length==0)
	{
		alert("Please Enter The Website Address");
		return false;
	}
	else
	{
		var url=is_valid_url(website);
		if(!url)
			{
			   alert("Please Enter Valid Website Address");
			   return false;
			}
	}
	
	return true;
}

//new implement
function replaceAll(txt, replace, with_this) {
return txt.replace(new RegExp(replace, 'g'),with_this);
}
function showSrc() {
document.getElementById("myframe").href = document.getElementById("myfile").value;
var theexa=document.getElementById("myframe").href.replace("file:///","");
var path=document.getElementById("myframe").href.replace("file:///","");
var correctPath=replaceAll(path,"%20"," ");

alert(correctPath);

} 

</script>
<body>
<%


Date today = new Date();
String date=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

%>
	<div style="background-color:#1582AB;height:30;width:100%; ">         
      <table style="width: 100%">
        <tr>  
            <td align="center" colspan="4"><font face="Arial" color="white" size="3"><b>Add New Company</b></font></td>
        </tr>
     </table>
   </div>
   
<form action="insertCompDet.jsp" method="post" name="data" enctype="multipart/form-data">
			<font size="2" style="font-family: Montserrat, sans-serif;">
<br>
<br>
		
		<table border="0" align="center">
			<tr >
				<td >
					<label id="custype">Company Name <font  color="#990000">*</font></label>
				</td>
				<td>
					<input type="text" name="compName" id="compName" style="width:250px;"/>
				</td>
			</tr>
			<tr>
				<td>
					<label id="custype">Phone Number <font  color="#990000">*</font></label>
				</td>
				<td>
					<input type="text" name="phNo" id="phNo" style="width:250px;"/>
				</td>
				
			</tr>
			
			<tr>
				<td>
					<label id="custype">Company Address <font  color="#990000">*</font></label>
				</td>
				<td>
					<textarea name="compAdd" id="compAdd"  style="width:250px;"> </textarea>
				</td> 
				</tr>
				<tr>
				<td>
					<label id="custype">Company Godown Address <font  color="#990000">*</font></b></label>
				</td>
				<td>
					<textarea name="compGdAdd" id="compGdAdd"  style="width:250px;" ></textarea>
				</td> 
			</tr>
			
			
            <tr>
				<td>
					<label id="custype">Company BST No. <font  color="#990000">*</font></label>
				</td>
				<td>
					<input type="text" name="compBstno" id="compBstno"  style="width:250px;" />
				</td> 
			</tr>
				<tr>
				<td>
					<label id="custype">Company CST No. <font  color="#990000">*</font></label>
				</td>
				<td>
					<input type="text" name="compCstno" id="compCstno"  style="width:250px;" />
				</td> 
			</tr>
			
			<tr>
			
				<td>
					<label id="custype">Fax Number <font  color="#990000">*</font></label>
				</td>
				<td>
					<input type="text" name="faxNo" id="faxNo" style="width:250px;" />
				</td> 
			</tr>
			
			
			<tr>
				<td>
					<label id="custype">Email ID<font  color="#990000">*</font></label>
				</td>
				<td>
					<input type="text" name="email" id="email"  style="width:250px;" />
				</td> 
			</tr>
			<tr>
				<td>
					<label id="custype">Website <font  color="#990000">*</font></label>
				</td>
				<td>
					<input type="text" name="website" id="website"  style="width:250px;" />
				</td> 
			</tr>
			<tr>
				<td>
					<label id="custype">User Name <font  color="#990000">*</font></label>
				</td>
				<td>
				<input type="text" name="uadn" id="uadn"  style="width:250px;" />				
				</td> 
			</tr>

			<tr>
				<td>
					<label id="custype">Admin Login Name <font  color="#990000">*</font></label>
				</td>
				<td>
				<input type="text" name="adn" id="adn"  style="width:250px;" /><br>
				<font size="1" color="#990000">Password Same As Admin Login Name</font>
				</td> 
			</tr>
			<tr>
				<td>
					<label id="custype">Admin User Email Id <font  color="#990000">*</font></label>
				</td>
				<td>
				<input type="text" name="adnemail" id="adnemail"  style="width:250px;" />				
				</td> 
			</tr>
			
			<tr>
				<td>
					<label id="custype">Logo Image File <font  color="#990000">*</font></label>
				</td>
				<td>
				 <input type="file" name="uProperty" id="uProperty"/>
				</td> 
			</tr>
			
		</table>
		<br>
		<table align="center" width="100%">
			<tr>
				<td align="center"><input  type="submit" id="submit" value="Submit" onclick="javascript:try{return validate();}catch(e){alert(e)}"></div></td>
			</tr>
		</table>
		</font>
</form>
<%
	String sendMsg=request.getParameter("sendMsg");
%>
<input type="hidden" name="sendMsg" id="sendMsg" value="<%=sendMsg %>"></input>
<%
if(!(sendMsg==null))
{
	System.out.println("======="+sendMsg+"=======");
	%>
	<script LANGUAGE="JavaScript" type="text/javascript">
	
	//alert("company created");
	var sendMsg=document.getElementById("sendMsg").value;
	alert(sendMsg+"\n");
	</script>
	<%
}
%>

<div  id="footer" style=" bottom:0px; width:100%;">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	
</body>
</html>