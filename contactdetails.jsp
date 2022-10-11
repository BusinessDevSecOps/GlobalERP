<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ include file="header.jsp"%>

<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<style>
			body
			{
            margin: 0px;
            padding: 0px;
            }
            
            #divheader
            {
            height:50;
            background:	White;
            }
            
            #header 
            {
            background: #2675a8;
            font:large;
            color:green;
            width: 100%;
            }
            
            #leftcolumn 
            {
            background:#0099CC;
            float: left;
            width: 35%;
            height: 400px;
            }
            
            #content 
            {
            border:medium;
            border-color:blue;
            background: ;
            float: left;
            width: 100%;
            height: 400px;
            /*overflow:scroll;*/
            }
            
            #myfooter 
            {
            background: #df781c;
            clear: both;
            width: 100%;
            }
            #tooltip
            {
  			  	position:relative;
    			font-family:arial,sans-serif;
    			font-size:10px;
    			color:#000;
    			padding:3px;
    			border:1px solid #000;
    			background-color:#ffe;
			}
			table.mysortable
			{
				text-align: left;
				font-family: Arial,Verdana, Geneva , Helvetica, sans-serif ;
				font-weight: normal;
				font-size: 11px;
				color: #fff;
				background-color: #1581AB; <!-- -->
				border: 0px;
				border-collapse: collapse;
				border-spacing: 0px;
			}

			table.mysortable td
			{
				background-color: #F8F8FF;
				color: #000;
				padding: 4px;
				border: 1px #808080 solid;
			}
			table.mysortable th
			{
				background-color: #1581AB;
				color: white;
				padding: 4px;
				border: 1px #808080 solid;
			}

			table.mysortable td.hed
			{
				background-color: #C6DEFF;
				color: #696969;
				padding: 4px;
				border-bottom: 2px #808080 solid;
				font-size: 12px;
				font-weight: bold;
			} 

			table.mysortable td.hed1
			{
				background-color: #C6DEFF;
				color: #696969;
				padding: 4px;
				border-bottom: 2px #808080 solid;
				font-size: 12px;
				font-weight: bold;
			} 

</style>

<script>


