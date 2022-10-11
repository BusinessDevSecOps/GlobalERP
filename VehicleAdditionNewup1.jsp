<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict/aaa/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"  import="java.util.Calendar" errorPage="" %>
<%@page import="java.util.Date"%>
 
<script src="dropdown.js" type="text/javascript"></script>
<script src="dynamic.js" type="text/javascript"></script>

<script type="text/javascript">
function getdata(vehregno,trans,vehiclecode,i,previousyear,fpreviousmonth)//trans is the ownername
{
	var group="";
	group=document.getElementById("grp"+i).value;//for selecting a group
	//alert("Groupname is "+group);
	var retval = confirm("Are you sure you want to add the vehicle?");
	if(retval == true)
	{	
	   if(group=="Select")
	   {
		alert("Please Select Group");
		return false;
	   }
	   //var month=document.data.month.value;
	   //alert(month);
	   //if(month=="Select")
	   //{
	   //	alert("Please Select Month");
	//	return false;
	//}
	//var year=document.data.year.value;
	//alert(year);
	//if(year=="Select")
	//{
	//	alert("Please Select Year");
	//	return false;
	//}
	var ajaxRequest;
	try
	{
				ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{
		     try
	         {
		          ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");} 
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
	 ajaxRequest.onreadystatechange = function()
	 {
	          if(ajaxRequest.readyState == 4)
	          {
	                 var reslt=ajaxRequest.responseText;
	                 // alert(reslt);
	                 if(reslt.trim()=="Yes")
	                 {
	                     alert("Vehicle added Successfully.Thank You.");
	                     window.location.reload("VehicleAdditionNewup1.jsp");
	                 }
	                 else if(reslt.trim()=="No")
	                 {
	                	 alert("Error While Adding Vehicle.Pls Try Again!!");
	                	 return false;
	                	 Window.loaction.reload("VehicleAdditionNewup1.jsp");
	                    	 
	                 }
	          }
	    }
	          //alert("Groupname is"+group);
	          var group = group.replace("&","^");
	          //alert("Groupname is"+group);
	          //trans has already been replaced by ^
	          var queryString = "?vehregno="+vehregno+"&transporter="+trans+"&vehiclecode="+vehiclecode+"&group="+group+"&month="+fpreviousmonth+"&year="+previousyear;
	          //alert(queryString);
	          
	          ajaxRequest.open("GET", "updateVehiclesup1.jsp" + queryString, true);
	      	  ajaxRequest.send(null); 
	}//if
	else
	{
		return false;
	} 	
}

function gotoExcel (elemId, frmFldId)  
{  
        var obj = document.getElementById(elemId);  
        var oFld = document.getElementById(frmFldId); 
        oFld.value = obj.innerHTML;  
        document.data.action ="excel.jsp";     // CHANGE FORM NAME HERE
        document.forms["data"].submit();       // CHANGE FORM NAME HERE
} 	

function confirmation()
{
	var retval = confirm("Selecting Other means this Transporter is not present in existing transporters list. Do you want to continue?");
	if(retval == true)
	{
		return true;
	}
	else
	{
		return false;
	}
}
</script>

<body>
	 
<%
try
{
Connection conn = null,conn1=null;
Class.forName(DB_Driver);
/*conn=DriverManager.getConnection("jdbc:mysql://164.68.105.216:3306/db_GlobalERP","fleetview","1@flv");*/
/*conn1=DriverManager.getConnection("jdbc:mysql://164.68.105.216:3306/db_gps","fleetview","1@flv");*/
//conn=DriverManager.getConnection("jdbc:mysql://202.65.131.44:3306/db_GlobalERP","java","transjava!1");
conn=DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
//conn1=DriverManager.getConnection("jdbc:mysql://202.65.131.44:3306/db_gps","java","transjava!1");
//conn1=DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
//conn=DriverManager.getConnection("jdbc:mysql://164.68.105.216/db_GlobalERP","erp","1@erp");
//conn1=DriverManager.getConnection("jdbc:mysql://182.18.129.62/db_gps","fleetview","1@flv");
 %>
 <%
 	
 	Statement sterp = null, sterp1 = null, stgps = null, stgps1 = null,stgps2=null;
 	Statement sterp2 = null, sterp3 = null, stqr = null;
 	String selectedName, fpreviousmonth="", fppreviousmonth="";
 	String FollowUpType = "",Group="";
%>
<%
 	String fromDateCal = "", toDateCal = "", sql1 = "",sql2="",sql3="";
 	String todaysTime = new SimpleDateFormat(" HH:mm:ss")
 				.format(new java.util.Date());
	int i=1;
	int vehid=0;
	int k=2000;
	String vehiclecode = "";
 	Date tdy = new Date();
 	Date tomorrow = new Date();
 	Calendar cal = Calendar.getInstance();
 	Calendar now = Calendar.getInstance();
 	cal.setTime(tdy);
 	String todaysDate1 = new SimpleDateFormat("yyyy-MM-dd")
		.format(tdy);
 	System.out.println("Todays date is"+todaysDate1);
 	String todaysDate = new SimpleDateFormat("dd-MMM-yyyy")
 				.format(tdy);
 	cal.add(Calendar.DAY_OF_MONTH, -1);
 	Date YesterdaysDateAsDate = cal.getTime();
 	String yesterdaysDate = new SimpleDateFormat("dd-MMM-yyyy")
 				.format(YesterdaysDateAsDate);

 	fromDateCal = toDateCal = new SimpleDateFormat("dd-MMM-yyyy")
 				.format(new java.util.Date());
 	try {
 			sterp = conn.createStatement();
 			sterp1 = conn.createStatement();
 			sterp2 = conn.createStatement();
 			sterp3 = conn.createStatement();
 			stgps = conn.createStatement();
 			//stgps1 = conn1.createStatement();
 			//stgps2 = conn1.createStatement();
 			stqr = conn.createStatement();
 		} catch (Exception e) 
 		{
 		}
 		
 		int currentmonthcount=0,currentyearcount=0, ppreviousmonth=0, ppreviousyear=0;
 		int previousmonth=0;
 		int previousyear=0;
 		String finalmonth="";
		String currentyear="";
		String currentmonth="select MONTH('"+todaysDate1+"')";
		System.out.println(currentmonth);
		ResultSet rsMonth=sterp1.executeQuery(currentmonth);
		rsMonth.next();
		currentmonthcount=rsMonth.getInt(1);
		System.out.println("current month "+currentmonthcount);
		
		if(currentmonthcount==1 || currentmonthcount==2 || currentmonthcount==3 || currentmonthcount==4 || currentmonthcount==5 || currentmonthcount==6 || currentmonthcount==7 || currentmonthcount==8 || currentmonthcount==9 )
		//if(currentmonthcount==1)
		{
			finalmonth="0"+Integer.toString(currentmonthcount);
		}
		else if(currentmonthcount==10 || currentmonthcount==11 || currentmonthcount==12)
		{
			finalmonth=Integer.toString(currentmonthcount);
		}		
			
		System.out.println("a    a "+finalmonth);
		
		currentyear="select YEAR('"+todaysDate1+"')";
		System.out.println(currentyear);
		ResultSet rsYear=sterp2.executeQuery(currentyear);
		rsYear.next();
		currentyearcount=rsYear.getInt(1);
		
		System.out.println(currentyearcount);  
		
		if(currentmonthcount==1)
		{
			previousyear=currentyearcount-1;
			previousmonth=12;
		    
			//	currentmonthcount=12;
		}
		else 
		{
			previousyear=currentyearcount;
			System.out.println("final month is  "+finalmonth);
			previousmonth=Integer.parseInt(finalmonth)-1;
			System.out.println("previous month is  "+previousmonth);
		}
		if(previousmonth==1 || previousmonth==2 || previousmonth==3 || previousmonth==4 || previousmonth==5 || previousmonth==6 || previousmonth==7 || previousmonth==8 || previousmonth==9 )
			//if(previousmonth==1)
			{
				fpreviousmonth="0"+Integer.toString(previousmonth);
			}
			else if(previousmonth==10 || previousmonth==11 || previousmonth==12)
			{
				fpreviousmonth=Integer.toString(previousmonth);
			}
		/**********************************************************************************/
		
		if(previousmonth==1)
		{
			ppreviousyear=previousyear-1;
			ppreviousmonth=12;
		    
			//	currentmonthcount=12;
		}
		else 
		{
			ppreviousyear=previousyear;
			System.out.println("final previous month is  "+fpreviousmonth);
			ppreviousmonth=Integer.parseInt(fpreviousmonth)-1;
			System.out.println("pprevious month is  "+ppreviousmonth);
		}
		if(ppreviousmonth==1 || ppreviousmonth==2 || ppreviousmonth==3 || ppreviousmonth==4 || ppreviousmonth==5 || ppreviousmonth==6 || ppreviousmonth==7 || ppreviousmonth==8 || ppreviousmonth==9 )
			//if(previousmonth==1)
			{
				fppreviousmonth="0"+Integer.toString(ppreviousmonth);
			}
			else if(ppreviousmonth==10 || ppreviousmonth==11 || ppreviousmonth==12)
			{
				fppreviousmonth=Integer.toString(ppreviousmonth);
			}
		
		/**********************************************************************************/
		/*else 
		{
			currentyearcount=currentyearcount;
			currentmonthcount=currentmonthcount-1;
		}
		
		
		System.out.println(currentmonthcount);
		System.out.println(currentyearcount); */ 
		
		//int newmonth=currentmonthcount-1;
		
%>
<div style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
<a><b>Vehicle Addition</b></a> 
</div>
<form name="data" action="" method="post">
<%
String exportFileName="Vehicle_det.xls";   // GIVE YOUR REPORT NAME
%>
<input type="hidden" id="tableHTML" name="tableHTML" value="" />   
<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 

<br>
<br>

<table align="right">
<tr>
<td align="right">
		<font size="1">&nbsp;&nbsp;&nbsp;<%=new java.util.Date()%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('purchase','tableHTML');">
	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a>
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
</td>
</tr>
</table>


<br>
<br>
<div id='purchase'>
<table class="sortable" width="80%">
<tr>
<th>Sr No</th>
<th>Vehicle Reg No</th>
<th>Transporter</th> 
<th>Group Name</th>
<th>Save</th>
</tr>

<%
//String sqlNew="CREATE TABLE IF NOT EXISTS db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+previousyear+"_"+fpreviousmonth+" like db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+ppreviousyear+"_"+fppreviousmonth;
//System.out.println(sqlNew);
//sterp.executeUpdate(sqlNew);
//String qr = "select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+previousyear+"_"+fpreviousmonth;
//System.out.println(qr);
//ResultSet rstqr = stqr.executeQuery(qr);
//if(!rstqr.next())
//{
//	String sqlinsert="insert into "+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+previousyear+"_"+fpreviousmonth+"(select * from "+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+ppreviousyear+"_"+fppreviousmonth+")";
//    System.out.println(sqlinsert);
//    sterp3.executeUpdate(sqlinsert);
//}
System.out.println("Relative Previous year:"+previousyear);
System.out.println("Final previous month"+fpreviousmonth);
//sql3="select MAX(Vehid) from "+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+previousyear+"_"+fpreviousmonth+"";
//System.out.println("222 "+sql3);
//ResultSet rs3=sterp.executeQuery(sql3);
//System.out.println("after stmt  "+sql3);
/*if(rs3.next())*/
//vehid=rs3.getInt(1);
//System.out.println("Veh ID======"+vehid);
//sql1="select * from db_gps."+session.getAttribute("CompanyMasterID").toString()+"vehicledetails where VehicleCode >'"+vehid+"' and updatedinerp = 'No' Order By VehicleCode Asc limit 10 ";
Calendar cldr = Calendar.getInstance();
cldr.set(previousyear, previousmonth, 0);
Date date = cldr.getTime();
SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
String lastdate = format1.format(date);
System.out.println("last date is$$$$$"+lastdate);
int lastdayofmonth = cldr.getActualMaximum(Calendar.DAY_OF_MONTH);
System.out.println("last day is$$$$$"+lastdayofmonth);
sql1="select * from db_gps.t_vehicledetails where VehicleCode not in (select distinct vehid from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+previousyear+"_"+fpreviousmonth+") and InstalledDate between '"+previousyear+"-"+fpreviousmonth+"-01' and '"+previousyear+"-"+fpreviousmonth+"-"+lastdayofmonth+"'";
//sql1="select * from db_gps."+session.getAttribute("CompanyMasterID").toString()+"vehicledetails where VehicleCode not in (select distinct vehid from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation2013_11) and InstalledDate between '2013-11-01' and '2013-11-30'";
System.out.println("before executing sql1"+sql1);
ResultSet rsData=stgps.executeQuery(sql1);
System.out.println("after executing sql1"+sql1);
while(rsData.next())
{
%>
<tr>
<% vehiclecode =  rsData.getString("vehiclecode"); %>
<td><div align="right"><%=i %></div></td>
<td><div align="left"><%=rsData.getString("VehicleRegNumber") %></div></td>
<td><div align="left"><%=rsData.getString("OwnerName") %></div></td>
<td><select name="grp<%=i %>" id="grp<%=i %>" style="width:190px;padding: 4px 5px 2px 5px;
			border: 1px solid black; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
			color: #000000;" ><option value="Select">Select</option>
<%
sql2="Select distinct(GroupName) from "+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+previousyear+"_"+fpreviousmonth+" order by GroupName";
ResultSet rsgrp=sterp2.executeQuery(sql2);
while(rsgrp.next())
{
Group=rsgrp.getString(1);
%>
<option value="<%=rsgrp.getString(1) %>"><%=rsgrp.getString(1) %></option>
<% System.out.println("Groupname is"+Group);%>
<%
}
%>
</select>
<% String ownername = rsData.getString("OwnerName");
   System.out.println("Transporter before conversion is"+ownername);
   ownername = ownername.replace("&","^");
   System.out.println("Transporter after conversion is"+ownername);
%>
<a href = "AddNewTransporterup.jsp?VehicleRegNumber=<%=rsData.getString("VehicleRegNumber") %>&OwnerName=<%=ownername %>&vehiclecode=<%=vehiclecode %>">&nbsp;<input type=button name="Other" value="Other" id="Other" onclick="return confirmation();"></a>
</td>
<td>
<div align="left"><input type=button name="Add" value="Add" id="Add" onclick="getdata('<%=rsData.getString("VehicleRegNumber") %>','<%=ownername %>','<%=vehiclecode %>','<%=i %>','<%=previousyear %>','<%=fpreviousmonth %>');">
</div>
</td>
</tr>
<%
i++;
}
%>
<%
System.out.println("last date is"+lastdate);
System.out.println("last day is"+lastdayofmonth);
System.out.println("after executing sql1"+sql1);
//System.out.println("sqlnew is"+sqlNew);
}
catch(Exception e)
{
	System.out.println("Exception is -"+e);
}
%>

</table>
</div>
</form>
	
</body>