<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%@page import="java.util.Date"%>

 
<script language="JavaScript1.2">

function showSelectedSuppliers(customerCode,companyName){
	document.data.companyNames.value=companyName;
	document.data.customerCode.value=customerCode;
	document.getElementById('companyList').style.visibility = 'hidden';
	document.data.isCheckedAll.checked=false;
}

function hideCompanyName(){
	document.data.companyNames.value='';
}

function getCompanies()
{
	//document.getElementById("companyList").style.display='block';
	var company=document.data.companyNames.value;
	document.getElementById('companyList').style.visibility = 'visible';

	if(company=="")
	{
		document.getElementById('companyList').style.visibility = 'hidden';
		
	}
	else
	{
		document.getElementById('companyList').style.visibility = 'visible';
		company=company.replace(".", "");
		company=company.replace(",", "");
		company=company.replace("$", "");
		company=company.replace("#", "");
		company=company.replace("?", "");
		company=company.replace("-", "");
		company=company.replace("_", "");
		company=company.replace(" ", "");
		company=company.replace("(", "");
		company=company.replace(")", "");
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
	}//end of else 
	
}
function popUp(Address,supplierCode,PurchaseQuoNo,TWRefNo)
{ 
    window.open(Address+'?supplierCode='+supplierCode+'&PurchaseQuoNo='+PurchaseQuoNo+'&TWRefNo='+TWRefNo);
}

</script>
                                 	                                                                                                              
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
	Connection conn = null;
	Statement st = null, st1 = null, st3 = null, st4 = null,st5=null;
	Statement st2 = null;
    String selectedName;
	String FollowUpType="",status="";
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
	if (!(null == request.getParameter("todate"))){
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		toDateCal=request.getParameter("todate");
	}
	
	if (null == request.getParameter("customer"))
	selectedName = "All";
	else
	selectedName = request.getParameter("customer");
 		
	try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st1 = conn.createStatement();

	if (null == request.getParameter("customer"))
	selectedName = "All";
	else
	selectedName = request.getParameter("customer");

	String code=request.getParameter("customerCode");
	System.out.println("><<><><><><><><><      "+code);
	
	String customerCode="";
%>

<body ONKEYDOWN="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';}" >
	<div
		style="font-size: 1.6em; text-align: center; margin-top: 0.5em; margin-bottom: 0.5em;">
	<a>Generate Purchase Order from Purchase Quotation</a></div>

<form name="data" action="" method="get">
	<input type="hidden" name="customerCode" id="customerCode" value=""/>
	<div align="center">
	<table border="0" width="100%">
	<tr><td></td><td></td><td></td>
<td></td><td></td><td colspan="3">
			<table align="right"><tr>	
				<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('purchase','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
		</tr></table>
	</td></tr>
	
	<tr> 
	
	<td  align="right" >
	<b>Check All</b>&nbsp; 
	
	 </td>
	 <td>
	 <input type="checkbox" name="isCheckedAll" value="checkedAll" checked="checked" onclick="hideCompanyName();" />
 	 </td>
	 <td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <b>Or Enter Supplier :</b></td>
	 <td><input type="text" name="companyNames" id="search-text" style="width:230px;" autocomplete="off"  value=""  onkeyup="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';} else { getCompanies(); }" /> 
	 &nbsp;&nbsp;&nbsp;<br>
	 <div style="position: absolute;">
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
	</tr>
	
	</table></div>
	</form>
	<br>
	
<%   
	if(null != request.getQueryString())
	{
%>  	<form name="purchaseord" method="post" >
<%
String exportFileName="PurchaseOrder.xls";   // GIVE YOUR REPORT NAME
%>
<div id='purchase'>
<input type="hidden" id="tableHTML" name="tableHTML" value="" />   
<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 

<div id="tabS" style="visibility: visible;">	
	<table align="center" class='sortable'> 
	<tr>
		<th>Sr No</th>
		<th>Purchase Quo No</th>
		<th>Purchase Quo Date</th>
		<th>TWRefNo</th>
		<th>Supplier</th>
	</tr>
<%	
	String sqlEnq="",supcode="";
	
	if(null != request.getParameter("isCheckedAll"))
	sqlEnq="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"purchasequo as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"pquo_items as b ON(a.PurQuoNo =b.PQNo) WHERE a.POGenerated=0 and a.PurQuoDate BETWEEN '"+fromDate+"' and '"+toDate+"' GROUP BY a.PurQuoNo, a.PurQuoDate, a.TWRefNo ";
	else
	sqlEnq="SELECT  a.PurQuoNo ,a.PurQuoDate,a.TWRefNo,a.SupplierCode FROM "+session.getAttribute("CompanyMasterID").toString()+"purchasequo AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"pquo_items AS b ON ( a.PurQuoNo = b.PQNo) WHERE a.SupplierCode='"+code+"' AND a.POGenerated =0 AND a.PurQuoDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.PurQuoNo, a.PurQuoDate, a.TWRefNo";	
	
	System.out.println(sqlEnq);			
	ResultSet rsEnq=st.executeQuery(sqlEnq);
	int i=1;
	while(rsEnq.next()){
	 
	supcode=rsEnq.getString("SupplierCode");	
	String sqlSup="select SupplierName from "+session.getAttribute("CompanyMasterID").toString()+"supplierdet where SupplierCode='"+supcode+"'";
	ResultSet rs=st1.executeQuery(sqlSup);
	rs.next();
	String supplier=rs.getString("SupplierName");
%>  
	<tr>
		<td><%=i++ %></td>
		<td><a href="#" onclick="popUp('showOrderDet.jsp','<%= rsEnq.getString("Suppliercode")%>','<%= rsEnq.getString("PurQuoNo")%>','<%=rsEnq.getString("TWRefNo")%>')"/> <%=rsEnq.getString("PurQuoNo")%></td>
		<td><%=new SimpleDateFormat(
					"dd-MMM-yyyy")
					.format(new SimpleDateFormat(
							"yyyy-MM-dd")
							.parse(rsEnq.getString("PurQuoDate")))%></td>
		<td><%=rsEnq.getString("TWRefNo")%></td>
		<td><%=supplier%></td>
	</tr>
<%} 
	}
	} catch(Exception e)
	{
	e.printStackTrace();
	}
%>  
	</table>
	</div>
	</div>
	</form>
	</br>
	
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