function validate()
{
	var phno=document.getElementById("mobileno").value;
	      

var fname=document.getElementById("firstname").value;

var lname=document.getElementById("lastname").value;
var mname=document.getElementById("middlename").value;
var desig=document.getElementById("designation").value;

var city=document.getElementById("city").value;
var zipcode=document.getElementById("zipcode").value;

var state=document.getElementById("state").value;
var country=document.getElementById("country").value;
var email=document.getElementById("emailids").value;
var email1=document.getElementById("emailids1").value;
var email2=document.getElementById("emailids2").value;


var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";



var phoneno=document.getElementById("phoneno").value;
var alternetno=document.getElementById("alternetno").value;
var faxno=document.getElementById("faxno").value;



var letter = /^[A-Za-z]+$/;

var letter1 = /^[A-Za-z -]+$/;
if(fname=="")
{
	alert("Please enter contact person name");

	return false;
}
if(lname=="")
{
	alert("Please enter contact person name");

	return false;
}


 if(!(fname.match(letter)) && fname.length!=0)  
 {  
    alert('Please enter characters value for Contact Person');  
 return false;  
 } 
 if(!(lname.match(letter)) && lname.length!=0)  
 {  
    alert('Please enter characters value for Contact Person');  
 return false;  
 } 
 if(!mname == "")
 {
	 if(!(mname.match(letter)) && mname.length!=0)  
	 {  
	    alert('Please enter characters value for Contact Person');  
	 return false;  
	 } 
 }
 if(!(desig.match(letter1)) && desig.length!=0)  
 {  
    alert('Please enter characters value for Designation');  
 return false;  
 } 
 if(!(city.match(letter)) && city.length!=0)  
 {  
    alert('Please enter characters value for City');  
 return false;  
 } 

 if(isNaN(zipcode))
	{
		alert("Please enter numeric value for Zipcode");
		//document.getElementById("zipcode").value="";
		return false;
	}
 
 
 if(!(state.match(letter)) && state.length!=0)  
 {  
    alert('Please enter characters value for State');  
 return false;  
 } 
 if(!(country.match(letter)) && country.length!=0)  
 {  
    alert('Please enter characters value for Country');  
 return false;  
 } 
try{
var sss=validateEmail(email);
if(!sss)
	{
		alert("Please enter valid Email Id");
		return false;
	} 



}catch(e)
{
}
	if(!(phno ==0))
	{
		
		 if(isNaN(phno))
			{
				alert("Please enter numeric value for mobile number");
				document.getElementById("mobileno").value="";
				return false;
			}
		
			 if((phno.trim().length < 10)  || (phno.trim().length >15))
				 {
			        alert("Mobile no should be greater than 10 digits and less than 15 digits"); 
	        return false;
	    }
	}
	else
	{
		phno="";
		
		alert("Please enter mobile number");
	    return false;	
	}
	var phno1=document.getElementById("mobileno1").value;
	//alert(phno);
	if(!(phno1 ==0))
	{
		
		 if(isNaN(phno1))
			{
				alert("Please enter numeric value for mobile number");
				document.getElementById("mobileno1").value="";
				return false;
			}
		
			 if((phno1.trim().length < 10)  || (phno1.trim().length >15))
				 {
	        alert("Mobile no should be greater than 10 digits and less than 15 digits"); 
	        return false;
	    }
	}


	
			 var phno2=document.getElementById("mobileno2").value;
				//alert(phno);
				if(!(phno2 ==0))
				{
					
					 if(isNaN(phno2))
						{
							alert("Please enter numeric value for mobile number");
							document.getElementById("mobileno2").value="";
							return false;
						}
					
						 if((phno2.trim().length < 10)  || (phno2.trim().length >15))
							 {
						        alert("Mobile no should be greater than 10 digits and less than 15 digits"); 
				        return false;
				    }
}
				
if(!(phoneno==0)){
				 if(isNaN(phoneno))
					{
						alert("Please enter numeric value for phone number");
						return false;
					}
				 if((phoneno.trim().length < 10)  || (phoneno.trim().length >15))
				 {
			        alert("Phone no should be greater than 10 digits and less than 15 digits"); 
	        return false;
	    }}
					 if(isNaN(alternetno))
					{
						alert("Please enter numeric value for alternate number");
						return false;
					}

				 if(isNaN(faxno))
					{
						alert("Please enter numeric value for fax number");
						return false;
					}
				

				

	}

function validateEmail(email)
{

	if(email.trim()==""){
	      return true;
			
	}
	else{
//alert("hi");
     var splitted = email.match("^(.+)@(.+)$");
     if(splitted == null) return false;
     
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }

	
return false;
	}
}

function addresspaste()
{
	document.contactdata.address.value=document.contactdata.c_address.value;
    document.contactdata.city.value=document.contactdata.c_city.value;
    document.contactdata.state.value=document.contactdata.c_state.value;
    document.contactdata.zipcode.value=document.contactdata.c_zip.value;
    document.contactdata.country.value=document.contactdata.c_country.value;
}
function cancelentryform()
{
	
	//document.contactdata.action ="addNewCustomer.jsp?companyName="+document.contactdata.companyname.value;
	document.contactdata.action ="home.jsp";
    document.forms["contactdata"].submit();
}

function getClient1(id)
{ 
	//alert("in2 get"+id);

	if(id=="+")
    {
	document.getElementById("f1").style.display='none';
	document.getElementById("mobileno1").style.display='';
	document.getElementById("f2").style.display="";
	document.getElementById("f3").style.display="";
	
    }
}
function getClient2(id)

    {
	if(id=="+")
    {
	document.getElementById("f1").style.display='none';
	document.getElementById("mobileno2").style.display='';
	document.getElementById("f2").style.display='none';
	document.getElementById("f3").style.display='none';
	document.getElementById("f4").style.display="";
	
	
    }
	else{


		//alert("in2 get"+id);
		    
		document.getElementById("f1").style.display="";
		document.getElementById("mobileno1").style.display='none';
		
		document.getElementById("f2").style.display='none';
		document.getElementById("f3").style.display='none';
    }
    }


function getClient3(id)
{ 
	//alert("in2 get"+id);

	if(id=="-")
    {
	//document.getElementById("f1").style.display='none';
	document.getElementById("mobileno2").style.display='none';
	document.getElementById("f2").style.display="";
	document.getElementById("f3").style.display="";
	document.getElementById("f4").style.display='none';
	
	
    }
}

//For Email id/////




