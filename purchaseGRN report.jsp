<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%@page import="java.util.Date"%>

 
<script language="JavaScript1.2">

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
	
	String id=request.getParameter("id");
	System.out.println("PARAMETER COMING IS     "+id);
	
%>

<body ONKEYDOWN="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';}" >
	<div
		style="font-size: 1.6em; text-align: center; margin-top: 0.5em; margin-bottom: 0.5em;">
	<a>PUrchase GRN Report</a></div>

<form name="data" action="" method="get">
	<input type="hidden" name="customerCode" value=""/>
	<div align="center">
	<table border="0" width="100%">
	<tr> 
	
	<td  align="right" width="20%">
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
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new java.util.Date()%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('purchase','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
		</tr></table>
	</td>
	
	</tr>
	
	</table></div>
	</form>
	<br>
	
<%   
	if(null != request.getQueryString())
	{
%>  		
<form name="purchaseenq" method="post" >

<%
String exportFileName="PurchaseGRN_det.xls";   // GIVE YOUR REPORT NAME
%>
<div id='purchase'>

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   

	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
	<table align="center" class='sortable'> 
	<tr>
	<th>Sr No</th>
	<th>GRN No</th>
	<th>GRN Date</th>
	<th>PO No</th>
	<th>Supplier</th>
	</tr>
<%	
	String sqlgrn="",supcode="";
	
	if(null != request.getParameter("isCheckedAll"))
		sqlgrn="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn_items as b ON(a.GRNno=b.GRNno) WHERE a.	GRNDate BETWEEN '"+fromDate+"' and '"+toDate+"' GROUP BY  a.GRNDate, a.GRNno, a.PONo";
	else
		sqlgrn="SELECT a.PONo, a.GRNno, a.GRNDate,a.SupplierCode FROM "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn_items AS b ON ( a.GRNno = b.GRNno ) WHERE a.SupplierCode='"+request.getParameter("customerCode")+"' AND a.GRNDate BETWEEN '"+fromDate+"' AND '"+toDate+"' GROUP BY a.GRNDate, a.GRNno, a.PONo ";	
	
	System.out.println(sqlgrn);			
	ResultSet rsGrn=st.executeQuery(sqlgrn);
	int i=1;
	while(rsGrn.next()){
		
	supcode=rsGrn.getString("SupplierCode");	
	String sqlSupplier="select SupplierName from "+session.getAttribute("CompanyMasterID").toString()+"supplierdet where SupplierCode='"+supcode+"'";
	ResultSet rsSup=st1.executeQuery(sqlSupplier);
	rsSup.next();
	String supplier=rsSup.getString("Suppliername");
%>  
	<tr>
		<td><div align="right"><%=i++ %></div></td>
		<td><div align="right"><a href="#" onclick="popUp('purchasegrndetails.jsp','<%=supcode%>','<%=rsGrn.getString("PONo")%>','<%=rsGrn.getString("GRNno")%>')"/> <%=rsGrn.getString("GRNno")%></div></td>
		<td><div align="right"><%=new SimpleDateFormat(
					"dd-MMM-yyyy")
					.format(new SimpleDateFormat(
							"yyyy-MM-dd")
							.parse(rsGrn.getString("GRNDate")))%></div></td>
		<td><div align="right"><%=rsGrn.getString("PONo")%></div></td>
		<td><div align="left"><%=supplier%></div></td>
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