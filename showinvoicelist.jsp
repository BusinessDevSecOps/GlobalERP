<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ include file="header.jsp"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.TimeZone"%><jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">

<script type="text/javascript">

function showVisitingCardDetails(companyName,customerCode){
	document.data.companyNames.value=companyName;
	document.getElementById("companyList").style.display='none';
	document.data.isCheckedAll.checked=false;
}

function hideCompanyName(){
	document.data.companyNames.value='';
}

function getCompanies(type)
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
	var queryString = "?company=" +company+"&type="+type;
	ajaxRequest.open("GET", "GenericAjaxSearch.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
}


function openInvoice(Address,InvoiceRefNo,Invoiceno,condition,status,name)
 {//alert("ssss"+status+"  "+name+""); 
    
	if(status=="Closed")
	{alert("This Invoice is closed by "+name);	
	}	
	window.open(Address+'?InvoiceRefNo='+InvoiceRefNo+'&Invoiceno='+Invoiceno+'&condition='+condition+" ");
	
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
         </head>
	                	                                                                                                              
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
	Connection conn = null;
	Statement st = null, st1 = null, st3 = null, st4 = null,st5=null;
	Statement st2 = null;
	String FollowUpType="",status="",sqlGroup="";
	Format format=new SimpleDateFormat("dd-MMM-yyyy");
	Format parse=new SimpleDateFormat("yyyy-MM-dd");
	String fromDate="",toDate="",fromDateCal="",toDateCal="",CompanyName="";
	
	String id=request.getParameter("id");
	//String idd=request.getParameter("idd");
	System.out.println("ID CMING IS   ++++++++++++++          "+id);
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
		fromDate+=" 00:00:00";
	}
	if (!(null == request.getParameter("todate"))){
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		toDateCal=request.getParameter("todate");
		toDate+=" 23:59:59";
	}
	
try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st1 = conn.createStatement();
	st2 = conn.createStatement();
	%>

	<body ONKEYDOWN="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';}" >

		<div
		style="font-size: 1.6em; text-align: center; margin-top: 0.5em; margin-bottom: 0.5em;">
	<a><%=id %> Invoice</a></div>
	
	<form name="data" action="" method="get">
    <input type="hidden" name="id" value="<%=id %>">
	<div align="center">
	<table border="0">
	<tr> 

	<td  align="right" width="20%">
	<b>Check All</b>&nbsp; 
	
	</td>
	<td>
	<input type="checkbox" name="isCheckedAll" value="checkedAll" checked="checked" onclick="hideCompanyName();" />
	<input type="hidden" name="isdisplay" value="true"/>
	</td>
	<td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <b>Or Enter Company :</b></td>
	<td><input type="text" name="companyNames" id="search-text" style="width:230px;" autocomplete="off"  value=""  onkeyup="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';} else { getCompanies('quotation'); }" /> 
	&nbsp;&nbsp;&nbsp;<br>
	<div style="position: absolute;"  >
	  <table><tr><td>
		
		</td></tr>
		<tr><td>
			<div id='companyList'>
			</div>
		</td></tr>
	  </table>
	</div>
