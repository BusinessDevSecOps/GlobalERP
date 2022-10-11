<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ include file="header.jsp"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.TimeZone"%><jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<style type="text/css">
    @import url(jscalendar-1.0/calendar-win2k-1.css);
    </style>
	<style>
    </style>

	<script src="sorttable.js" type="text/javascript"></script>

	<script src="dropdown.js" type="text/javascript"></script>
	<script src="ledgerDetails.js" type="text/javascript"></script>


	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Transworld Compressor-Technologies LTD, ERP</title>
	<link href="css/style.css" rel="stylesheet" type="text/css"
		media="screen" />
	<link href="css/table.css" rel="stylesheet" type="text/css"
		media="screen" />
	<style type="text/css">
    </style>
	
	<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
	
	<script type="text/javascript" src="css/chrome.js">
	</script>	
	<script type="text/javascript" src="convert.js">
	</script>
	<script type="text/javascript" >
	function popUp(Address,transactionId,company,condition)
	{ 
		//alert("pop");
	    window.open(Address+'?transactionId='+transactionId+'&company='+company+'&condition='+null,'jav','scrollbars=yes,menubar=yes,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
//window.open(Address+'?CompanyName='+CompanyName+'&SalesEnqNo='+SalesEnqNo+'&SalesEnqRefNo='+SalesEnqRefNo,'jav','scrollbars=yes,menubar=yes,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
	}


	function viewQuotation(Address,company,salesquono)
	{ 
		//alert("pop");
	    window.open(Address+'?company='+company+'&salesQuotation='+salesquono+'&condition=View','jav','scrollbars=yes,menubar=yes,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
//window.open(Address+'?CompanyName='+CompanyName+'&SalesEnqNo='+SalesEnqNo+'&SalesEnqRefNo='+SalesEnqRefNo,'jav','scrollbars=yes,menubar=yes,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
	}

	function viewOrder(Address,company,salesorderno)
	{ 
		//alert("pop");
	    window.open(Address+'?company='+company+'&salesOrder='+salesorderno,'jav','scrollbars=yes,menubar=yes,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
//window.open(Address+'?CompanyName='+CompanyName+'&SalesEnqNo='+SalesEnqNo+'&SalesEnqRefNo='+SalesEnqRefNo,'jav','scrollbars=yes,menubar=yes,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
	}

	function viewInvoices(Address,company,salesinvoiceno)
	{ 
		//alert("pop");
	    window.open(Address+'?company='+company+'&transactionId='+salesinvoiceno,'jav','scrollbars=yes,menubar=yes,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
//window.open(Address+'?CompanyName='+CompanyName+'&SalesEnqNo='+SalesEnqNo+'&SalesEnqRefNo='+SalesEnqRefNo,'jav','scrollbars=yes,menubar=yes,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
	}


	function gotoExcel (elemId, frmFldId)  
	{  
//		alert("*********** ");

	         var obj = document.getElementById(elemId);  

	         var oFld = document.getElementById(frmFldId); 

	          oFld.value = obj.innerHTML;  

	          document.addfollowup.action ="excel.jsp";     // CHANGE FORM NAME HERE

	          document.forms["addfollowup"].submit();       // CHANGE FORM NAME HERE

	} 

	
</script>
	</head>
	<body>
	
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
	
<%
    Connection conn = null;
    Statement st = null, st1 = null,st2=null,st3=null;
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	String toDate="";
	String selectedName="",reportname="",typesname="";
	String fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	String toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	String fromDate=toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	if (!(null == request.getParameter("fromdate"))) {
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromDateCal=request.getParameter("fromdate");
	}
	if (!(null == request.getParameter("todate"))){
	toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
	toDateCal=request.getParameter("todate");
	}
	
	String reports = request.getParameter("reports");
	String types = request.getParameter("types");
	String group = request.getParameter("group");
	int total=0,sum=0;
	try {
		conn = erp.ReturnConnection();
		st = conn.createStatement();
		st2 = conn.createStatement();
		st1 = conn.createStatement();
		st3 = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	%>
	
<br>
	<div align="center" style="font-size: 1.5em;"><a>ALL REPORTS </a></div>
<br>

<br>
	
<form name="showenquiry" method="get" action="" >

<table border="0" align="center" valign="top" width="">
<tr>
	<td><b>Types Of Reports :</b><br>
		<select name="reports" id="reports" style="width: 150px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; onchange="">
			<%if(reports != null) { 	
				%><option value='select' onclick="" >SELECT</option><%
			}else{
				 %><option value='select' selected="selected">SELECT</option><%
				 %><option value='enquiryall'  >All Enquiries</option><%
				 %><option value='pendingenquiries' > Pending Enquiry</option><%
				 %><option value='allquotations' >Quotations</option><%
				 %><option value='pendingquotations' >Pending Quotations</option><%
				 %><option value='cancelledquotations' >Quotations Cancelled</option><%
				 %><option value='allorders' >Order</option><%
				 %><option value='pendingorders' >Pending Orders</option><%
				 %><option value='cancelledorders' >Cancelled Orders</option><%
				 %><option value='allinvoices' >Invoices</option><%
				 %><option value='cancelledinvoices' >Cancelled Invoices</option><%
				
			}
			if(reports != null)
			{
				if(reports.equals("enquiryall") || reports == "enquiryall") {	
					 %><option value='enquiryall' selected="selected" >All Enquiries</option><%
					}else{
						 %><option value='enquiryall'>All Enquiries</option><%
					}
				
				if(reports.equals("pendingenquiries")) {		
					 %><option value='pendingenquiries' selected="selected"> Pending Enquiry</option><%
					}else{
						 %><option value='pendingenquiries' > Pending Enquiry</option><%
					}
				

				if(reports.equals("allquotations")) {		
					  %><option value='allquotations' selected="selected">Quotations</option><%
					}else{
						 %><option value='allquotations' >Quotations</option><%
					}
				

				if(reports.equals("pendingquotations")) {		
					 %><option value='pendingquotations' selected="selected">Pending Quotations</option><%
					}else{
						%><option value='pendingquotations' >Pending Quotations</option><%
					}
				

				if(reports.equals("allorders")) {		
					 %><option value='allorders' selected="selected">Order</option><%
					}else{
						 %><option value='allorders' >Order</option><%
					}
				
				if(reports.equals("pendingorders")) {		
					 %><option value='pendingorders' selected="selected">Pending Orders</option><%
					}else{
						 %><option value='pendingorders' >Pending Orders</option><%
					}
				
				if(reports.equals("cancelledorders")) {		
					 %><option value='cancelledorders' selected="selected">Cancelled Orders</option><%
					}else{
						 %><option value='cancelledorders' >Cancelled Orders</option><%
					}
				
				if(reports.equals("allinvoices")) {		
					%><option value='allinvoices' selected="selected">Invoices</option><%
					}else{
						%><option value='allinvoices' >Invoices</option><%
					}
				
				if(reports.equals("cancelledinvoices")) {		
					 %><option value='cancelledinvoices' selected="selected">Cancelled Invoices</option><%
					}else{
						 %><option value='cancelledinvoices' >Cancelled Invoices</option><%
					}
			}	
		     %>     		      
		      </select>
		      
   	</td>
	<td>&nbsp;&nbsp;</td>
	<td><b>Select The Type: </b><br>
		<select name="types" id="types" style="width: 150px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; onchange="">
		<%if(types != null) { 	
				%><option value='alltypes'>All</option><%
			}else{
				 %><option value='alltypes' selected="selected">All</option><%
				 %><option value='domestic' >Domestic</option><%
				 %><option value='export'>Export</option><%		
			}
			if(types != null)
			{
				if(types.equals("domestic") || reports == "domestic") {	
					 %><option value='domestic' selected="selected">Domestic</option><%
					}else{
						 %><option value='domestic' >Domestic</option><%
					}
				
				if(types.equals("export")) {		
					 %><option value='export' selected="selected">Export</option><%
					}else{
						 %><option value='export'>Export</option><%
					}				
			}	
		     %>     		   
		</select>
	</td>
	<td>&nbsp;&nbsp;</td>
	<td><b>Select The Group :</b><br>
		
		<select name="group" id="group" style="width: 150px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; onchange="">
		<%
			
		String sqlGroup="SELECT distinct(TheGroupName),TheGroupCode FROM  "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster ";
		ResultSet rsGroup=st.executeQuery(sqlGroup);
		
		if(group != null) { 	
				%><option value='All' >All</option><%
			}else{
				 %><option value='All' selected="selected">All</option><%
						 
				while(rsGroup.next()){ %>
 				<option value="<%=rsGroup.getString(1) %>"><%=rsGroup.getString(1) %></option>
		<%
		}
			}
			if(group != null)
			{
				while(rsGroup.next())
				{
					if(group.equals(rsGroup.getString(1))) 
					{	
						%><option value="<%=rsGroup.getString(1) %>" selected="selected"><%=rsGroup.getString(1) %></option><%
					}else
					{
						%><option value="<%=rsGroup.getString(1) %>"><%=rsGroup.getString(1) %></option><%
					}
				}
							
			}	
		     %>     		   
		</select>
	</td>
	<td>&nbsp;&nbsp;</td>  

	<td align="left">
		<b>From </b>&nbsp;&nbsp;
		<input type="text" id="fromdate"
		name="fromdate" value="<%=fromDateCal %>" size="15" readonly
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
			
		<b>To </b>&nbsp;&nbsp;
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
		<input type="submit" name="submit" id="submit" style="border: outset;"
		value="Go" /></td> 
		
		
		<td>
			<table align="right"><tr>	
				<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new java.util.Date()%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('dashboard','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
		</tr></table>
	</td>
</table>
</form>
<br>
<br>
<form name="addfollowup" method="post" >

<%
String exportFileName="Report_det.xls";   // GIVE YOUR REPORT NAME
%>
<div id='dashboard'>

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   

	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
<%
//for reports 
String[] areport =null;
if(!(request.getParameterValues("reports")==null))
{
	areport=request.getParameterValues("reports");
	//System.out.println(areport);
	if(areport[0].equalsIgnoreCase("enquiryall"))
	reportname="enquiryall";	
	else if(areport[0].equalsIgnoreCase("pendingenquiries"))
	reportname="pendingenquiries";
	else if(areport[0].equalsIgnoreCase("allquotations"))
	reportname="allquotations";
	else if(areport[0].equalsIgnoreCase("pendingquotations"))
	reportname="pendingquotations";
	else if(areport[0].equalsIgnoreCase("cancelledquotations"))
	reportname="cancelledquotations";
	else if(areport[0].equalsIgnoreCase("allorders"))
	reportname="allorders";
	else if(areport[0].equalsIgnoreCase("pendingorders"))
	reportname="pendingorders";
	else if(areport[0].equalsIgnoreCase("cancelledorders"))
	reportname="cancelledorders";
	else if(areport[0].equalsIgnoreCase("allinvoices"))
	reportname="allinvoices";
	else if(areport[0].equalsIgnoreCase("cancelledinvoices"))
	reportname="cancelledinvoices";
	
	else
	{
	for(int i=0;i<areport.length;i++) 
	reportname+="'"+areport[i]+"',";
	reportname = reportname.substring(0, reportname.length() - 1);
	}
	for(int i=0;i<areport.length;i++)
	System.out.println("REPORT NAME***********"+areport[i]);		
}

//for Types(domestic,export)
String arr1[]=null;
if(!(request.getParameterValues("types")==null))
{
	typesname="";	
	arr1=request.getParameterValues("types");
	if(arr1[0].equalsIgnoreCase("alltypes"))
	typesname="alltypes";
	else if(arr1[0].equalsIgnoreCase("domestic"))
	typesname="domestic";
	else if(arr1[0].equalsIgnoreCase("export"))
	typesname="export";
	else
	{
	for(int j=0;j<arr1.length;j++)
	typesname+="'"+arr1[j]+"',";
	
	typesname = typesname.substring(0, typesname.length() - 1);
	}
	for(int j=0;j<arr1.length;j++)
		System.out.println("type name***********"+arr1[j]);
}	
	
//for Group

String[] arr=null;
if(!(request.getParameterValues("group")==null))
{
	selectedName="";
	arr=request.getParameterValues("group");
	if(arr[0].equalsIgnoreCase("All"))
	selectedName="All";	
	else if(arr[0].equalsIgnoreCase("Compressor"))
	selectedName="Compressor";
	else if(arr[0].equalsIgnoreCase("DGSet"))
	selectedName="DGSet";
	else if(arr[0].equalsIgnoreCase("DigitalEquipment"))
	selectedName="DigitalEquipment";
	else if(arr[0].equalsIgnoreCase("Endoscope"))
	selectedName="Endoscope";
	
	else
	{
	for(int i=0;i<arr.length;i++) 
	selectedName+="'"+arr[i]+"',";
	
	selectedName = selectedName.substring(0, selectedName.length() - 1);
	}
	for(int i=0;i<arr.length;i++)
	System.out.println("Sel name***********"+arr[i]);		
}

%>

<input type="hidden" id="tableHTML" name="tableHTML" value="" />
<%
//******************************************************* FOR ENQUIRY (ALL) STARTS HERE***************************************************************************



if("enquiryall".equalsIgnoreCase(reportname))                             //for selection of report
{	
if(null != request.getQueryString())
	{
		%>
		<div align="center" style="font-size: 1.5em;"><a> ALL ENQUIRIES  </a></div>
		<br>
		<table border="1px" align="center" class="sortable"  >
		<tr>
		<th>SE NO</th>
		<th>Sales Enq Ref No</th>
		<th>Generated Date</th>
		<th>Company</th>
		<th>City</th>
		</tr>
		<%
		String SqlEnquiry="";
		if("alltypes".equalsIgnoreCase(typesname))                                    //for selection of types
		{
			if("All".equalsIgnoreCase(selectedName))	//for selection of group
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det WHERE SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY SalesEnqNo,SalesEnqRefNo, SalesEnqDate,  CompanyName, City ";
			else  if("Compressor".equalsIgnoreCase(selectedName))
			//System.out.println(selectedName);	
			SqlEnquiry="SELECT  a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b  ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlEnquiry=	"SELECT a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup=2 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlEnquiry=	"SELECT a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup=3 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlEnquiry=	"SELECT a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup=4 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City ";
			else
			SqlEnquiry=	"SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup >=5 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City ";
		}	
		
		else if("domestic".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))	                                  //for selection of group
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det WHERE SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' AND SalesEnqType=0 GROUP BY SalesEnqNo,SalesEnqRefNo, SalesEnqDate,  CompanyName, City";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT  a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b  ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup=1 AND  a.SalesEnqType=0 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City  ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlEnquiry=	"SELECT a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=0 AND b.TheGroup=2 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlEnquiry=	"SELECT a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=0 AND b.TheGroup=3 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlEnquiry=	"SELECT a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=0 AND b.TheGroup=4 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City";
			else
			SqlEnquiry=	"SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=0 AND b.TheGroup >=5 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City LIMIT 10";
		}	
		
		else if("export".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))	                                  //for selection of group
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det WHERE SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' AND SalesEnqType=1 GROUP BY SalesEnqNo,SalesEnqRefNo, SalesEnqDate,  CompanyName, City LIMIT 10 ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT  a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b  ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup=1 AND  a.SalesEnqType=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlEnquiry=	"SELECT a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=1 AND b.TheGroup=2 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlEnquiry=	"SELECT a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=1 AND b.TheGroup=3 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlEnquiry=	"SELECT a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=1 AND b.TheGroup=4 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City ";
			else
			SqlEnquiry=	"SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=1 AND b.TheGroup >=5 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"'  GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City ";
		}
		System.out.println(SqlEnquiry);
		ResultSet rsEnq=st.executeQuery(SqlEnquiry);
		while(rsEnq.next())
			
		    {
			
			String transactionId=rsEnq.getString("SalesEnqRefNo");
			String company=rsEnq.getString("CompanyName");
		%>
			<tr>
			<td><div align="right"><%=rsEnq.getString("SalesEnqNo") %></div></td>
			<td><div align="right"><a href="#" onclick="popUp('SEDetails.jsp','<%=transactionId%>','<%=company %>','null')"><%=transactionId %></a></div></td>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse	
							(rsEnq.getString("SalesEnqDate")))%></div></td>
			<td><div align="left"><%=company %></div></td>
			<td><div align="left"><%=rsEnq.getString("City") %></div></td>
			</tr>
		<%
			}
	}

%>
</table>
<%
}					
%>

<%// *************************************************************  ENQUIRY(ALL) ENDS HERE************************************************************ %>
						
<%
// *************************************************   FOR ENQUIRY (PENDING) STARTs HERE  *******************************************************
if("pendingenquiries".equalsIgnoreCase(reportname))
{	
if(null != request.getQueryString())
	{
			
		%>
		<div align="center" style="font-size: 1.5em;"><a> PENDING ENQUIRIES  </a></div>
		<br>
		<table  border="1px"  class="sortable" >
		<tr>
		<th>SE NO</th>
		<th>Sales Enq Ref No</th>
		<th>Generated Date</th>
		<th>Company</th>
		<th>City</th>
		</tr>
		<%
		String SqlEnquiry="";
		
		if("alltypes".equalsIgnoreCase(typesname))                                    //for selection of types
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup=1 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup=2 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("DigialEquipment".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup=3 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup=4 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else	
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.TheGroup>=5 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
		}
		
		else if("domestic".equalsIgnoreCase(typesname))                                    //for selection of types
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE  a.SalesEnqType=0 AND b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=0 AND b.TheGroup=1 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=0 AND b.TheGroup=2 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("DigialEquipment".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=0 AND b.TheGroup=3 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=0 AND b.TheGroup=4 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else	
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=0 AND b.TheGroup>=5 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
		}
		
		else if("export".equalsIgnoreCase(typesname))                                    //for selection of types
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE  a.SalesEnqType=1 AND b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=1 AND b.TheGroup=1 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=1 AND b.TheGroup=2 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("DigialEquipment".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=1 AND b.TheGroup=3 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=1 AND b.TheGroup=4 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
			else	
			SqlEnquiry="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE a.SalesEnqType=1 AND b.TheGroup>=5 AND  b.PriceQuoted=1 AND a.SalesEnqDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesEnqNo,a.SalesEnqRefNo, a.SalesEnqDate, a.CompanyName, a.City   ";
		}
		
		System.out.println(SqlEnquiry);
		System.out.println("IN THE LOOP");
		
		ResultSet rsEnq=st.executeQuery(SqlEnquiry);
		while(rsEnq.next())
			{
			String transactionId=rsEnq.getString("SalesEnqRefNo");
			String company=rsEnq.getString("CompanyName");
		%>
			<tr>
			<td><div align="right"><%=rsEnq.getString("SalesEnqNo") %></div></td>
			<td><div align="right"><a href="#" onclick="popUp('SEDetails.jsp','<%=transactionId%>','<%=company %>')"><%=transactionId %></a></div></td>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse
							(rsEnq.getString("SalesEnqDate")))%></div></td>
			<td><div align="left"><%=company %></div></td>
			<td><div align="left"><%=rsEnq.getString("City") %></div></td>
			</tr>
		<%
			}
	}
%>
</table>
<%
}
%>

