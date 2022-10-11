<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<%@ include file="ConnectionComplaint.jsp" %>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%@page import="java.util.Date"%>
	<script src="dropdown.js" type="text/javascript"></script>
		<script src="ledgerDetails.js" type="text/javascript"></script>

<script>
function showSelectedSuppliers(customerCode,companyName){
	document.data.companyNames.value=companyName;
	//alert(document.data.customerCode.value=customerCode);
	document.getElementById("companyList").style.display='none';
	document.data.isCheckedAll.checked=false;
}

function hideCompanyName(){
	document.data.companyNames.value='';
}

function getCompanies()
{
	document.getElementById("companyList").style.display='block';
	var company=document.data.companyNames.value;
	var ajaxRequest;  // The variable that makes Ajax possible!

	try{
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

	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var reslt=ajaxRequest.responseText;
			document.getElementById("companyList").innerHTML=reslt;
		} 
	}
	var queryString = "?company=" +company;
	ajaxRequest.open("GET", "AjaxGetSupplierForEnquiry.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
}
function popUp(Address,supplierCode,PONo,GRNNo)
{ 
    window.open(Address+'?supplierCode='+supplierCode+'&PONo='+PONo+'&GRNNo='+GRNNo);
}

function gotoExcel (elemId, frmFldId)  
{  
//	alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.purchaseenq.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["purchaseenq"].submit();       // CHANGE FORM NAME HERE

} 	
</script>


                                 	                                                                                                              
<%
Connection conn=null;
try
{
	//erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);

System.out.println("Here connection for db_gps");

Class.forName(DB_Driver1); 
conn = DriverManager.getConnection(DB_NAME1,DB_USERNAME1,DB_PASSWORD1);

System.out.println("connection===>"+conn);

}catch(Exception e)
{
	e.printStackTrace();
}


%>
<%
	
	Statement st = null, st1 = null, st3 = null, st4 = null,st5=null;
	Statement st2 = null;

	Format format=new SimpleDateFormat("dd-MMM-yyyy");
	Format parse=new SimpleDateFormat("yyyy-MM-dd");
	String fromDate="",toDate="",fromDateCal="",toDateCal="",CompanyName="";
%>


<%
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	fromDate=toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	if (!(null == request.getParameter("fromdate"))) {
		fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
		fromDateCal=request.getParameter("fromdate");
	}
	else
	{
		//fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
		fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
		fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(fromDateCal));
		//fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	}
	if (!(null == request.getParameter("todate"))){
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		toDateCal=request.getParameter("todate");
	}
	String instruction = request.getParameter("instruction");
	String peripherals = request.getParameter("peripherals");
	String unitid="";
 		
