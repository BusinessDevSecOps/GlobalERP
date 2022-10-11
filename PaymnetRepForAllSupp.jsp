<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">



	<script src="dropdown.js" type="text/javascript"></script>
		<script src="ledgerDetails.js" type="text/javascript"></script>


	<script language="JavaScript1.2">
	function getSupplier()
	{
		document.getElementById('companyList').style.visibility = 'visible';
			var company=document.supplier.companyNames.value;
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

	function showSelectedSuppliers(suppliercode,suppliername)
	{
		//alert(suppliercode);
		//alert(suppliername);
		document.supplier.companyNames.value=suppliername;
		document.getElementById('companyList').style.height = '10px'; 
		document.getElementById('companyList').style.visibility = 'hidden';
	}


	function gotoPaymentEntry(webadd)
	{ 
 		
		var company=document.paymentDetails1.suppliername.value;
			alert(company);
			var companyPerson=document.paymentDetails1.companyPerson.value;
			var companyPhone=document.paymentDetails1.companyPhone.value;
			var companyEmail=document.paymentDetails1.companyEmail.value;
			var companyCity=document.paymentDetails1.companyCity.value;
			var companyProduct=document.paymentDetails1.companyProduct.value;
		
			window.location=webadd+'?companyName='+company+'&companyPerson='+companyPerson+'&companyPhone='+companyPhone+'&companyEmail='+companyEmail+'&companyCity='+companyCity+'&companyProduct='+companyProduct;
			
		//window.location=webadd+'?companyName='+company;
	}


	
	</script>


	 
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
	String exportFileName="ledgerdetails.xls";
		Connection conn = null;
			Statement st = null, st1 = null, st3 = null, st4 = null;
			Statement st2 = null;
			String selectedName;
			String FollowUpType="";
			Format format=new SimpleDateFormat("dd-MMM-yyyy");
			Format parse=new SimpleDateFormat("yyyy-MM-dd");
			String fromDate="",toDate="",fromDateCal="",toDateCal="";
			int i=1;
			String companyName="",phone="",contact="",email="",product="",city="";
			String sqlPayament="";
	%>
	<%
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(today30);
	toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	if (!(null == request.getParameter("fromdate"))) {
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromDateCal=request.getParameter("fromdate");
	}
	if (!(null == request.getParameter("todate"))){
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		toDateCal=request.getParameter("todate");
	}
	if (!(null == request.getParameter("companyName"))) 
	{
		companyName=request.getParameter("companyName").replace("~","&");
		phone=request.getParameter("companyPhone");
		email=request.getParameter("companyEmail");
		contact=request.getParameter("companyPerson");
		city=request.getParameter("companyCity");
		product=request.getParameter("companyProduct");
	}	
		try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
		}catch(Exception e)
		{}
			if (null == request.getParameter("repName"))
				selectedName = "All";
			else
				selectedName = request.getParameter("repName");
	%>
 
	<div
		style="font-size: 1.8em; text-align: center;"><a> 
		Payment A/c's Details</a>
 </div>
 
 <form name="supplier" action="" method="get">
 
<table width="100%" style="border:thin solid black;">
		<tr>
		
												<td align="right" valign="top">
		<input type="checkbox" id="checkAll" name="checkAll" checked="checked" onchange="showHideAll();" value="checkAll"/></td><td >All &nbsp;&nbsp;&nbsp;</td>
		 <td>
		
			<td align="left" valign="top" width="200">
			<div id="companyNames">Company Name: 
			<input type="text" name="companyNames" id="search-text"  value='' onkeyup="getSupplier()" />
			</div>
			</td>
			<td align="left" style="width: 250px;">
			<div id='companyList'>
			<div style="height: 10px; width: 400px; overflow: auto;"></div>
			</div>
			</td>
 			<td align="left" valign="top">
			<table><tr><td> 
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
			</td>
			<td>
			&nbsp;<b>To </b>&nbsp;</td><td>
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
			</script></td>
			<td>
	 		<input type="submit" name="submit" id="submit" style="border: outset;"	value="GO"></input></td>
			<td align="right"><font size="1">&nbsp;&nbsp;&nbsp;<%=new java.util.Date()%></font>
			 <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('tabS', 'tableHTML');">
			<img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
			</a>
			<!-- <a href="#" onclick="javascript:window.open('excelLedgerDetails.jsp?company=<%=companyName %>&companyPhone=<%=phone %>&companyEmail=<%=email %>&companyPerson=<%=email %>&companyCity=<%=city %>&companyProduct=<%=product %>&fromDate=<%=fromDate %>&toDate=<%=toDate %>');" title="Export To Excel">

				<img src="images/excel.jpg"	width="15px" height="15px"></img></a>&nbsp;&nbsp;&nbsp;
				 -->
			 <a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 </td>
			 </tr>
			 
	         </table>
				</td>
		</tr>
	</table>
 
 </form>
 <br>
 <form name='paymentDetails1' action="" method="get" >
 
 <input type="hidden" name="suppliername" value="<%=request.getParameter("companyNames") %>"/>

 
 