function getClient4(id)
{ 
	//alert("in2 get"+id);

	if(id=="+")
    {
	document.getElementById("f5").style.display='none';
	document.getElementById("emailids1").style.display='';
	document.getElementById("f6").style.display="";
	document.getElementById("f7").style.display="";
	
    }
}
function getClient5(id)

    {
	if(id=="+")
    {
	document.getElementById("f5").style.display='none';
	document.getElementById("emailids2").style.display='';
	document.getElementById("f6").style.display='none';
	document.getElementById("f7").style.display='none';
	document.getElementById("f8").style.display="";
	
	
    }
	else{


		//alert("in2 get"+id);
		    
		document.getElementById("f5").style.display="";
		document.getElementById("emailids1").style.display='none';
		
		document.getElementById("f6").style.display='none';
		document.getElementById("f7").style.display='none';
    }
    }


function getClient6(id)
{ 
	//alert("in2 get"+id);

	if(id=="-")
    {
	//document.getElementById("f1").style.display='none';
	document.getElementById("emailids2").style.display='none';
	document.getElementById("f6").style.display="";
	document.getElementById("f7").style.display="";
	document.getElementById("f8").style.display='none';
	
	
    }
}





function mob1()
{

//alert("hi");
	var phno=document.getElementById("mobileno").value;
	//alert(phno);
	if(!(phno ==0))
	{
		
		 if(isNaN(phno))
			{
				alert("Please enter numeric value for mobile number");
				document.getElementById("mobileno").value="";
				return false;
			}
		
			 if((phno.trim().length < 10)  || (phno.trim().length >15))
				 {
			        alert("Mobile no should be greater than 10 digits and less than 15 digits"); 
			        //document.getElementById("mobileno").value="";
	        return false;
	    }
	}
	else
	{
		phno="";
		
		alert("Please enter mobile number");
	    return false;	
	}

		
}
function mob2()
{
	var phno=document.getElementById("mobileno1").value;
	
	if(!(phno ==0))
	{
		
		 if(isNaN(phno))
			{
				alert("Please enter numeric value for mobile number");
				document.getElementById("mobileno1").value="";
				
				return false;
			}
		
			 if((phno.trim().length < 10)  || (phno.trim().length >15))
				 {
			        alert("Mobile no should be greater than 10 digits and less than 15 digits"); 
					//document.getElementById("mobileno1").value="";
			        
	        return false;
	    }
	}



		
}
function mob3()
{
	var phno=document.getElementById("mobileno2").value;
	
	if(!(phno ==0))
	{
		
		 if(isNaN(phno))
			{
				alert("Please enter numeric value for mobile number");
				document.getElementById("mobileno2").value="";
				
				return false;
			}
		
			 if((phno.trim().length < 10)  || (phno.trim().length >15))
				 {
			        alert("Mobile no should be greater than 10 digits and less than 15 digits"); 
	        return false;
	    }
	}



		
}

function mob4()
{


	var email=document.getElementById("emailids").value;


	var sss=validateEmail(email);
	if(!sss)
		{
			alert("Please enter valid Email Id");
			return false;
		} 


}

function mob5()
{
var email=document.getElementById("emailids1").value;
	
var sss=validateEmail(email);
if(!sss)
	{
		alert("Please enter valid Email Id");
		document.getElementById("emailids1").value="";
		
		return false;
	} 

}
function mob6()
{
var email=document.getElementById("emailids2").value;
	
var sss=validateEmail(email);
if(!sss)
	{
		alert("Please enter valid Email Id");
		document.getElementById("emailids2").value="";
		
		return false;
	} 

}