<%// ********************************************************  ENQUIRY(PENDING) ENDS HERE************************************************************* %>

<%
// *************************************************   FOR QUATAIONS (ALL) STARTs HERE  *******************************************************
if("allquotations".equalsIgnoreCase(reportname))
{	
if(null != request.getQueryString())
	{
		%>
		<div align="center" style="font-size: 1.5em;"><a>  QUATATIONS  </a></div>
		<br>
		<table  border="1px"  class='sortable' >
		<tr>
		<th>SQ NO</th>
		<th>Customer Code</th>
		<th>Total Rs</th>
		<th>Generated On</th>
		<th>Company</th>
		<th>City</th>
		</tr>
		<%
		String SqlQuotation="";
		
		if("alltypes".equalsIgnoreCase(typesname))                                    //for selection of types
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE  a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=1 AND  a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode,a.Total, a.SalesQuoDate, a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=2 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode,a.Total, a.SalesQuoDate, a.CompanyName, a.city   ";
			else if("DigialEquipment".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=3 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode,a.Total, a.SalesQuoDate, a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=4  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode,a.Total, a.SalesQuoDate, a.CompanyName, a.city   ";
			else	
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup>=5  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode,a.Total, a.SalesQuoDate, a.CompanyName, a.city   ";
		}
		
		else if("domestic".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType='Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=1 AND a.CurrType='Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=2 AND a.CurrType='Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=3 AND a.CurrType='Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=4 AND a.CurrType='Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup>=5 AND a.CurrType='Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
		}
		
		else if("export".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE  a.CurrType <> 'Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE  b.TheGroup=1 AND a.CurrType <> 'Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE  b.TheGroup=2 AND a.CurrType <> 'Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE  b.TheGroup=3 AND a.CurrType <> 'Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE  b.TheGroup=4 AND a.CurrType <> 'Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE  b.TheGroup>=5 AND a.CurrType <> 'Rupees' AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
		}
		System.out.println(SqlQuotation);
		System.out.println("IN THE LOOP");
		
		ResultSet rsQuo=st.executeQuery(SqlQuotation);
		while(rsQuo.next())
			{
			String salesquono=rsQuo.getString("SalesQuoNo");
			String company=rsQuo.getString("CompanyName");
		%>
			<tr>
			<td><div align="right"><a href="#" onclick="viewQuotation('viewQuotation.jsp','<%=company %>','<%= salesquono%>')"><%=salesquono %></a></div></td>
			<td><div align="right"><%=rsQuo.getString("CustomerCode") %></div></td>
			<td><div align="right"><%=rsQuo.getString("Total") %></div></td>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse
							(rsQuo.getString("SalesQuoDate")))%></div></td>
			<td><div align="left"><%=company%></div></td>
			<td><div align="left"><%=rsQuo.getString("city") %></div></td>
			</tr>
		<%
			}
	}