</td>

	<td align="left">
	<b> </b>&nbsp;&nbsp;
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
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('purchase','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
		</tr></table>
	</td>
	</tr>

	</table></div>
	</form>
	<br></br>
	<form name="purchaseenq" method="post">
	<%
String exportFileName="Invoice_List.xls";   // GIVE YOUR REPORT NAME
%>

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   
	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
	<div> </div>
	
<%
	if(null != request.getParameter("isdisplay"))
{
	%>
	
	<div id='purchase'>
		<table  border="1px" class="sortable"> 
		<tr>
		<th>Sr no</th>
		<th>Invoice ref no</th>
		<th>Invoice DateTime</th>
		<th>Total</th>
		<th>GrandTotal</th>
		<th>Currency</th>
		<th>group</th>
		<th>Status</th>
		<th>Company Name</th>
		<th>Sign</th>
		</tr>
	<%
		String sql="";
		if(id.equalsIgnoreCase("close"))
		{
		if(null != request.getParameter("isCheckedAll"))
		sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a "+
			" LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) "+
			" WHERE a.InvoiceCancelled=0  AND a.InvoiceDate BETWEEN '"+fromDate+"' and '"+toDate+"' "+
			" GROUP BY a.invoiceRefNo, a.InvoiceDate, a.CompanyName, a.TWEmpName,a.InvoiceNo Order By a.InvoiceDate Desc";
		else
		sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items AS b "+
			" ON ( a.InvoiceNo = b.InvoiceNo ) "+
			" WHERE a.CompanyName in ('"+request.getParameter("companyNames")+"') "+
			" AND a.InvoiceCancelled =0 AND a.InvoiceDate BETWEEN '"+fromDate+"'AND '"+toDate+"' "+
			" GROUP BY a.invoiceRefNo, a.InvoiceDate, a.CompanyName, a.TWEmpName,a.InvoiceNo Order By a.InvoiceDate Desc";	
		}
		else if(id.equalsIgnoreCase("revise") || id.equalsIgnoreCase("View") || id.equalsIgnoreCase("null"))
		{
	
		if(null != request.getParameter("isCheckedAll"))
		sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet as a "+
			" LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items as b ON(a.InvoiceNo=b.InvoiceNo) "+
			" WHERE  a.InvoiceDate BETWEEN '"+fromDate+"' and '"+toDate+"' "+
			" GROUP BY a.invoiceRefNo, a.InvoiceDate, a.CompanyName, a.TWEmpName,a.InvoiceNo Order By a.InvoiceDate Desc";
		else
		sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"invoicedet AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items AS b "+
			" ON ( a.InvoiceNo = b.InvoiceNo ) "+
			" WHERE a.CompanyName in ('"+request.getParameter("companyNames")+"') "+
			" AND a.InvoiceDate BETWEEN '"+fromDate+"'AND '"+toDate+"' "+
			" GROUP BY a.invoiceRefNo, a.InvoiceDate, a.CompanyName, a.TWEmpName,a.InvoiceNo Order By a.InvoiceDate Desc";	
		}
		
		else if(id.equalsIgnoreCase("proformaclose") || id.equalsIgnoreCase("proformarevise"))
		{
			
			if(null != request.getParameter("isCheckedAll"))
				sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"performainvoicedet as a "+
					" LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"performainvoice_items as b ON(a.InvoiceNo=b.InvoiceNo) "+
					" WHERE a.InvoiceCancelled=0  AND a.InvoiceDate BETWEEN '"+fromDate+"' and '"+toDate+"' "+
					" GROUP BY a.invoiceRefNo, a.InvoiceDate, a.CompanyName, a.TWEmpName,a.InvoiceNo Order By a.InvoiceDate Desc";
				else
				sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"performainvoicedet AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"performainvoice_items AS b "+
					" ON ( a.InvoiceNo = b.InvoiceNo ) "+
					" WHERE a.CompanyName in ('"+request.getParameter("companyNames")+"') "+
					" AND a.InvoiceCancelled =0 AND a.InvoiceDate BETWEEN '"+fromDate+"'AND '"+toDate+"' "+
					" GROUP BY a.invoiceRefNo, a.InvoiceDate, a.CompanyName, a.TWEmpName,a.InvoiceNo Order By a.InvoiceDate Desc";	
		}	
		
			
		System.out.println("QUERY EXECUTED"+sql);			
		ResultSet rs=st.executeQuery(sql);
		int i=1;
		while(rs.next())
		{
			//Find the value of status 
			if(rs.getInt("InvoiceCancelled")==0)
			{status="Invoiced";
			}
			else
			{	status="Closed";
			}//else end
			
			 sqlGroup="SELECT TheGroupName FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster where TheGroupCode='"+rs.getString("TheGroup")+"' ";
				ResultSet rsGroup=st2.executeQuery(sqlGroup);
				while(rsGroup.next())
				{
			
		%>
			<tr>
			<td><%=i++ %></td>

		<% if(id.equalsIgnoreCase("close") || id.equalsIgnoreCase("revise") || id.equalsIgnoreCase("View")){%>	
			<td><div align="right"><a href="#" onclick="openInvoice('viewInvoice.jsp','<%=rs.getString("invoiceRefNo")%>','<%=rs.getString("InvoiceNo")%>','<%=id%>','<%=status%>','<%=rs.getString("TWEmpName")%>')"> <%=rs.getString("invoiceRefNo")%></a></div></td>
		
		<%}else if(id.equalsIgnoreCase("proformaclose") || id.equalsIgnoreCase("proformarevise")){ %>
		<td><div align="right"><a href="#" onclick="openInvoice('detailForProInvoice.jsp','<%=rs.getString("invoiceRefNo")%>','<%=rs.getString("InvoiceNo")%>','<%=id%>','<%=status%>','<%=rs.getString("TWEmpName")%>')"> <%=rs.getString("invoiceRefNo")%></a></div></td>
		
		<%} %>
			<td sorttable_customkey="20080211131900"><div align="right"><%=new SimpleDateFormat(
							"dd-MMM-yyyy")
							.format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("InvoiceDate")))+" "%></div></td>
			<td><div align="right"><%=rs.getString("Total")%></div></td>
			<td><div align="right"><%=rs.getString("GrandTotal")%></div></td>
			<td><div align="left"><%=rs.getString("currType")%></div></td>
			<td><div align="left"><%=rsGroup.getString("TheGroupName")%></div></td>
			<td><div align="left"><%=status%></div></td>
			<td><div align="left"><%=rs.getString("companyName")%></div></td>
			<td><div align="left"><%=rs.getString("TWEmpName")%></div></td>
			</tr>
	<%
		}}
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
	</table>
</div>
 <br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
<!-- end #footer -->
</body>
</html>

</jsp:useBean>