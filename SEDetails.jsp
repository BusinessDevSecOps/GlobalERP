<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="conn.jsp"%><%@page import="java.util.Date"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>


	<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
	<style>
</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	
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
	<script type="text/javascript">

	function closeEnq()
	{
		//alert("Do YOU want to close This Enquiry??");
		var agree=confirm("Pls Enter Reason For Closing This  Enquiry");
		if (agree)
		{
		document.getElementById("header").style.visibility="visible";
		document.getElementById("cancellingreason").style.visibility="visible";
		document.getElementById("submitbutton").style.visibility="visible";
		return true ;
		}
		else
		return false ;
	}
	
	
	function redirect(webadd,senqrefno)
	{
	
		window.open(webadd+'?senqrefno='+senqrefno,'jav');
	}

	function redirectforpdf(webadd,senqrefno)
	{
	
		window.open(webadd+'?senqrefno='+senqrefno,'jav');
	}
	</script>
	</head>
	<body>

	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
			Statement st = null,st1=null,st2=null;
			boolean isInvoiceSelected = false;
			int count=0;
			int d=0;
			Date today = new Date();
			String enqDate=new SimpleDateFormat("dd-MMM-yyyy").format(today);
			String date=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(enqDate));
			
			Date mothafter=new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(today);
			cal.add(Calendar.DAY_OF_MONTH,+30);
			Date MonthAsDate=cal.getTime();
			String monthafter=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(MonthAsDate);
			String monthafterInMMM=new SimpleDateFormat("dd-MMM-yyyy hh:mm;ss").format(MonthAsDate);
			System.out.println(monthafterInMMM+"())))))))))))))))))))))  ");
			
			Date today1 = new Date();
			String fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today1);
			
			String type=request.getParameter("condition");
			System.out.println("TYPE IS    "+type);
			
			String salesEnqRefNumber = request
					.getParameter("transactionId");
			String sqlDisplayDesc=" ",totalAmount="",totalAmountInWords="",termsconditions="",salesQuoNumber="",status="",statusTD="",fromdate="";
			
			System.out.println("After Type"+salesEnqRefNumber);
			
			try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
			} catch (Exception e) {
			}
	%>
    
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.4em; margin-bottom: 0.4em; height: 3px; background-color: #339CCB">
	</div>
	
	
	<div align="center" id=" " style="font-size: 1.5em;">Sales Enquiry : <a><%=request.getParameter("transactionId")%></a>
 </a></div>
	
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.4em; margin-bottom: 0.6em; height: 3px; background-color: #339CCB">
	</div>
		<div>&nbsp;</div>
		
		