%>
</table>
<% 
}
%>

<%
// ********************************************************  QUOTATIONS(All) ENDS HERE************************************************************* %>

<%
// *************************************************   FOR PENDING QUoTATIONS  STARTs HERE  *******************************************************
if("pendingquotations".equalsIgnoreCase(reportname))
{
if(null != request.getQueryString())
	{
		%>
		<div align="center" style="font-size: 1.5em;"><a> PENDING QUOTATIONS  </a></div>
		<br>
		<table  border="1px"  class='sortable' >
		<tr>
		<th>SQ NO</th>
		<th>Customer Code</th>
		<th>Total Rs</th>
		<th>Generated On</th>
		<th>Company</th>
		<th>City</th>
		</tr>
		<%
		String SqlQuotation="";
		
		if("alltypes".equalsIgnoreCase(typesname))                                    //for selection of types
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND b.TheGroup=1 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND b.TheGroup=2 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND b.TheGroup=3 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND b.TheGroup=4 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND b.TheGroup>=5 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
		}
		
		else if("domestic".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType='Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=1 AND a.CurrType='Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=2 AND a.CurrType='Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=3 AND a.CurrType='Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=4 AND a.CurrType='Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup>=5 AND a.CurrType='Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
		}
		
		else if("export".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType <>'Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=1 AND a.CurrTyp <> 'Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=2 AND a.CurrType <> 'Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=3 AND a.CurrType <> 'Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup=4 AND a.CurrType <> 'Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE b.TheGroup>=5 AND a.CurrType <> 'Rupees' AND a.SalesQuoCancelled=0 AND a.ThisisSalesOrder=0 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
		}
		System.out.println(SqlQuotation);
		ResultSet rsQuo=st.executeQuery(SqlQuotation);
		while(rsQuo.next())
			{
			
			String salesquono=rsQuo.getString("SalesQuoNo");
			String company=rsQuo.getString("CompanyName");
		%>
			<tr>
			<td><div align="right"><a href="#" onclick="viewQuotation('viewQuotation.jsp','<%= company%>','<%= salesquono%>')"><%= salesquono %></a></div></td>
			<td><div align="right"><%=rsQuo.getString("CustomerCode") %></div></td>
			<td><div align="right"><%=rsQuo.getString("Total") %></div></td>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse
							(rsQuo.getString("SalesQuoDate")))%></div></td>
			<td><div align="left"><%=company %></div></td>
			<td><div align="left"><%=rsQuo.getString("city") %></div></td>
			</tr>
		<%
			}
	} 