<%
if(null != request.getQueryString() )
{
	
	boolean isCheckedAll=false;
	isCheckedAll=(request.getParameter("checkAll")!=null ? true : false);
%>

<table class="sortable">


<tr>
<th>Sr NO</th>
<th>Supplier</th>
<th>Invoice No</th>
<th>Invoice Date</th>
<th>Invoice Value</th>
<th>Amount Paid</th>
<th>Balance</th>
<th>Remarks</th>
<th>Payment Date</th>
<th>Currency</th>
</tr>
<%
String sqlCode="Select * from "+session.getAttribute("CompanyMasterID").toString()+"supplierdet where SupplierName='"+request.getParameter("companyNames")+"' ";
System.out.println(sqlCode);
ResultSet rsCod=st2.executeQuery(sqlCode);
rsCod.next();
String code=rsCod.getString("SupplierCode");
%>

<input type="hidden" name="companyPerson" value="<%=rsCod.getString("ContactPerson")%>"/>
<input type="hidden" name="companyPhone" value="<%=rsCod.getString("Phone")%>"/>
<input type="hidden" name="companyEmail" value="<%=rsCod.getString("EMail")%>"/>
<input type="hidden" name="companyCity" value="<%=rsCod.getString("City")%>"/>
<input type="hidden" name="companyProduct" value="<%=rsCod.getString("SupProduct")%>"/>

<%

if(!isCheckedAll)
 sqlPayament="Select * from "+session.getAttribute("CompanyMasterID").toString()+"suppaymentsettleddetails as a INNER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on(a.SupplierCode=b.SupplierCode) where  b.SupplierCode='"+code+"' and InvoiceDate between '"+fromDate+"' and '"+toDate+"' ";
else
	 sqlPayament="Select * from "+session.getAttribute("CompanyMasterID").toString()+"suppaymentsettleddetails as a INNER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on(a.SupplierCode=b.SupplierCode) where InvoiceDate between '"+fromDate+"' and '"+toDate+"' ";
System.out.println(sqlPayament);
ResultSet rsPay=st1.executeQuery(sqlPayament);
while(rsPay.next())
{	
%>
<tr>
<td><div align="right"><%=i++%></div></td>
<td><div align="left"><%=rsPay.getString("SupplierName")%></td>
<td><div align="right"><%=rsPay.getString("InvoiceNo")%></div></td>
<td><div align="right"><%=rsPay.getString("InvoiceDate")%></div></td>

<td><div align="right"><%=rsPay.getString("InvoiceValue")%></div></td>
<td><div align="right"><%=rsPay.getString("AmountPaid")%></div></td>
<td><div align="right"><%=rsPay.getString("Balance")%></div></td>
<td><div align="left"><%=rsPay.getString("PaymentDetails")%></div></td>
<td><div align="right"><%=rsPay.getString("PaymentDate")%></div></td>
<td><div align="left"><%=rsPay.getString("CurrType")%></div></td>
</tr>

<%} %>
</table>

<%} %>


</form>
 
 
 
 
 
 	<br><br> <br><br> <br><br> <br><br>
	<br><br> <br><br> <br><br> <br><br>
		<br><br> <br><br> <br><br> <br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
	
	</body>
	</html>
</jsp:useBean>