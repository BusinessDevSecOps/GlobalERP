<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%@page import="java.io.*" import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
		
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Add New Group To SalesEnquiry</title>
	</head>
	<script type="text/javascript">

	function validate()
	{
		if(document.GroupName.thegroup.value=="")
		{
			alert("Please Enter Group");
			return false;
		}
		
	}
	function validate1()
	{	
		var abc=document.makename.newmake.value;
		if(abc=="")
		{
			alert("Please Enter Make ");
			return false;
		}
		if(document.makename.group.value=="Select")
		{
			alert("Please select group");
			return false;
		}
	}
	

	
	function OnChange(dropdown)
	{
		var vv1=dropdown.selectedIndex;
		var SelValue1 = dropdown.options[vv1].value;
		//alert(vv1);
		//alert(SelValue1);
		 var ajaxRequest;
	     try{
				ajaxRequest = new XMLHttpRequest();
	        }  
	        catch (e)
	        {
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
			     				 alert("Your browser broke!");
			      				return false;
			   			 }
	        		}
	          }
	        var queryString = "?group=" +SelValue1;
	      	ajaxRequest.open("GET", "GetDropMake.jsp" + queryString, true);
	      	//System.out.println(ajaxRequest.open("GET", "GetDropMake.jsp" + queryString, true));
	      	ajaxRequest.send(null); 
	      	ajaxRequest.onreadystatechange = function()
	        {
	               if(ajaxRequest.readyState == 4)
	               {
	                       var reslt=ajaxRequest.responseText;
	                       
	                    	   var mySplitResult = reslt.split("##");
	                    	   document.getElementById("makename").innerHTML=mySplitResult[0];
	                    	   System.out.println(mySplitResult[0]);
	                       
	               }
	        }

	}

	function OnChangeGetDetails(dropdown,type)
	{
//	alert(dropdown);
	alert(type);

		var vv1=dropdown.selectedIndex;
		var SelValue1 = dropdown.options[vv1].value;

		if(SelValue1=="Select")
		{
			if(type=='group')
			{
				 //document.getElementById("partNo").innerHTML=
				 document.getElementById("make").innerHTML=
				// document.getElementById("Description").innerHTML=
				 document.getElementById("model").innerHTML
							 ="<select  style='width: 150px; height:20px;  "+
	      		 	 " border: 1px solid black; font: normal 10px Arial, Helvetica, sans-serif;   "+
	    			 " color: #000000;'></select>";
			}
	        else if(type=='make')
	        {			
	   				 //document.getElementById("partNo").innerHTML=
	   				 //document.getElementById("Description").innerHTML=
	   				 document.getElementById("model").innerHTML
	   							 ="<select  style='width: 150px; height:20px;  "+
	   	      		 	 " border: 1px solid black; font: normal 10px Arial, Helvetica, sans-serif;   "+
	   	    			 " color: #000000;'></select>";
	        }
	            
	        
		}

		else
		{
	       var ajaxRequest;
		     try{
					ajaxRequest = new XMLHttpRequest();
		        }  
	            catch (e)
	            {
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
				     				 alert("Your browser broke!");
				      				return false;
				   			 }
		        		}
	              }
	              var queryString = "?"+type+"=" +SelValue1;
	          	ajaxRequest.open("GET", "GetDrop.jsp" + queryString, true);
	          	ajaxRequest.send(null); 
	          	ajaxRequest.onreadystatechange = function()
	            {
	                   if(ajaxRequest.readyState == 4)
	                   {
	                           var reslt=ajaxRequest.responseText;
	                           var mySplitResult = reslt.split("##");
	                           if(type=='group')
	                           document.getElementById("make").innerHTML=mySplitResult[0];

	                           else if(type=='make')
	                           document.getElementById("model").innerHTML=mySplitResult[0];
	                           
	                          
	                   }
	            }
		}
		
	} 
	</script>
	
	<body>
 <%
	 	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
 %>
 <%
		Connection conn = null;
		Statement st = null, st1 = null, st3 = null, st4 = null;
		Statement st2 = null;
 %>
 <%
		String todaysTime=new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
		String fromDateCal="",toDateCal="",thegroupname="";
		fromDateCal = toDateCal = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
		String id=request.getParameter("id");
		System.out.println("ID IS  "+id);
		try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
				st3 = conn.createStatement();
				st4 = conn.createStatement();
			} catch (Exception e) {
			}
			
 %>
 <br>
 <div