%>

</table>
<% 
}
%>


<%// ******************************************************** PENDING QUOTATIONS ENDS HERE************************************************************* %>

<%
// *************************************************   FOR CANCELLED QUOTATIONS STARTs HERE  *******************************************************

if("cancelledquotations".equalsIgnoreCase(reportname))
{
if(null != request.getQueryString())
	{
		%>
		<div align="center" style="font-size: 1.5em;"><a> CANCELLED QUATATIONS </a></div>
		<br>
		<table  border="1px"  class='sortable' >
		<tr>
		<th>SQ NO</th>
		<th>Customer Code</th>
		<th>Total Rs</th>
		<th>Generated On</th>
		<th>Company</th>
		<th>City</th>
		</tr>
		<%
		String SqlQuotation="";
		
		if("alltypes".equalsIgnoreCase(typesname))                                    //for selection of types
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=1  AND b.TheGroup=1 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=1  AND b.TheGroup=2 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=1  AND b.TheGroup=3 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=1  AND b.TheGroup=4 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.SalesQuoCancelled=1  AND b.TheGroup>=5 AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
		}
		
		else if("domestic".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType='Rupees' AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(typesname))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType='Rupees' AND b.TheGroup=1 AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(typesname))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType='Rupees' AND b.TheGroup=2 AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(typesname))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType='Rupees' AND b.TheGroup=3 AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(typesname))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType='Rupees' AND b.TheGroup=4 AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType='Rupees' AND b.TheGroup>=5 AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
		}
		
		else if("export".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType <> 'Rupees' AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(typesname))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType <> 'Rupees' AND b.TheGroup=1 AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(typesname))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType <> 'Rupees' AND b.TheGroup=2 AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(typesname))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType <> 'Rupees' AND b.TheGroup=3 AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(typesname))
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType <> 'Rupees' AND b.TheGroup=4 AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
			else
			SqlQuotation="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items as b ON(a.SalesQuoNo=b.SalesQuoNo) WHERE a.CurrType <> 'Rupees' AND b.TheGroup>=5 AND a.SalesQuoCancelled=1  AND a.SalesQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesQuoNo,a.CustomerCode, a.Total,a.SalesQuoDate,a.CompanyName, a.city   ";
		}
		System.out.println(SqlQuotation);
		ResultSet rsQuo=st.executeQuery(SqlQuotation);
		while(rsQuo.next())
			{
			
			String salesquono=rsQuo.getString("SalesQuoNo");
			String company=rsQuo.getString("CompanyName");
		%>
			<tr>
			<td><div align="right"><a href="#" onclick="viewQuotation('viewQuotation.jsp','<%= company%>','<%= salesquono%>')"><%=salesquono %></a></div></td>
			<td><div align="right"><%=rsQuo.getString("CustomerCode") %></div></td>
			<td><div align="right"><%=rsQuo.getString("Total") %></div></td>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse
							(rsQuo.getString("SalesQuoDate")))%></div></td>
			<td><div align="left"><%=company %></div></td>
			<td><div align="left"><%=rsQuo.getString("city") %></div></td>
			</tr>
		<%
			}
	} 