try 
{
	
	st =conn.createStatement();
	st1 =conn.createStatement();
	st2 =conn.createStatement();
	st3 =conn.createStatement();
	st4 =conn.createStatement();
	ResultSet rsdata=null,rsdata2=null,rsdata3=null,rsdata4=null;
	String sql1="",sql2="",sql3="",sql4="";
	//int pendingcount=0,Uploadedcount=0,cancelledcount=0;
	
%>

	<div
		style="font-size: 1.6em; text-align: center; margin-top: 0.5em; margin-bottom: 0.5em;">
	<a>Transporter Installation Report</a></div>

<form name="data" action="" method="get">

<table width="100%" border="0" align="center">
		<tr align="center">


			<td align="right">
			 &nbsp;<b>From</b>
			<input type="text" id="fromdate"
						name="fromdate" value="<%=fromDateCal%>" size="15" readonly
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
					
			<!--<input type="button" name="From Date" value="From Date" id="trigger">-->
			<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "fromdate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "fromdate"       // ID of the button
			    }
			  );
			</script>
 </td><td align="left"  style="width: 10px;">
			&nbsp;<b>To </b> </td><td align="left"  style="width: 80px;">
			 <input type="text" id="todate"
						name="todate" value="<%=toDateCal %>" size="15" readonly
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
					
			<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "todate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",    // the date format
			      button      : "todate"       // ID of the button
			    }
			  );
			</script>
			 </td>
			 <td>&nbsp;<b>Peripherals</b><select name="peripherals" id="peripherals" style="
				  	width: 185px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; ">
				  	<option value="ALL">ALL</option>
				  <% String sqlDropdown1="select distinct(peripherals) from db_gps.t_unitmaster";
				  ResultSet rsDropdown1=st3.executeQuery(sqlDropdown1);
				  while(rsDropdown1.next()){
					  if(peripherals!=null)
					  {
					  if(peripherals.equalsIgnoreCase(rsDropdown1.getString(1)))
					  {
						  %>
						   <option selected="selected"><%=rsDropdown1.getString(1)%></option>
						  <%
					  }
					  else
					  {
						  %>
							
						  <option><%=rsDropdown1.getString(1)%></option>
									
								<%} 
					 
					  }
					  else
					  {
				  %>
				
				  <option><%=rsDropdown1.getString(1)%></option>
							
						<%} 	}%> 
				</select></td>
			  <td>&nbsp;<b>Instruction</b><select name="instruction" id="instruction" style="
				  	width: 185px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; ">
				  	<option value="ALL">ALL</option>
				  <% String sqlDropdown2="select distinct(Instruction) from db_gps.t_vehicledetails";
				  ResultSet rsDropdown2=st4.executeQuery(sqlDropdown2);
				  while(rsDropdown2.next()){
					  if(instruction!=null)
					  {
					  if(instruction.equalsIgnoreCase(rsDropdown2.getString(1)))
					  {
						  %>
						   <option selected="selected"><%=rsDropdown2.getString(1)%></option>
						  <%
					  }
					  else
					  {
						  %>
							
						  <option><%=rsDropdown2.getString(1)%></option>
									
								<%} 
					 
					  }
					  else
					  {
				  %>
				
				  <option><%=rsDropdown2.getString(1)%></option>
							
						<%} 	}%> 
				</select></td>
			 <td align="left" valign="top">&nbsp;&nbsp;
	 <input type="submit" name="submit" id="submit" style="border: outset;"
				value="GO"></input></td>
				
									<td>
			<table align="right"><tr>	
				<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('purchase','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
		</tr></table>
	</td>

		</tr>
	</table>
	
	<%
	String sqlCount="select * from "+session.getAttribute("CompanyMasterID").toString()+"vehicledetails as a where  a.InstalledDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59' ";
	
	ResultSet rscount=st1.executeQuery(sqlCount);
	System.out.println("qryy cont====>"+sqlCount);
	
			
	%>


<!--		<table width=55% align="center" border="1" style="border-color: #C6DEFF;" cellpadding="0" cellspacing="0">-->
<!--                        <tr>-->
<!--                       <td> <b><font size="2" color="black">Color Code Indication:</font></b></td>-->
<!--                        <td bgcolor="#FAAFBE"><font size="2" color="black">A</font></td>-->
<!--                        <td bgcolor="#AEF8B1"><font size="2" color="black">B</font></td>-->
<!--                        <td bgcolor="#FFFF00"><font size="2" color="black">C</font></td>-->
<!--                       -->
<!--             -->
<!--                        </tr>-->
<!--                </table>-->
       
	</form>
	<br>
	</br>
	<div></div>
	<form name="purchaseenq" method="post">
	<%
String exportFileName="Transporter_Installation_det.xls";   // GIVE YOUR REPORT NAME
%>

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   
	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
	<div> </div>
	
		<div id='purchase'>
	<table  width="100%" class='sortable' >
	<tr>
	<th>Sr. NO</th>
	<th>Tranasporter</th>
	<th>User Limit</th>
	<th>Unit Limit</th>
	<th>Instruction</th>
	<th>Installed Units</th>
	<th>Pending Installation</th>
	</tr>
<%   
//if(null!=request.getQueryString())
//{


try
{
	System.out.println("INsT===>"+instruction+"Pheri"+peripherals);
	if(instruction.equals("ALL") && peripherals.equals("ALL"))
			{
	 sql1="select * from "+session.getAttribute("CompanyMasterID").toString()+"vehicledetails as a where  a.InstalledDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59' group by OwnerName ";
			}
	else if(peripherals.equals("ALL"))
	{
		
		sql1="select * from "+session.getAttribute("CompanyMasterID").toString()+"vehicledetails as a where a.Instruction='"+instruction+"' and  a.InstalledDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59' group by OwnerName ";
		
	}else if(instruction.equals("ALL"))
	{
		/*
		String sqlPheripherals="select unitid  from db_gps."+session.getAttribute("CompanyMasterID").toString()+"unitmaster where peripherals='"+peripherals+"'";
		  ResultSet rspheripherals=st4.executeQuery(sqlPheripherals);
		  while(rspheripherals.next())
		  		{
			      unitid=","+rspheripherals.getString(1);
				 }
		  System.out.println("UnitID===>"+unitid);
		  */
		
		
		sql1="select * from "+session.getAttribute("CompanyMasterID").toString()+"vehicledetails as a,"+session.getAttribute("CompanyMasterID").toString()+"unitmaster as b where a.unitid=b.unitid and b.peripherals='"+peripherals+"'  and  a.InstalledDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59'  group by OwnerName";
	}
	else
	{
		sql1="select * from "+session.getAttribute("CompanyMasterID").toString()+"vehicledetails as a,"+session.getAttribute("CompanyMasterID").toString()+"unitmaster as b where a.Instruction='"+instruction+"' and a.unitid=b.unitid and b.peripherals='"+peripherals+"'  and  a.InstalledDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59' group by OwnerName ";
	}
	
}
catch(Exception e)
{
	sql1="select * from "+session.getAttribute("CompanyMasterID").toString()+"vehicledetails as a where  a.InstalledDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59' ";
}
System.out.println("QUERY FOR REPORT====>>"+sql1);
rsdata=st.executeQuery(sql1);
int cnt=0,cnt1=0,i=1;
while(rsdata.next())
{
	System.out.println("Vehicle Code==********==>"+rsdata.getInt("VehicleCode"));
	String Transporter=rsdata.getString("OwnerName");
	sql2="select Userlimit,Unitlimit from "+session.getAttribute("CompanyMasterID").toString()+"transporter as t,"+session.getAttribute("CompanyMasterID").toString()+"vehicledetails as v where t.TypeValue='"+Transporter+"' and  v.OwnerName=t.TypeValue and  v.InstalledDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59'";
	rsdata2=st2.executeQuery(sql2);
	System.out.println("Query for Limit"+sql2);
	
	 
	if(rsdata2.next())
	{
		int unitlimit=rsdata2.getInt("Unitlimit");
		sql3="select count(*) as cnt from "+session.getAttribute("CompanyMasterID").toString()+"vehicledetails where OwnerName='"+Transporter+"' and status <> 'Deleted'" ;//  and InstalledDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59'";
		rsdata3=st3.executeQuery(sql3);
		System.out.println("Query for cnt==****=> "+sql3);
		if(rsdata3.next())
		{
		 cnt=rsdata3.getInt("cnt");
		}
		int total=unitlimit-cnt;
		System.out.println("Total===>"+unitlimit+"-"+cnt+"==="+total);
		
		//sql4="select count(*) as cnt from "+session.getAttribute("CompanyMasterID").toString()+"vehicledetails where OwnerName='"+Transporter+"' and status='-'  and InstalledDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59'";
		sql4="select count(*) as cnt from "+session.getAttribute("CompanyMasterID").toString()+"vehicledetails where OwnerName='"+Transporter+"' and status <> 'Deleted'  and InstalledDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59'";
		rsdata4=st4.executeQuery(sql4);
		System.out.println("Query for cnt==****=> "+sql4);
		if(rsdata4.next())
		{
		 cnt1=rsdata4.getInt("cnt");
		}
		
		
%>

<tr>
<td><div align="right"><font size="2" color="black"><%= i++%></font></div> </td>
<td><div align="left"><a href="transporterVehicleDetailsReport.jsp?transporterName=<%=rsdata.getString("OwnerName")%>&date1=<%=fromDate %>&date2=<%=toDate %>" target="_blank"><%=rsdata.getString("OwnerName") %></a></div></td>
<td><div align="right"><font size="2" color="black"><%=rsdata2.getInt("Userlimit") %> </font></div></td>
<td><div align="right"><font size="2" color="black"><%=rsdata2.getInt("Unitlimit") %> </font></div></td>
<td><div align="left"><font size="2" color="black"><%=rsdata.getString("Instruction") %></font></div> </td>
<td><div align="right"><font size="2" color="black"><%=cnt1%></font></div></td>
<td><div align="right"><font size="2" color="black"><%=total%></font></div></td>
</tr>

<%
	}

}   // end of while  
	
if(i==1){
	%>
<tr><td colspan="7">
NO DATA AVAILABLE
</td></tr>	
<%}
%>

</table>
</div>
</form>

<%	


//}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>  		

	</form>
	
	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
<!-- end #footer -->
</body>
</html>
</jsp:useBean>