style="font-size: 1.7em; text-align: center; margin-top: 0.2em; margin-bottom: 0.2em;">
<a>ADD ITEMS</a></div>
<% 
if(id.equals("group"))
{
%>
  <form name="GroupName" method="get" action="insertItems.jsp"  onsubmit="return validate();">
  <input type="hidden" name="id" id="id" value="<%=id %>"/>
	<div style=" margin-left:35%;border:3px solid #2aa1cc ;width:25%;height:50%;" class="sortable">
		
		<table>
			<tr> <td align="center" colspan="3"><b><font color="red">ADD NEW GROUP </font></b></td></tr>
		   
		     <tr>
		        
		        <td><b>Group Existed:</b></td>
		        
		         <td><select name="group" id="group" style="width: 150px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; 
				 color: #000000; " >
				 <option value='Select' >Select</option>
		 <%
		
		 String sqlGroup="SELECT distinct(TheGroupName),TheGroupCode FROM  "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster ";
		 ResultSet rsGroup=st.executeQuery(sqlGroup);
		 while(rsGroup.next())
		 {
		 
		 %>
		 <option value="<%=rsGroup.getString(2)+"::"+rsGroup.getString(1) %>"><%=rsGroup.getString(1) %></option>
		 <%
		 }
		 %>
		 </select></td>
		        
		    </tr>
			<tr>
					<td><b>NEW GROUP:</b></td>
					<td><input type="text"  id="thegroup" name="thegroup" style='width: 150px; height: 15px; padding: 4px 5px 2px 5px;
	border: 1px solid black; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	color: #000000;"'/></td>
					
			</tr>
			<tr>
					<td></td>
					<td>
					<table>
					<tr>
					<td colspan="3" align="left">
					<input type="submit" id="search-submit" name="ADD" value="ADD"/>
					</td>
					</tr>
					</table>
					</td>
			</tr>
		
		</table>
			</div>
			</form>
<div></div>

<%} %>

<div></div>

<%
if(id.contains("make"))
{	
%>			
			
		<form name="makename" method="get" action="insertItems.jsp" onsubmit="return validate1();">
		 <div style=" margin-left:35%;border:3px solid #2aa1cc ; width:25%;height:50%;" class="sortable">
		 <input type="hidden" name="id" id="id" value="<%=id %>"/>
		  <table>
			<tr> <td align="center" colspan="3"><b><font color="red">ADD NEW MAKE</font> </b></td></tr>
		   
		     <tr>
		        
		        <td><b><font color="red">*</font>  Group : </b></td>
		        
		         <td><select name="group" id="group" style="width: 150px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; 
				 color: #000000; "onchange="OnChange(this);" >
				 <option value='Select' >Select</option>
		 <%
		
		 String sqlGroup1="SELECT distinct(TheGroupName),TheGroupCode FROM  "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster ";
		 ResultSet rsGroup1=st.executeQuery(sqlGroup1);
		 while(rsGroup1.next())
		 {
		 
		 %>
			<option value="<%=rsGroup1.getString(2)+"::"+rsGroup1.getString(1) %>"><%=rsGroup1.getString(1) %></option>
		 <%
		 }
		 %>
		 </select></td>
		        
		    </tr>
		    <tr>
			<td><b>Existing Make :</b></td>
			<td><div id="makename"><select name="makename" style="width: 150px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; 
		 color: #000000; " >
		 <option value='Select' >Select</option>

		 
		 </select></div></td>
			<td></td>
		</tr>
			<tr>
					<td ><b>NEW Make:</b></td>
					<td><input type="text" name="newmake" id="newmake"
						 style="width:136px; padding: 4px 5px 2px 5px;
			border: 1px solid black; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
			color: #000000;"/></td>
					<td></td>
			</tr>
			<tr>
					<td></td>
					<td>
					<table>
					<tr>
					<td colspan="3" align="left">
					<input type="submit" id="search-submit" name="ADD" value="ADD"/>
					</td>
					</tr>
			</table>
			</td>
		</tr>
	</table>
	</div>
</form>
<%} %>
<div></div>
<br><br><br><br><br>
    <br><br><br><br><br>
        <br><br><br><br><br>
    <br><br><br>
	<div id="footer" style="margin-top: 65%">
	<p><a href="#">
Copyright &copy; 2014 Safe & Secure Logistics Pvt Ltd.
</a></p>
	</div>
<!-- end #footer -->

	</body>
	</html>
</jsp:useBean>