%>
</table>
<%
}
%>


<%// ******************************************************** CANCELLED QUOTATIONS ENDS HERE************************************************************* %>

<%
// *************************************************   FOR ORDER(ALL) STARTs HERE  *******************************************************

if("allorders".equalsIgnoreCase(reportname))
{	
if(null != request.getQueryString())
	{
		%>
		<div align="center" style="font-size: 1.5em;"><a> ORDERS  </a></div>
		<br>
		<table  border="1px"  class='sortable' >
		<tr>
		<th>Sales Order NO</th>
		<th>Total Rs</th>
		<th>Generated On</th>
		<th>Company</th>
		<th>City</th>
		</tr>
		
		<%
		String SqlOrder="";
		
		
		if("alltypes".equalsIgnoreCase(typesname))
		{	
			if("All".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE b.TheGroup=1 AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE b.TheGroup=2 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE b.TheGroup=3  AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE b.TheGroup=4 AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE b.TheGroup>=5 AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
		}
		
		else if("domestic".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.CurrType='Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.TheGroup=1 AND  a.CurrType='Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.TheGroup=2 AND  a.CurrType='Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.TheGroup=3 AND  a.CurrType='Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.TheGroup=4 AND  a.CurrType='Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.TheGroup>=5 AND  a.CurrType='Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
		}
		
		else if("export".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.CurryType <> 'Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.TheGroup=1 AND  a.CurrType <> 'Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.TheGroup=2 AND  a.CurrType <> 'Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.TheGroup=3 AND  a.CurrType <> 'Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.TheGroup=4 AND  a.CurrType <> 'Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.TheGroup>=5 AND  a.CurrType <> 'Rupees' AND a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
		}
		ResultSet rsOrder=st.executeQuery(SqlOrder);
		System.out.println(SqlOrder);
		while(rsOrder.next())
			{
			
			String salesorder=rsOrder.getString("SalesOrderNo");
			String company= rsOrder.getString("CompanyName");
		%>
			<tr>
			<td><div align="right"><a href="#" onclick="viewOrder('viewOrder.jsp','<%= company%>','<%=salesorder%>')"><%=salesorder%></a></div></td>
			<td><div align="right"><%=rsOrder.getString("Total") %></div></td>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse
							(rsOrder.getString("SalesOrderDate")))%></div></td>
			<td><div align="left"><%=company %></div></td>
			<td><div align="left"><%=rsOrder.getString("city") %></div></td>
			</tr>
		<%
			}
	}	
%>
</table>
<%
}
%>