<%
if(type.contains("null") || type.contains("View") )
{
%>		
<%
	String salesEnqNumber="";
	String sqlInvoice = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det WHERE SalesEnqRefNo = '"
					+ salesEnqRefNumber + "' ";
	ResultSet rsTransaction = st.executeQuery(sqlInvoice);
	if (rsTransaction.next()) 
	{
				String dueDate = "NA";
				try {
					dueDate = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
							.format(new SimpleDateFormat(
									"yyyy-MM-dd HH:mm:ss")
									.parse(rsTransaction
											.getString("SalesEnqDueDate")));
				} catch (Exception e) {
				}
				salesEnqNumber=rsTransaction.getString("SalesEnqNo");
%>

	<table bgcolor="#C6DEFF" width="100%" cellpadding="3" cellspacing="3">
		<tr>
			<td><b>Enq No</b></td>
			<td style="width: 200px;"><label><%=rsTransaction.getString("SalesEnqNo")%></label>
			</td>
			<td><b>Enq Date</b></td>
			<td><label><%=rsTransaction.getString("SalesEnqDate")%></label>
			</td>
		</tr>

		<tr>
			<td><b>Customer Name</b></td>
			<td><label><%=rsTransaction.getString("CompanyName")%></label>
			</td>
			<td><b>Contact</b></td>
			<td><label><%=rsTransaction.getString("ContactPerson")%></label>
			</td>
		</tr>
		<tr>
			<td><b>Ref No</b></td>
			<td><label><%=rsTransaction.getString("CustRefNo")%></label></td>
			<td><b>Address</b></td>
			<td><label><%=rsTransaction.getString("Address") + " , "
							+ rsTransaction.getString("city") + " , "
							+ rsTransaction.getString("zip") + " , "
							+ rsTransaction.getString("state") + " , "
							+ rsTransaction.getString("country")%></label>
			</td>
		</tr>
		<tr>
			<td><b>Phone</b></td>
			<td><label><%=rsTransaction.getString("Phone")%></label></td>
			<td><b> Fax</b></td>
			<td><label><%=rsTransaction.getString("fax")%></label></td>
		</tr>
			
		<tr>	
			<td><b>Entered By</b></td>
			<td><label><%=rsTransaction.getString("TWEmpName")%></label></td>
			<td><b> Due Date</b></td>
			<td><input type="hidden" name="duedate" value="<%=dueDate%>"/><label><%=dueDate%></label></td>
		</tr>
		
		<tr>
			<td><b>Status</b></td>
			<td><label><%=(rsTransaction.getInt("SalesEnqClosed") == 0 ? "Open"
											: "Closed")%></label>
			</td>
			
			<td><b>Customer Remarks</b></td>
			<td><label><%=rsTransaction.getString("CustRemarks")%></label></td>

		</tr>
	</table>

	<div align="center"
		style="font-size: 1.5em; margin-top: 0.6em; margin-bottom: 0.4em; height: 3px; background-color: #339CCB">
	</div>
		  
   
	<table class="sortable">
		<tr>
		<th>Sr. No</th>
			<th>Desc</th>
			<th>Part No </th>
			<th>Make</th>
			<th>Model</th>
			<th>Group</th>
			<th>Supplier</th>
			<th>Landed Price</th>
			<th>Selling Price</th>
			<th>Price Entered On</th>
			<th>Stock</th>
 
		</tr>
	<%
	int i=1;
		String sqlSalesDet = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster as b ON (a.TheGroup=b.TheGroupCode)  WHERE a.SalesEnqNo = '"
						+ salesEnqNumber + "'  ";
	
				ResultSet rsSalesDet = st.executeQuery(sqlSalesDet);
				while (rsSalesDet.next()) {
						String makeCode = "", itemCode = "", groupCode = "", quantity, makeName = "",groupName="";
						makeCode = rsSalesDet.getString("make");
						itemCode = rsSalesDet.getString("itemcode");
						groupCode = rsSalesDet.getString("TheGroup");
						quantity = rsSalesDet.getString("quantity");
	
						String tableToBeAccessed = rsSalesDet.getString(
								"TheTableToBeAccessed").toLowerCase();
	
						String sqlItemDetails = "SELECT * FROM "
								+ tableToBeAccessed + " AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b "+
								" ON (a.supplierCode=b.supplierCode) where a.ItemCode='"
								+ itemCode + "' ";
						
						System.out.println(sqlItemDetails);
						System.out.println(sqlItemDetails);
						
						ResultSet rsItemDetails = st1
								.executeQuery(sqlItemDetails);
						if (rsItemDetails.next())
						{
							if (tableToBeAccessed.contains("other"))
								makeName = rsItemDetails.getString("makeName");
							else{
								makeName = "";
								String sqlMakeCode="SELECT * from "+tableToBeAccessed.substring(0,9)+"makemaster where makecode='"+makeCode+"'";
								ResultSet rsMakeCode=st2.executeQuery(sqlMakeCode);
								if(rsMakeCode.next())
									makeName=rsMakeCode.getString("makename");
								
							}
							String priceDate="-";
							try{
								priceDate=(rsItemDetails.getString("PriceDate")==null || rsItemDetails.getString("PriceDate").contains("0000-00-00") ?"-":rsItemDetails.getString("PriceDate"));
							}catch(Exception e){e.printStackTrace();}
	%>
						<tr>
							<td><div align="right"><%=i++%></div></td>
							<td><div align="left"><%=rsItemDetails.getString("Description")%></div></td>
							<td><div align="right"><%=rsItemDetails.getString("Partno")%></div></td>
							<td><div align="left"><%=makeName %></div></td>
							<td><div align="left"><%=rsItemDetails.getString("Model")%></div></td>
							<td><div align="right"><%=rsSalesDet.getString("TheGroupName")%></div></td>
							<td><div align="left"><%=(rsItemDetails.getString("SupplierName")==null? "-" :rsItemDetails.getString("SupplierName"))%></div></td>
							<td><div align="right"><%=rsItemDetails.getString("LandedPrice")%></div></td>
							<td><div align="right"><%=rsItemDetails.getString("SellingPrice")%></div></td>
							<td><div align="right"><%=priceDate%></div></td>
							<td><div align="right"><%=rsItemDetails.getString("InOurStock")%></div></td>
				 	</tr>
<%
						}
					}
		}
	%>

</table>
<br>

 <div align="center" id="printbutton" style="margin-top: 3em;">
	<input type="submit" name="printEnquiry" value="Print" onclick="redirect('printSalesEnquiry.jsp','<%=salesEnqRefNumber %>');"  style="border: outset; background-color: #C6DEFF"  />
</div>	

 <div align="center" id="pdfbutton" style="margin-top: 3em;">
	<input type="submit" name="pdfEnquiry" value="PDF" onclick="redirectforpdf('pdf_salesenquiry.jsp','<%=salesEnqRefNumber %>');"  style="border: outset; background-color: #C6DEFF"  />
</div>
<%} %>