function getContactInfo(fname)
{
	var total='stotal';
	
	window.open('showComplaintDetails.jsp?fname='+fname+'&lname='+lname+'&status='+total+'&email='+email+'','mywindow','width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
	
}
</script>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 -->
 <meta http-equiv="content-type" content="text/html; charset=utf-8" />
</head>

<html>
<body>
<%!
Connection con1;
%>
<% 
		Class.forName(DB_Driver);
		con1 = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
		Statement st=con1.createStatement();//=Customer
		String type1=request.getParameter("save");
		System.out.println("IN CONTACT DETIAL SPAGE  ..."+type1);
		String sql="";
		sql="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where customercode="+request.getParameter("customercode")+" limit 1";				
        System.out.println("customer query---->>"+sql);
        ResultSet rs= st.executeQuery(sql);
        String maddress="";
        String mcity="";
        String mcountry="";
        String mstate="";
        String mzip="";
        while (rs.next())
        {
            maddress=rs.getString("address");
            mcity=rs.getString("city");
            mcountry=rs.getString("country");
            mstate=rs.getString("state");
            mzip=rs.getString("zip");
        }
%>
<%
if(type1!=null)
{
	%>
	<script type="text/javascript">
	alert("Record Saved Successfully");
	//type1="";
	</script>
	<%
}

%>
<form name="contactdata" action="AjaxSaveContact.jsp" method="post" autocomplete="off" onsubmit="return validate();">

<div id="dataentry" align="center"  style="margin-left:5%; width:80%;  background-color: #E1F3F3; border: solid thin black;">
		<div style="border: thin solid blue; background-color: #457FC2; height: 8%; ">
		
		
		<table style="color: white; align: center; width: 100%" border="0" >
		<tr style="color: white; text-align: center;">
				<td style="width: 80%; color: ">
		<%
System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"+request.getParameter("Type"));
if(request.getParameter("Type").equals("Customer") )
{
	
	System.out.println("********************************  *8");
%>
<font face="Arial" size="3" color="white" ><b>Customer Name:-<%=request.getParameter("companyname")%></b></font>
<%
 }
 else
 {
	 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
%>
<font face="Arial" size="3" color="white" ><b>Prospective Customer Name:-<%=request.getParameter("companyname") %></b></font>
<%}%>
		<br></br>
		<font face="Arial" size="3" color="white" ><b>Add Contact</b></font><br></br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Arial" size="2" >(<font color="red"> *</font> indicates mandatory fields)</font></td>
				<td style="width: 80%"  align="right">
				<a href="#"
					style="font-weight: bold; color: black;" onclick="cancelentryform()">
			
				<img src="images/end.JPG" width="15%" height="6%"
					style="border-style: none"></img> </a>&nbsp; <!-- <input type="button" name="cancel" id="cancel" value="X"  onclick="cancelentryform()" style="width:20; color:red;" /> -->
				</td>
			</tr>
		</table>
		</div>
		
		
		
		
		
		
		
		<table style="width: 85%;" align="center" >
			<tr>
			<br></br>
				<td style="width: 15%;" align="left" width=""><b>Contact Person :<font color="red" size="2">*</font></b></td>
				<td width=""><select name="salutation" id="salutation"
					style="width: 7%; height: 10%;">
					<option value='Mr.'>Mr.</option>
					<option value='Mrs.'>Mrs.</option>
					<option value='Ms.'>Ms.</option>
				</select> 
				First Name:<input type="text" name="firstname" id="firstname" style="width: 15%;" />
		        Middle Name:<input	type="text" name="middlename" id="middlename" style="width: 22%;" /> 
				Last Name:<input	type="text" name="lastname" id="lastname" style="width: 22%;" /></td>
			</tr>
			<tr>
				<td><b>Designation :</b></td>
				<td><input	type="text" name="designation" id="designation" style="width:35%;" /></td>
				
			</tr>
			<tr>
				<td><b>Address :</b></td>
				<td><textarea
										name="address" rows="3" id="search-text"
										style='width: 50%; height: auto;'></textarea>
										<input type="button" name="copyaddress" id="copyaddress" value="Copy Company Address"
					                     onclick="addresspaste()" style="width: 28%;" />
				</td>
			</tr>
			<tr>
				<td><b>City :</b></td>
				
				<td><input type="text" name="city" id="city" style="width: 150px;" />
				</td>
			</tr>
			<tr>
				<td><b>Zip Code :</b></td>
				<td><input type="text" name="zipcode" id="zipcode" style="width: 150px;" />
				</td>
			</tr>

			<tr>
				<td><b>State :</b></td>
				<td><input type="text" name="state" id="state" style="width: 200px;" />
				</td>
			</tr>
			<tr>
				<td><b>Country :</b></td>
				<td><input type="text" name="country" id="country" style="width: 200px;" />
				</td>
			</tr>
			
		
			<tr>
				<td><b>Email Ids :</b></td>
				<td><input type="text" name="emailids" id="emailids" style="width: 250px;" onchange="mob4();" /><a href="#" style="font-weight: bold; color: blue; " id="f5" onclick="getClient4('+')"><font   size="3" >(+)</font></a>
				<input type="text" id="emailids1" name="emailids1"  style="width: 250px;display: none;" onchange="mob5();" /><a href="#" style="font-weight: bold; color: blue;display: none " id="f6" onclick="getClient5('+')"><font   size="3" >(+)</font></a><a href="#" style="font-weight: bold; color: blue;display: none " id="f7" onclick="getClient5('-')"><font  size="3" >(-)</font></a>
				<input type="text" id="emailids2" name="emailids2"  style="width: 250px;display: none;" onchange="mob6();" /><a href="#" style="font-weight: bold; color: blue;display: none " id="f8" onclick="getClient6('-')"><font  size="3" >(-)</font></a>
				
				</td>
			</tr>
				<tr>
				<td><b>Mobile Number :<font color="red" size="2">*</font></b></td>
				<td><input type="text" name="mobileno" id="mobileno" style="width: 250px;" onchange="mob1();" /><a href="#" style="font-weight: bold; color: blue; " id="f1" onclick="getClient1('+')"><font   size="3" >(+)</font></a>
				<input type="text" id="mobileno1" name="mobileno1" id="mobileno1" style="width: 250px;display: none;" onchange="mob2();" /><a href="#" style="font-weight: bold; color: blue;display: none " id="f2" onclick="getClient2('+')"><font   size="3" >(+)</font></a><a href="#" style="font-weight: bold; color: blue;display: none " id="f3" onclick="getClient2('-')"><font  size="3" >(-)</font></a>
				<input type="text" id="mobileno2" name="mobileno2" id="mobileno2" style="width: 250px;display: none;" onchange="mob3();" /><a href="#" style="font-weight: bold; color: blue;display: none " id="f4" onclick="getClient3('-')"><font  size="3" >(-)</font></a>
				</td>
			</tr>
			<tr>
				<td><b>Phone Number :</b></td>
				<td><input type="text" name="phoneno" id="phoneno" style="width: 225px;" />
				&nbsp;&nbsp;&nbsp;<b>Alternate Number :</b>
				&nbsp;&nbsp;&nbsp;
				<input type="text" name="alternetno" id="alternetno" style="width: 225px;" />
				</td>
			</tr>
			<tr>
				<td><b>Fax Number :</b></td>
				<td><input type="text" name="faxno" id="faxno" style="width: 190px;" />
				<input type="hidden" name="entryflag" value="ADD" />
				<input type="hidden" name="customercode" value="<%=request.getParameter("customercode") %>" />
				<input type="hidden" name="companyname" value="<%=request.getParameter("companyname") %>" />
				<input type="hidden" name="c_address" value="<%=maddress %>" />
				<input type="hidden" name="c_city" value="<%=mcity%>" />
				<input type="hidden" name="c_country" value="<%=mcountry%>" />
				<input type="hidden" name="c_state" value="<%=mstate%>" />
				<input type="hidden" name="c_zip" value="<%=mzip%>" />
				<input type="hidden" name="currentrow" value="0" />
				<input type="hidden" name="CustOfType" value="<%=request.getParameter("Type")%>" />
				</td>
			</tr>
		</table>
		<div style="margin-left: 20%">
		<table style="width: 100%;">
			<tr>
				<td style=""><input type="submit" name="add" value="Save" style="width: 70px;" /> <input
					type="button" name="cancel_entry" id="cancel_entry" value="Cancel"
					onclick="cancelentryform()" style="width: 70px;" /></td>
			</tr>
		</table>
		</div>
				</div>
		
		
		<div>
<%
		
try{
String sql1="";

        if(request.getParameter("Type").equals("Customer") )
        {
		    sql1="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"contactdet where salesCustomerCode="+request.getParameter("customercode")+" order by firstname,middlename,lastname";				
            System.out.println("customer query---->>"+sql1);
        }
        else
        {
        	sql1="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"contactdet where customercode="+request.getParameter("customercode")+" order by firstname,middlename,lastname";				
            System.out.println("customer query---->>"+sql1);
        }
            ResultSet rs1= st.executeQuery(sql1);
        %>
        
       
        
        
        
        <br></br>
        <div style="border:thin solid black;margin-left: 3%; width:85%;height:auto;background:color:aqua;">
        <table align="center" class="mysortable" style="width:100%;background-color: #457FC2;"><tr><td style="background-color: #457FC2;color:white;border:thin solid white;height:32px;text-align:center;"><h3 style="color:white">Contact List</h3></td></tr></table>		
        <div style="overflow:auto;"></div>
        <table class="mysortable"><tr >
        <th style="width:400px;">Contact Person</th>
        <th style="width:400px;">Address</th>
        <th style="width:100px;">City</th>
        
        <th style="width:200px;">Mobile No</th>
       <th style="width:200px;"> Alternate No</th>
        <th style="width:200px;">Email ID</th>
        <th style="width:200px;">Fax Number</th>
        
        
        </tr>
        <%
        while (rs1.next())
    	{
    		%>
    		<tr>
    		<td align="left"><div align="left">
    		
    		<%=rs1.getString("contactperson") %>
    		</div>
    		</td>
    		<td align="left"><div align="left">
    		<%
    		if(rs1.getString("Address")==null || rs1.getString("Address").equals(""))
    		{
    			%>
    			<%="NA" %>
    			<%
    			 		}
    		else{
    			%>
    			<%=rs1.getString("Address") %>
    			<%
    		}
    		%>    		
    		
    		</div>
    		</td>
    		
    		<td align="left"><div align="left">
    		<%
    		if(rs1.getString("city")==null || rs1.getString("city").equals(""))
    		{
    			%>
    			<%="NA" %>
    			<%
    			 		}
    		else{
    			%>
    			<%=rs1.getString("city") %>
    			<%
    		}
    		%>    		
    		
    		</div>
    		</td>
    		
    		<td align="right"><div align="right">
<%
    		if(rs1.getString("mobileno")==null || rs1.getString("mobileno").equals(""))
    		{
    			%>
    			<%="NA" %>
    			<%
    			 		}
    		else{
    			%>
    			<%=rs1.getString("mobileno") %>
    			<%
    		}
    		%>    		
    		<%
    		if(rs1.getString("mobileno1")==null || rs1.getString("mobileno1").equals(""))
    		{
    			 		}
    		else{
    			%>
    			,<%=rs1.getString("mobileno1") %>
    			<%
    		}
    		%>
    			<%
    		if(rs1.getString("mobileno2")==null || rs1.getString("mobileno2").equals(""))
    		{
    			 		}
    		else{
    			%>
    			,<%=rs1.getString("mobileno2") %>
    			<%
    		}
    		%>
    		</div>
    		</td>
    		<td align="right"><div align="right">
    		
    				<%
    		if(rs1.getString("AlternetNO")==null || rs1.getString("AlternetNO").equals(""))
    		{
    			%>
    			<%="NA" %>
    			<%
    			 		}
    		else{
    			%>
    			<%=rs1.getString("AlternetNO") %>
    			<%
    		}
    		%>
    		</div>
    		</td>
    		
    		
    		<td align="left"><div align="left">
    		<%
    		if(rs1.getString("email")==null || rs1.getString("email").equals(""))
    		{
    			%>
    			<%="NA" %>
    			<%
    			 		}
    		else{
    			%>
    			<%=rs1.getString("email") %>
    			<%
    		}
    		%>
    		
    		<%
    		if(rs1.getString("Email1")==null || rs1.getString("Email1").equals(""))
    		{
    			 		}
    		else{
    			%>
    			,<%=rs1.getString("Email1") %>
    			<%
    		}
    		%>
    			<%
    		if(rs1.getString("Email2")==null || rs1.getString("Email2").equals(""))
    		{
    			 		}
    		else{
    			%>
    			,<%=rs1.getString("Email2") %>
    			<%
    		}
    		%>
    		
    		
    		</div>
    		</td>
    		<td align="left"><div align="left">
    		
    				<%
    		if(rs1.getString("fax")==null || rs1.getString("fax").equals(""))
    		{
    			%>
    			<%="NA" %>
    			<%
    			 		}
    		else{
    			%>
    			<%=rs1.getString("fax") %>
    			<%
    		}
    		%>
    		
    		
    		
    		</div>
    		</td>
    		</tr>	
    		<%
    	}
        
        
}catch(Exception e)
{
	e.printStackTrace();
}
        %>
        </table>
		</div>
		
		</div>
		
		
	<br></br>
		

	<div id="footer">
	
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	</form>
	
		
</body>
</html>
</jsp:useBean>