<%// ******************************************************** ORDER(All) ENDS HERE************************************************************* %>

<%
// *************************************************   FOR PENDING ORDER STARTs HERE  *******************************************************

if("pendingorders".equalsIgnoreCase(reportname))
{
if(null != request.getQueryString())
	{
		%>
		
		<div align="center" style="font-size: 1.5em;"><a> PENDING ORDERS  </a></div>
		<br>
		<table  border="1px"  class='sortable'>
		<tr>
		<th>Sales Order NO</th>
		<th>Total Rs</th>
		<th>Generated On</th>
		<th>Company</th>
		<th>City</th>
		</tr>
		
		<%
		String SqlOrder="";
		 
		if("alltypes".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";	
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE b.TheGroup=1 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE b.TheGroup=2 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE b.TheGroup=3 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE b.TheGroup=4 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE b.TheGroup>=5 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
		}
		
		else if("domestic".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND b.TheGroup=1 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND b.TheGroup=2 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND b.TheGroup=3 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND b.TheGroup=4 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND b.TheGroup>=5 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
		}
		
		else if("export".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND b.TheGroup=1 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND b.TheGroup=2 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND b.TheGroup=3 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND b.TheGroup=4 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND b.TheGroup>=5 AND  a.InvoiceGenerated=0  AND a.SOCancelled=0 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
		}
		ResultSet rsOrder=st.executeQuery(SqlOrder);
		System.out.println(SqlOrder);	
		while(rsOrder.next())
			{
			
			String salesorder=rsOrder.getString("SalesOrderNo");
			String company= rsOrder.getString("CompanyName");
		%>
			<tr>
			<td><div align="right"><a href="#" onclick="viewOrder('viewOrder.jsp','<%=company%>','<%=salesorder%>')"><%=salesorder %></a></div></td>
			<td><div align="right"><%=rsOrder.getString("Total") %></div></td>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse
							(rsOrder.getString("SalesOrderDate")))%></div></td>
			<td><div align="left"><%=company%></div></td>
			<td><div align="left"><%=rsOrder.getString("city") %></div></td>
			</tr>
		<%
			}
	}