<div>&nbsp;</div>		
		
	
<%
if(type.contains("close"))
{
%>		
<%
	String salesEnqNumber="";
	String sqlInvoice = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det WHERE SalesEnqRefNo = '"
					+ salesEnqRefNumber + "' ";
	ResultSet rsTransaction = st.executeQuery(sqlInvoice);
	if (rsTransaction.next()) 
	{
				String dueDate = "NA";
				try {
					dueDate = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
							.format(new SimpleDateFormat(
									"yyyy-MM-dd HH:mm:ss")
									.parse(rsTransaction
											.getString("SalesEnqDueDate")));
				} catch (Exception e) {
				}
				salesEnqNumber=rsTransaction.getString("SalesEnqNo");
%>

	<table bgcolor="#C6DEFF" width="100%" cellpadding="3" cellspacing="3">
		<tr>
			<td><b>Enq No</b></td>
			<td style="width: 200px;"><label><%=rsTransaction.getString("SalesEnqNo")%></label>
			</td>
			<td><b>Enq Date</b></td>
			<td><label><%=rsTransaction.getString("SalesEnqDate")%></label>
			</td>
		</tr>

		<tr>
			<td><b>Customer Name</b></td>
			<td><label><%=rsTransaction.getString("CompanyName")%></label>
			</td>
			<td><b>Contact</b></td>
			<td><label><%=rsTransaction.getString("ContactPerson")%></label>
			</td>
		</tr>
		<tr>
			<td><b>Ref No</b></td>
			<td><label><%=rsTransaction.getString("CustRefNo")%></label></td>
			<td><b>Address</b></td>
			<td><label><%=rsTransaction.getString("Address") + " , "
							+ rsTransaction.getString("city") + " , "
							+ rsTransaction.getString("zip") + " , "
							+ rsTransaction.getString("state") + " , "
							+ rsTransaction.getString("country")%></label>
			</td>
		</tr>
		<tr>
			<td><b>Phone</b></td>
			<td><label><%=rsTransaction.getString("Phone")%></label></td>
			<td><b> Fax</b></td>
			<td><label><%=rsTransaction.getString("fax")%></label></td>
		</tr>
			
		<tr>	
			<td><b>Entered By</b></td>
			<td><label><%=rsTransaction.getString("TWEmpName")%></label></td>
			<td><b> Due Date</b></td>
			<td><input type="hidden" name="duedate" value="<%=dueDate%>"/><label><%=dueDate%></label></td>
		</tr>
		
		<tr>
			<td><b>Status</b></td>
			<td><label><%=(rsTransaction.getInt("SalesEnqClosed") == 0 ? "Open"
											: "Closed")%></label>
			</td>
			
			<td><b>Customer Remarks</b></td>
			<td><label><%=rsTransaction.getString("CustRemarks")%></label></td>

		</tr>
	</table>

	<div align="center"
		style="font-size: 1.5em; margin-top: 0.6em; margin-bottom: 0.4em; height: 3px; background-color: #339CCB">
	</div>
		  
   
	<table class="sortable">
		<tr>
		<th>Sr. No</th>
			<th>Desc</th>
			<th>Part No </th>
			<th>Make</th>
			<th>Model</th>
			<th>Group</th>
			<th>Supplier</th>
			<th>Landed Price</th>
			<th>Selling Price</th>
			<th>Price Entered On</th>
			<th>Stock</th>
 
		</tr>
	<%
	int i=1;
		String sqlSalesDet = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster as b ON (a.TheGroup=b.TheGroupCode)  WHERE a.SalesEnqNo = '"
						+ salesEnqNumber + "'  ";
	
				ResultSet rsSalesDet = st.executeQuery(sqlSalesDet);
				while (rsSalesDet.next()) {
						String makeCode = "", itemCode = "", groupCode = "", quantity, makeName = "",groupName="";
						makeCode = rsSalesDet.getString("make");
						itemCode = rsSalesDet.getString("itemcode");
						groupCode = rsSalesDet.getString("TheGroup");
						quantity = rsSalesDet.getString("quantity");
	
						String tableToBeAccessed = rsSalesDet.getString(
								"TheTableToBeAccessed").toLowerCase();
	
						String sqlItemDetails = "SELECT * FROM "
								+ tableToBeAccessed + " AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b "+
								" ON (a.supplierCode=b.supplierCode) where a.ItemCode='"
								+ itemCode + "' ";
						
						System.out.println(sqlItemDetails);
						System.out.println(sqlItemDetails);
						
						ResultSet rsItemDetails = st1
								.executeQuery(sqlItemDetails);
						if (rsItemDetails.next())
						{
							if (tableToBeAccessed.contains("other"))
								makeName = rsItemDetails.getString("makeName");
							else{
								makeName = "";
								String sqlMakeCode="SELECT * from "+tableToBeAccessed.substring(0,9)+"makemaster where makecode='"+makeCode+"'";
								ResultSet rsMakeCode=st2.executeQuery(sqlMakeCode);
								if(rsMakeCode.next())
									makeName=rsMakeCode.getString("makename");
								
							}
							String priceDate="-";
							try{
								priceDate=(rsItemDetails.getString("PriceDate")==null || rsItemDetails.getString("PriceDate").contains("0000-00-00") ?"-":rsItemDetails.getString("PriceDate"));
							}catch(Exception e){e.printStackTrace();}
	%>
						<tr>
							<td><div align="right"><%=i++%></div></td>
							<td><div align="left"><%=rsItemDetails.getString("Description")%></div></td>
							<td><div align="right"><%=rsItemDetails.getString("Partno")%></div></td>
							<td><div align="left"><%=makeName %></div></td>
							<td><div align="left"><%=rsItemDetails.getString("Model")%></div></td>
							<td><div align="right"><%=rsSalesDet.getString("TheGroupName")%></div></td>
							<td><div align="left"><%=(rsItemDetails.getString("SupplierName")==null? "-" :rsItemDetails.getString("SupplierName"))%></div></td>
							<td><div align="right"><%=rsItemDetails.getString("LandedPrice")%></div></td>
							<td><div align="right"><%=rsItemDetails.getString("SellingPrice")%></div></td>
							<td><div align="right"><%=priceDate%></div></td>
							<td><div align="right"><%=rsItemDetails.getString("InOurStock")%></div></td>
				 	</tr>
<%
						}
					}
		}
	%>

</table>

<div align="center" id="closebutton" style="margin-top: 3em;">
	<input type="submit" name="closeEnquiry" value="close Enquiry" onclick="closeEnq();"  style="border: outset; background-color: #C6DEFF"  />
</div>

<form name="form2" method="get"  action="closeEnq.jsp" >

<div align="left"  id="header" style="position:absolute;   font-size: 1.1em"><b> &nbsp;Reason For Cancelling :</b>
	<script>document.getElementById("header").style.visibility="hidden";</script>
</div>
<div align="left"  id="cancellingreason" name="cancellingreason" style="position:absolute; margin-top: 1em; font-size: 1.1em"> &nbsp;<textarea name="reasonforcancel"
	id="search-text" style='width: 430px; height: 160px;'></textarea>
	<script>document.getElementById("cancellingreason").style.visibility="hidden";</script>
</div>

<input type="hidden" name="reasonforcancel" value="reasonforcancel"/>
<input type="hidden" name="salesrefno" value="<%=salesEnqRefNumber %>"/>

<div align="center" id="submitbutton" style="margin-top: 3em;">
	<input type="submit" name="Submit TT" value="Submit Reason" style="border: outset; background-color: #C6DEFF"  />
	<script>document.getElementById("submitbutton").style.visibility="hidden";</script>
</div>
</form>

<%} %>