%>
</table>
<%
}
%>


<%// ********************************************************PENDING ORDERs ENDS HERE************************************************************* %>

<%
// *************************************************   FOR CANCELLED ORDER STARTs HERE  *******************************************************

if("cancelledorders".equalsIgnoreCase(reportname))
{	
if(null != request.getQueryString())
	{
		%>
		<div align="center" style="font-size: 1.5em;"><a> PENDING ORDERS  </a></div>
		<br>
		<table  border="1px"  class='sortable' >
		<tr>
		<th>Sales Order NO</th>
		<th>Total Rs</th>
		<th>Generated On</th>
		<th>Company</th>
		<th>City</th>
		</tr>
		
		<%
		String SqlOrder="";
		
		if("alltypes".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.Thegroup=1 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.Thegroup=2 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.Thegroup=3 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.Thegroup=4 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else 
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.Thegroup>=5 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
		}
		
		else if("domestic".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND a.Thegroup=1 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND a.Thegroup=2 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND a.Thegroup=3 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND a.Thegroup=4 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else 
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType='Rupees' AND a.Thegroup>=5 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
		}
		
		else if("export".equalsIgnoreCase(typesname))
		{	
			if("All".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND a.Thegroup=1 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND a.Thegroup=2 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND a.Thegroup=3 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND a.Thegroup=4 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
			else 
			SqlOrder="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) WHERE a.CurrType <> 'Rupees' AND a.Thegroup>=5 AND a.SOCancelled=1 AND  a.SalesOrderDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.SalesOrderNo, a.Total,a.SalesOrderDate,a.CompanyName, a.city   ";
		}
		System.out.println(SqlOrder);
		ResultSet rsOrder=st.executeQuery(SqlOrder);
		while(rsOrder.next())
			{
			
			String salesorder=rsOrder.getString("SalesOrderNo");
			String company= rsOrder.getString("CompanyName");
		%>
			<tr>
			<td><div align="right"><a href="#" onclick="viewOrder('viewOrder.jsp','<%= company%>','<%=salesorder%>')"><%=salesorder %></a></div></td>
			<td><div align="right"><%=rsOrder.getString("Total") %></div></td>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse
							(rsOrder.getString("SalesOrderDate")))%></div></td>
			<td><div align="left"><%=company %></div></td>
			<td><div align="left"><%=rsOrder.getString("city") %></div></td>
			</tr>
		<%
	}
} 
%>
</table>
<%
}
%>


<%// ********************************************************CANCELLED ORDER ENDS HERE************************************************************* %>

<%
// *************************************************   FOR INVOICES(ALL) STARTs HERE  *******************************************************

if("allinvoices".equalsIgnoreCase(reportname))
{
if(null != request.getQueryString())
	{
		%>
		<div align="center" style="font-size: 1.5em;"><a> Invoices  </a></div>
		<br>
		<table  border="1px"  class='sortable' >
		<tr>
		<th>Sales Invoice Ref NO</th>
		<th>Total Rs</th>
		<th>Generated On</th>
		<th>Company</th>
		<th>City</th>
		</tr>
		<%
		String SqlInvoice="";
	
		if("alltypes".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.TheGroup=1 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))	
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.TheGroup=2 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.TheGroup=3 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.TheGroup=4 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.TheGroup>=5 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
		}
		
		else if("domestic".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE  a.CurrType='Rupees' AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.TheGroup=1 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))	
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.TheGroup=2 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.TheGroup=3 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.TheGroup=4 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.TheGroup>=5 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
		}
		
		else if("export".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE  a.CurrType <> 'Rupees' AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.TheGroup=1 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))	
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.TheGroup=2 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.TheGroup=3 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.TheGroup=4 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.TheGroup>=5 AND  a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
		}
		ResultSet rsInvoice=st.executeQuery(SqlInvoice);
		System.out.println(SqlInvoice);
		while(rsInvoice.next())
		{
			String salesinvoiceno=rsInvoice.getString("invoiceRefNo");
			String company=rsInvoice.getString("CompanyName");
			sum=rsInvoice.getInt("Total");
			System.out.println("SUM IS**************   "+sum );
			total=total+sum;
			System.out.println("Total is    "+total);
		%>
			<tr>
			<td><div align="right"><a href="#" onclick="viewInvoices('transactionDetails.jsp','<%=company %>','<%= salesinvoiceno%>')"><%=salesinvoiceno %></a></div></td>
			<td ><div align="right"><%=rsInvoice.getString("Total") %></div></td>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse
							(rsInvoice.getString("InvoiceDate")))%></div></td>
			<td><div align="left"><%=company%></div></td>
			<td><div align="left"><%=rsInvoice.getString("city") %></div></td>
			</tr>
			
		<%
	}
}

%>


<tr>
			<td colspan="5" align="left">Total : <%=total %>   Rs.</td>
			
			</tr>
</table>
<%
}
%>


<%// ******************************************************** INVOICES(All) ENDS HERE************************************************************* %>

<%
// *************************************************   FOR CANCELLED INVOICES STARTs HERE  *******************************************************

if("cancelledinvoices".equalsIgnoreCase(reportname))
{
if(null != request.getQueryString())
	{
		%>
		<div align="center" style="font-size: 1.5em;"><a>  Cancelled Invoices  </a></div>
		<br>
		<table  border="1px"  class='sortable' >
		<tr>
		<th>Sales Invoice REF NO</th>
		<th>Total Rs</th>
		<th>Generated On</th>
		<th>Company</th>
		<th>City</th>
		</tr>
		<%
		String SqlInvoice="";
		
		if("alltypes".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.InvoiceCancelled=1 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.InvoiceCancelled=1 AND a.TheGroup=1 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.InvoiceCancelled=1 AND a.TheGroup=2 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.InvoiceCancelled=1 AND a.TheGroup=3 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.InvoiceCancelled=1 AND a.TheGroup=4 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.InvoiceCancelled=1 AND a.TheGroup>=5 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
		}
		
		else if("domestic".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.InvoiceCancelled=1 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.InvoiceCancelled=1 AND a.TheGroup=1 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.InvoiceCancelled=1 AND a.TheGroup=2 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.InvoiceCancelled=1 AND a.TheGroup=3 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.InvoiceCancelled=1 AND a.TheGroup=4 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType='Rupees' AND a.InvoiceCancelled=1 AND a.TheGroup>=5 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
		}
		
		else if("export".equalsIgnoreCase(typesname))
		{
			if("All".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.InvoiceCancelled=1 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Compressor".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.InvoiceCancelled=1 AND a.TheGroup=1 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DGSet".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.InvoiceCancelled=1 AND a.TheGroup=2 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("DigitalEquipment".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.InvoiceCancelled=1 AND a.TheGroup=3 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else if("Endoscope".equalsIgnoreCase(selectedName))
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.InvoiceCancelled=1 AND a.TheGroup=4 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
			else
			SqlInvoice="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) WHERE a.CurrType <> 'Rupees' AND a.InvoiceCancelled=1 AND a.TheGroup>=5 AND a.InvoiceDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.InvoiceNo, a.Total,a.InvoiceDate,a.CompanyName, a.city   ";
		}	
		System.out.println(SqlInvoice);	
		ResultSet rsInvoice=st.executeQuery(SqlInvoice);
		while(rsInvoice.next())
			{
			
			String salesinvoiceno=rsInvoice.getString("invoiceRefNo");
			String company=rsInvoice.getString("CompanyName");
		%>
			<tr>
			<td><div align="right"><a href="#" onclick="viewInvoices('transactionDetails.jsp','<%= company%>','<%=salesinvoiceno%>')"><%=salesinvoiceno %></a></div></td>
			<td><div align="right"><%=rsInvoice.getString("Total") %></div></td>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse
							(rsInvoice.getString("InvoiceDate")))%></div></td>
			<td><div align="left"><%=company %></div></td>
			<td><div align="left"><%=rsInvoice.getString("city") %></div></td>
			</tr>
		<%
	}
}	
%>

 </table>
<%
}
%>


<%// ******************************************************** CANCELLED INVOICES ENDS HERE************************************************************* %>

</div>
</br>
</br>
</br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
	</form>
	</body>
	</html>
</jsp:useBean>