<div>&nbsp;</div>
<%
if(type.contains("revise"))
{
//*********************************************  FOR REVISE **************************************************************************	
%>

<%
	String salesEnqNumber="";
		String sqlInvoice = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det WHERE SalesEnqRefNo = '"
					+ salesEnqRefNumber + "' ";
			ResultSet rsTransaction = st.executeQuery(sqlInvoice);
			if (rsTransaction.next())
			{
				String dueDate = "NA";
				try {
					dueDate = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
							.format(new SimpleDateFormat(
									"yyyy-MM-dd HH:mm:ss")
									.parse(rsTransaction
											.getString("SalesEnqDueDate")));
				} catch (Exception e) {
				}
				salesEnqNumber=rsTransaction.getString("SalesEnqNo");
%>
<form name="revise" method="get" action="ReviseEnquiry.jsp">
	<table bgcolor="#C6DEFF" width="100%" cellpadding="3" cellspacing="3">
		<tr>
			<td><b>Enq No</b></td>
			<td style="width: 200px;"><label><%=rsTransaction.getString("SalesEnqNo")%></label>
			</td>
			<td><b>Enq Date</b></td>
			<td><input type="hidden" name="enqdate" value="<%=date%>"/><label><%=date%></label>
			</td>
		</tr>

		<tr>
			<td><b>Customer Name</b></td>
			<td><input type="hidden" name="company" value="<%=rsTransaction.getString("CompanyName")%>"/><label><%=rsTransaction.getString("CompanyName")%></label>
			</td>
			<td><b>Contact</b></td>
			<td><input type="hidden" name="contactperson" value="<%=rsTransaction.getString("ContactPerson")%>"/><label><%=rsTransaction.getString("ContactPerson")%></label>
			</td>
		</tr>
		<tr>
			<td><b>Ref No</b></td>
			<td><input type="hidden" name="refno" value="<%=rsTransaction.getString("CustRefNo")%>"/><label><%=rsTransaction.getString("CustRefNo")%></label></td>
			<td><input type="hidden" name="address" value="<%=rsTransaction.getString("Address")%>"/><b>Address</b></td>
			<td><label><%=rsTransaction.getString("Address") + " , "
							+ rsTransaction.getString("city") + " , "
							+ rsTransaction.getString("zip") + " , "
							+ rsTransaction.getString("state") + " , "
							+ rsTransaction.getString("country")%></label>
			</td>
			<td>
				<input type="hidden" name="city" value="<%=rsTransaction.getString("city") %>"/>
				<input type="hidden" name="zip" value="<%=rsTransaction.getString("zip") %>"/>
				<input type="hidden" name="state" value="<%=rsTransaction.getString("state") %>"/>
				<input type="hidden" name="country" value="<%=rsTransaction.getString("country") %>"/>			
			</td>	
		</tr>
		<tr>
			<td><b>Phone</b></td>
			<td><input type="hidden" name="phone" value="<%=rsTransaction.getString("Phone") %>"/>	<label><%=rsTransaction.getString("Phone")%></label></td>
			<td><b> Fax</b></td>
			<td><input type="hidden" name="fax" value="<%=rsTransaction.getString("fax")%>"/><label><%=rsTransaction.getString("fax")%></label></td>
		</tr>
			
		<tr>	
			<td><b>Entered By</b></td>
			<td><label><%=rsTransaction.getString("TWEmpName")%></label></td>
			<td><b> Due Date</b></td>
			<td><input type="hidden" name="expirydate" value="<%=monthafter %>"/>
				
		</td>
		</tr>
		
		<tr>
			<td><b>Status</b></td>
			<td><label><%=(rsTransaction.getInt("SalesEnqClosed") == 0 ? "Open"
											: "Closed")%></label>
			</td>
			
			<td><b>Customer Remarks</b></td>
			<td><input type="hidden" name="custremark" value="<%=rsTransaction.getString("CustRemarks")%>"/><label><%=rsTransaction.getString("CustRemarks")%></label></td>

		</tr>
		<tr>
		<td>
		<input type="hidden" name="customercode" value="<%=rsTransaction.getString("CustomerCode") %>"/>
		<input type="hidden" name="addresscode" value="<%=rsTransaction.getString("AddressCode") %>"/>
		</td>
		</tr>
	</table>
	
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.6em; margin-bottom: 0.4em; height: 3px; background-color: #339CCB">
	</div>
		  
	<table class="sortable">
		<tr>
		    <th>Sr. No</th>
			<th>Desc</th>
			<th>Part No </th>
			<th>Make</th>
			<th>Model</th>
			<th>Group</th>
			<th>Supplier</th>
			<th>Quantity</th>
			<th>Landed Price</th>
			<th>Selling Price</th>
			<th>Price Entered On</th>
			<th>Stock</th>
 		</tr>
	<%
	    int i=1;
		
		String sqlSalesDet = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster as b ON (a.TheGroup=b.TheGroupCode)  WHERE a.SalesEnqNo = '"
						+ salesEnqNumber + "'  ";
		System.out.println("&&&&&&&&&***********************          "+sqlSalesDet);
		ResultSet rsSalesDet = st.executeQuery(sqlSalesDet);
		while (rsSalesDet.next()) {
		String makeCode = "", itemCode = "", groupCode = "", quantity, makeName = "",groupName="";
		makeCode = rsSalesDet.getString("make");
		itemCode = rsSalesDet.getString("itemcode");
		groupCode = rsSalesDet.getString("TheGroup");
		quantity = rsSalesDet.getString("quantity");
	    
		String tableToBeAccessed = rsSalesDet.getString(
							"TheTableToBeAccessed").toLowerCase();
		System.out.println("?>>>>>>>>>>>>>>>      "+tableToBeAccessed);
		String sqlItemDetails = "SELECT * FROM "
								+ tableToBeAccessed + " AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b "+
								" ON (a.supplierCode=b.supplierCode) where a.ItemCode='"
								+ itemCode + "' ";
												
		System.out.println(sqlItemDetails);
		
		ResultSet rsItemDetails = st1.executeQuery(sqlItemDetails);
		if (rsItemDetails.next())
						{
							if (tableToBeAccessed.contains("other"))
								makeName = rsItemDetails.getString("makeName");
							else{
								makeName = "";
								String sqlMakeCode="SELECT * from "+tableToBeAccessed.substring(0,9)+"makemaster where makecode='"+makeCode+"'";
								ResultSet rsMakeCode=st2.executeQuery(sqlMakeCode);
								if(rsMakeCode.next())
									makeName=rsMakeCode.getString("makename");
								
							}
							String priceDate="-";
							try{
								priceDate=(rsItemDetails.getString("PriceDate")==null || rsItemDetails.getString("PriceDate").contains("0000-00-00") ?"-":rsItemDetails.getString("PriceDate"));
							}catch(Exception e){e.printStackTrace();}
%>
						<tr>
							<td>
							<div align="right"><%=i++%></div></td>
							<td><div align="left"><%=rsItemDetails.getString("Description")%></div></td>
							<td><div align="right"><%=rsItemDetails.getString("Partno")%></div></td>
							<td><div align="left"><%=makeName %></div></td>
							<td><div align="left"><%=rsItemDetails.getString("Model")%></div></td>
							<td><div align="right"><input type="hidden" name="groupname<%=d %>" value="<%=rsSalesDet.getString("TheGroupName")%>"/><%=rsSalesDet.getString("TheGroupName")%></div></td>
							<td><div align="left"><%=(rsItemDetails.getString("SupplierName")==null? "-" :rsItemDetails.getString("SupplierName"))%></div></td>
							<td><div align="right"><input type="text"  id="quantity<%=d %>" name="quantity<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	            			   border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	           				   color: #000000;" value="<%=rsSalesDet.getString("Quantity") %>" /></div></td>
							<td><div align="right"><%=rsItemDetails.getString("LandedPrice")%></div></td>
							<td><div align="right"><input type="text"  id="sellingprice<%=d %>" name="sellingprice<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	               				border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	              				color: #000000;" value="<%=rsItemDetails.getString("SellingPrice") %>" /></div></td>
							<td><div align="right"><%=priceDate%></div></td>
							<td><div align="right"><%=rsItemDetails.getString("InOurStock")%></div></td>
				 	   </tr>
				 	   <input type="hidden" name="groupcode<%=d %>" value="<%=groupCode%>"/>
				 	   <input type="hidden" name="makecode<%=d %>" value="<%=makeCode%>"/>
				 	   <input type="hidden" name="itemcode<%=d %>" value="<%=itemCode%>"/>
				 	   <input type="hidden" name="quantity<%=d %>" value="<%=rsSalesDet.getString("Quantity") %>"/>
				 	   <input type="hidden" name="description<%=d %>" value="<%=rsItemDetails.getString("Description") %>"/>
				 	   
				 	   
<%                       d++;
						}
					}count=i-1;
				}
%>

      	
</table>
	<td>
	
	<input type="hidden" name="count"  id="count" value="<%=count %>"/>
	<input type="hidden" name="salesenqrefno" value="<%=request.getParameter("transactionId") %>"/>
	</td>
<br>
<br>	
	
	<div align="center">
	<input type="submit" style="border: outset; background-color: #C6DEFF;width: 165px;" onclick=""	name="ReviseInvoice" value="Revise Invoice" />
	</div>		
	</br>
	</br>
	</form>
<%} %>
	<br> <br> <br> <br><br> <br> <br> <br><br> <br> <br> <br>
	<br> <br> <br> <br><br> <br> <br> <br><br> <br> <br> <br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
	</body>
	</html>
</jsp:useBean>