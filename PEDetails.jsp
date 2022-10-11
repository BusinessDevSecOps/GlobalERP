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

	function redirect(webadd,purenqrefno)
	{
	
		window.open(webadd+'?purenqrefno='+purenqrefno);
	}

	function pdfconversion(webadd,purenqrefno)
	{
		//alert("++++     %%%%%   s");
		window.open(webadd+'?purenqrefno='+purenqrefno);
	}
	</script>
	</head>
	<body>
    
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		    Connection conn = null;
			Statement st = null,st1=null,st2=null,st3=null;
			boolean isInvoiceSelected = false;
			int count=0;
			int d=0;
			Date today = new Date();
			String enqDate=new SimpleDateFormat("dd-MMM-yyyy").format(today);
			String date=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(enqDate));
			double stpercent=0;
			Date mothafter=new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(today);
			cal.add(Calendar.DAY_OF_MONTH,+30);
			Date MonthAsDate=cal.getTime();
			String monthafter=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(MonthAsDate);
			String monthafterInMMM=new SimpleDateFormat("dd-MMM-yyyy hh:mm;ss").format(MonthAsDate);
			System.out.println(monthafterInMMM+"())))))))))))))))))))))  ");
			String discount="";
			Date today1 = new Date();
			String fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today1);
			
			try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
				st3 = conn.createStatement();
			} catch (Exception e) {
			}
			
			String type=request.getParameter("condition");
			System.out.println("TYPE IS    "+type);
			
			String PurEnqRefNumber = request.getParameter("transactionId");
			System.out.println(PurEnqRefNumber);
			
			String supplier=request.getParameter("supplier");
			System.out.println(">>>>>>>>>     "+supplier);
			
			String sqlcd="Select * from "+session.getAttribute("CompanyMasterID").toString()+"supplierdet where SupplierName='"+supplier+"'";
			ResultSet rscd=st3.executeQuery(sqlcd);
			rscd.next();
			String scod=rscd.getString("SupplierCode");
			String conpersn=rscd.getString("ContactPerson");
			String phn=rscd.getString("Phone");
			String fx=rscd.getString("Fax");
			String add=rscd.getString("Address");
			String cty=rscd.getString("City") ;
			String zi=rscd.getString("Zip") ;
			String stat=rscd.getString("State");
			String cntry=rscd.getString("Country");
			
			
			
			
			String sqlDisplayDesc=" ",totalAmount="",totalAmountInWords="",termsconditions="",PurQuoNumber="",status="",statusTD="",fromdate="";
			
			
			
	%>
    
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.4em; margin-bottom: 0.4em; height: 3px; background-color: #339CCB">
	</div>
	
	
	<div align="center" id=" " style="font-size: 1.5em;">Purchase Enquiry : <a><%=request.getParameter("transactionId")%></a>
 </a></div>
	
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.4em; margin-bottom: 0.6em; height: 3px; background-color: #339CCB">
	</div>
		<div>&nbsp;</div>
		
<%
if(type.contains("null"))
{
%>			

<%
	String PurEnqNumber="",SupplierName="";
	String sqlPurchase = "SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"purchaseenq  as a RIGHT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on (a.Suppliercode = b.SupplierCode) WHERE a.PurchaseEnqNo = '"+ PurEnqRefNumber + "'  ";
	ResultSet rsTransaction = st.executeQuery(sqlPurchase);
	System.out.println("****************             "+sqlPurchase);
	if (rsTransaction.next()) 
	{
		SupplierName=rsTransaction.getString("SupplierName");		
		String dueDate = "NA";
				try {
					dueDate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsTransaction.getString("DueDate")));
				} catch (Exception e) {
				}
				PurEnqNumber=rsTransaction.getString("PurchaseEnqNo");
%>

	<table bgcolor="#C6DEFF" width="100%" cellpadding="3" cellspacing="3">
		<tr>
			<td><b>Purchase TWRef No:</b></td>
			<td style="width: 200px;"><label><%=rsTransaction.getString("TWRefNo")%></label>
			</td>
			<td><b>Purchase Enq Date:</b></td>
			<td><label><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsTransaction.getString("PurEnqDate")))%></label>
			</td>
			<td><b>Supplier:</b></td>
			<!-- <td><label><%=rsTransaction.getString("SupplierName")%></label> -->
			<td><label><%=supplier%></label>
			</td>
		</tr>

		<tr>
			<td><b>Contact:</b></td>
			<td><label><%=conpersn%></label>
			</td>
			<td><b>Phone:</b></td>
			<td><label><%=phn%></label></td>
			<td><b> Fax:</b></td>
			<td><label><%=fx%></label></td>
		</tr>
		<tr>
			
			<td><b>Address:</b></td>
			<td><label><%=add%> <%=cty %> <%=zi %>   <%=stat %> <%=cntry %></label>
			</td>
			<td><b>Entered By:</b></td>
			<td><label><%=rsTransaction.getString("SentBy")%></label></td>
			<td><b> Due Date:</b></td>
			<td><input type="hidden" name="duedate" value="<%=rsTransaction.getString("DueDate")%>"/><label><%=dueDate%></label></td>
		</tr>
		<tr>
			
		</tr>
					
		<tr>
			<td><b>Status:</b></td>
			<td><label><%=(rsTransaction.getInt("PurEnqClosed") == 0 ? "Open"
											: "Closed")%></label>
			</td>
			
			<td><b>Remarks:</b></td>
			<td><label><%=rsTransaction.getString("Remarks")%></label></td>

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
			<th>Quantity</th>
			<th>Selling Price</th>
			<th>Price Entered On</th>
 
		</tr>
	<%
	int i=1;
	String refMakeNameTable="";
		String sqlPurDet = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"enquireditems WHERE PurchaseEnqNo ='"+ PurEnqNumber + "'  ";
	
				ResultSet rsPurDet = st.executeQuery(sqlPurDet);
				System.out.println("****************             "+sqlPurDet);
				while (rsPurDet.next()) {
						String makeCode = "", itemCode = "",  quantity="", makeName = "",groupName="";
						int groupCode=0;
						makeCode = rsPurDet.getString("Make");
						itemCode = rsPurDet.getString("ItemCode");
						groupCode = rsPurDet.getInt("TheGroup");
						quantity = rsPurDet.getString("Quantity");
	
						String Groupsql = "SELECT TheGroupName FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+ groupCode + "'  ";
						ResultSet rsGroup = st1.executeQuery(Groupsql);
						System.out.println(">>>>>>>>>>>          "+Groupsql );
						if(rsGroup.next()) 
						{
							groupName=rsGroup.getString("TheGroupName");
						}
						if(groupCode<5)
						{
							refMakeNameTable="tbl_"+groupName.substring(0,5)+"makemaster";
							   	  	
							String sqlMakename="SELECT MakeName FROM "+refMakeNameTable.toLowerCase()+"  WHERE makecode='"+makeCode+"' ";
							ResultSet rsMakeName=st3.executeQuery(sqlMakename);
							System.out.println("********>>>>            "+sqlMakename );
							if(rsMakeName.next())
							makeName=rsMakeName.getString(1);
							else
							makeName="-";
									      
							sqlDisplayDesc="SELECT * FROM tbl_"+groupName.substring(0,5).toLowerCase()+"im_make"+makeCode+" where ItemCode='"+itemCode+"'";
						}
						else
						{
							sqlDisplayDesc="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+groupCode+" where ItemCode='"+itemCode+"' ";
							makeName="-"  ;
						}
						ResultSet rsSql=st3.executeQuery(sqlDisplayDesc);
						System.out.println("********>>>>            "+sqlDisplayDesc);
						while(rsSql.next())
						{
						  
						 
						
						
	%>
						<tr>
							<td><div align="right"><%=i++%></div></td>
							<td><div align="left"><%=rsSql.getString("Description")%></div></td>
							<td><div align="left"><%=rsSql.getString("Partno")%></div></td>
							<td><div align="left"><%=makeName %></div></td>
							<td><div align="left"><%=rsSql.getString("Model")%></div></td>
							<td><div align="right"><%=rsPurDet.getString("Quantity")%></div></td>
							<td><div align="right"><%=rsSql.getString("SellingPrice")%></div></td>
							<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsSql.getString("EnteredonDate")))%></div></td>
				 	</tr>
<%
						}
					}
		}
	%>

</table>
<br>

 <div align="center" id="printbutton" style="margin-top: 3em;">
	<input type="submit" name="printEnquiry" value="Print" onclick="redirect('printPurchaseEnquiry.jsp','<%=PurEnqRefNumber %>');"  style="border: outset; background-color: #C6DEFF"  />
</div>



 <div align="center" id="pdfbutton" style="margin-top: 3em;">
	<input type="submit" name="pdfEnquiry" value="PDF" onclick="pdfconversion('pdf_purchaseEnq.jsp','<%=PurEnqRefNumber %>');"  style="border: outset; background-color: #C6DEFF"  />
</div>
<%} %>


<div>&nbsp;</div>		
<div>&nbsp;</div>		
<%
if(type.contains("close"))
{
	System.out.println("IN CLOSE     ****   ");
	System.out.println("CONATCT    "+conpersn);
	
%>	

<%
	String PurEnqNumber="",SupplierName="",twrefno="";
	String sqlPurchase = "SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"purchaseenq  as a RIGHT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on (a.Suppliercode = b.SupplierCode) WHERE a.PurchaseEnqNo = '"+ PurEnqRefNumber + "' ";
	ResultSet rsTransaction = st.executeQuery(sqlPurchase);
	System.out.println("****************             "+sqlPurchase);
	if (rsTransaction.next()) 
	{
		SupplierName=rsTransaction.getString("SupplierName");		
		String dueDate = "NA";
				try {
					dueDate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsTransaction.getString("DueDate")));

				} catch (Exception e) {
				}
				PurEnqNumber=rsTransaction.getString("PurchaseEnqNo");
				twrefno=rsTransaction.getString("TWRefNo");
%>

	<table bgcolor="#C6DEFF" width="100%" cellpadding="3" cellspacing="3">
		<tr>
			<td><b>Purchase TWRef No:</b></td>
			<td style="width: 200px;"><label><%=rsTransaction.getString("TWRefNo")%></label>
			</td>
			<td><b>Purchase Enq Date:</b></td>
			<td><label><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsTransaction.getString("PurEnqDate")))%></label>
			</td>
			<td><b>Supplier:</b></td>
			<td><label><%=supplier%></label>
			</td>
		</tr>

		<tr>
			<td><b>Contact:</b></td>
			<td><label><%=conpersn%></label>
			</td>
			<td><b>Phone:</b></td>
			<td><label><%=phn%></label></td>
			<td><b> Fax:</b></td>
			<td><label><%=fx%></label></td>
		</tr>
		<tr>
			
			<td><b>Address:</b></td>
			<td><label><%=add %> <%=cty%> <%=zi%> <%=stat %> <%= cntry%>
						</label>
			</td>
			<td><b>Entered By:</b></td>
			<td><label><%=rsTransaction.getString("SentBy")%></label></td>
			<td><b> Due Date:</b></td>
			<td><input type="hidden" name="duedate" value="<%=rsTransaction.getString("DueDate")%>"/><label><%=dueDate%></label></td>
		</tr>
		<tr>
			
		</tr>
					
		<tr>
			<td><b>Status:</b></td>
			<td><label><%=(rsTransaction.getInt("PurEnqClosed") == 0 ? "Open"
											: "Closed")%></label>
			</td>
			
			<td><b>Remarks:</b></td>
			<td><label><%=rsTransaction.getString("Remarks")%></label></td>

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
			<th>Quantity</th>
			<th>Selling Price</th>
			<th>Price Entered On</th>
		
 
		</tr>
	<%
	int i=1;
	String refMakeNameTable="";
		String sqlPurDet = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"enquireditems WHERE PurchaseEnqNo ='"+ PurEnqNumber + "'  ";
	
				ResultSet rsPurDet = st.executeQuery(sqlPurDet);
				System.out.println("****************             "+sqlPurDet);
				while (rsPurDet.next()) {
						String makeCode = "", itemCode = "",  quantity="", makeName = "",groupName="";
						int groupCode=0;
						makeCode = rsPurDet.getString("Make");
						itemCode = rsPurDet.getString("ItemCode");
						groupCode = rsPurDet.getInt("TheGroup");
						quantity = rsPurDet.getString("Quantity");
	
						
						String Groupsql = "SELECT TheGroupName FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+ groupCode + "'  ";
						ResultSet rsGroup = st1.executeQuery(Groupsql);
						System.out.println(">>>>>>>>>>>          "+Groupsql );
						if(rsGroup.next()) 
						{
							groupName=rsGroup.getString("TheGroupName");
						}
						if(groupCode<5)
						{
							refMakeNameTable="tbl_"+groupName.substring(0,5)+"makemaster";
							   	  	
							String sqlMakename="SELECT MakeName FROM "+refMakeNameTable.toLowerCase()+"  WHERE makecode='"+makeCode+"' ";
							ResultSet rsMakeName=st3.executeQuery(sqlMakename);
							System.out.println("********>>>>            "+sqlMakename );
							if(rsMakeName.next())
							makeName=rsMakeName.getString(1);
							else
							makeName="-";
									      
							sqlDisplayDesc="SELECT * FROM tbl_"+groupName.substring(0,5).toLowerCase()+"im_make"+makeCode+" where ItemCode='"+itemCode+"'";
						}
						else
						{
							sqlDisplayDesc="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+groupCode+" where ItemCode='"+itemCode+"' ";
							makeName="-"  ;
						}
						ResultSet rsSql=st3.executeQuery(sqlDisplayDesc);
						System.out.println("********>>>>            "+sqlDisplayDesc);
						while(rsSql.next())
						{
						  
						 
						
						
	%>
						<tr>
							<td><div align="right"><%=i++%></div></td>
							<td><div align="left"><%=rsSql.getString("Description")%></div></td>
							<td><div align="right"><%=rsSql.getString("Partno")%></div></td>
							<td><div align="left"><%=makeName %></div></td>
							<td><div align="left"><%=rsSql.getString("Model")%></div></td>
							<td><div align="left"><%=rsPurDet.getString("Quantity")%></div></td>
							<td><div align="right"><%=rsSql.getString("SellingPrice")%></div></td>
							<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsSql.getString("EnteredonDate")))%></div></td>
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

<form name="form2" method="get"  action="closePurEnq.jsp" >

<div align="left"  id="header" style="position:absolute;   font-size: 1.1em"><b> &nbsp;Reason For Cancelling :</b>
	<script>document.getElementById("header").style.visibility="hidden";</script>
</div>
<div align="left"  id="cancellingreason" name="cancellingreason" style="position:absolute; margin-top: 1em; font-size: 1.1em"> &nbsp;<textarea name="reasonforcancel"
	id="search-text" style='width: 430px; height: 160px;'></textarea>
	<script>document.getElementById("cancellingreason").style.visibility="hidden";</script>
</div>

<input type="hidden" name="reasonforcancel" value="reasonforcancel"/>
<input type="hidden" name="purenqno" value="<%=PurEnqNumber %>"/>

<div align="center" id="submitbutton" style="margin-top: 3em;">
	<input type="submit" name="Submit TT" value="Submit Reason" style="border: outset; background-color: #C6DEFF"  />
	<script>document.getElementById("submitbutton").style.visibility="hidden";</script>
</div>
</form>
<%} %>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%
if(type.contains("revise"))
{
	System.out.println("IN Revise     ****   ");
%>	

<%
    String Terms="";
	String PurEnqNumber="",SupplierName="",twrefno="";
	String sqlPurchase = "SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"purchaseenq  as a RIGHT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on (a.Suppliercode = b.SupplierCode) WHERE a.PurchaseEnqNo = '"+ PurEnqRefNumber + "' ";
	ResultSet rsTransaction = st.executeQuery(sqlPurchase);
	System.out.println("****************             "+sqlPurchase);
	if (rsTransaction.next()) 
	{
		SupplierName=rsTransaction.getString("SupplierName");		
		String dueDate = "NA";
				try {
					dueDate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsTransaction.getString("DueDate")));
				} catch (Exception e) {
				}
				System.out.println("****************dueDate:"+dueDate);
				PurEnqNumber=rsTransaction.getString("PurchaseEnqNo");
				twrefno=rsTransaction.getString("TWRefNo");
%>
  <form name="reviceenq" method="post" action="RevisePurEnq.jsp">
	<table bgcolor="#C6DEFF" width="100%" cellpadding="3" cellspacing="3">
		<tr>
			<td><b>Purchase TWRef No:</b></td>
			<td style="width: 200px;"><input type="hidden" name="twref" id="twref" value="<%=rsTransaction.getString("TWRefNo")%>"/><label><%=rsTransaction.getString("TWRefNo")%></label>
			</td>
			<td><b>Purchase Enq Date:</b></td>
			<td><input type="hidden" name="enqdate" id="enqdate" value="<%=rsTransaction.getString("PurEnqDate")%>"/><label><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsTransaction.getString("PurEnqDate")))%></label>
			</td>
			<td><b>Supplier:</b></td>
			<td><label><%=supplier%></label>
			</td>
		</tr>

		<tr>
			<td><b>Contact:</b></td>
			<td><label><%=conpersn%></label>
			</td>
			<td><b>Phone:</b></td>
			<td><label><%=phn%></label></td>
			<td><b> Fax:</b></td>
			<td><label><%=fx%></label></td>
		</tr>
		<tr>
			
			<td><b>Address:</b></td>
			<td><label><%=add%>  <%=cty %> <%=zi %> <%= stat %> <%=cntry %></label>
			</td>
			<td><b>Entered By:</b></td>
			<td><label><%=rsTransaction.getString("SentBy")%></label></td>
			<td><b>Due Date:</b></td>
			<td><input type="hidden" name="duedate" id="duedate" value="<%=rsTransaction.getString("DueDate")%>"/><label><%=dueDate%></label></td>
		</tr>
		<tr>
			
		</tr>
					
		<tr>
			<td><b>Status:</b></td>
			<td><label><%=(rsTransaction.getInt("PurEnqClosed") == 0 ? "Open"
											: "Closed")%></label>
			</td>
			
			<td><b>Remarks:</b></td>
			<td><label><%=rsTransaction.getString("Remarks")%></label></td>

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
			<th>Quantity</th>
			<th>Price Entered On</th>
 
		</tr>
	<%
	int i=1;
	String refMakeNameTable="";
		String sqlPurDet = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"enquireditems WHERE PurchaseEnqNo ='"+ PurEnqNumber + "'  ";
	
				ResultSet rsPurDet = st.executeQuery(sqlPurDet);
				System.out.println("****************             "+sqlPurDet);
				while (rsPurDet.next()) {
						String makeCode = "", itemCode = "",  quantity="", makeName = "",groupName="";
						int groupCode=0;
						makeCode = rsPurDet.getString("Make");
						itemCode = rsPurDet.getString("ItemCode");
						groupCode = rsPurDet.getInt("TheGroup");
						quantity = rsPurDet.getString("Quantity");
	
						
						String Groupsql = "SELECT TheGroupName FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+ groupCode + "'  ";
						ResultSet rsGroup = st1.executeQuery(Groupsql);
						System.out.println(">>>>>>>>>>>          "+Groupsql );
						if(rsGroup.next()) 
						{
							groupName=rsGroup.getString("TheGroupName");
						}
						if(groupCode<5)
						{
							refMakeNameTable="tbl_"+groupName.substring(0,5)+"makemaster";
							   	  	
							String sqlMakename="SELECT MakeName FROM "+refMakeNameTable.toLowerCase()+"  WHERE makecode='"+makeCode+"' ";
							ResultSet rsMakeName=st3.executeQuery(sqlMakename);
							System.out.println("********>>>>            "+sqlMakename );
							if(rsMakeName.next())
							makeName=rsMakeName.getString(1);
							else
							makeName="-";
									      
							sqlDisplayDesc="SELECT * FROM tbl_"+groupName.substring(0,5).toLowerCase()+"im_make"+makeCode+" where ItemCode='"+itemCode+"'";
						}
						else
						{
							sqlDisplayDesc="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+groupCode+" where ItemCode='"+itemCode+"' ";
							makeName="-"  ;
						}
						ResultSet rsSql=st3.executeQuery(sqlDisplayDesc);
						System.out.println("********>>>>            "+sqlDisplayDesc);
						while(rsSql.next())
						{
						  
							System.out.println("********>>>>RecommendedSupp:            "+rsPurDet.getString("RecommendedSupp"));
						
						
	%>
						<tr>
							<td><div align="right"><%=i++%></div></td>
							<td><div align="left"><%=rsSql.getString("Description")%></div></td>
							<td><div align="right"><%=rsSql.getString("Partno")%></div></td>
							<td><div align="left"><%=makeName %></div></td>
							<td><div align="left"><%=rsSql.getString("Model")%></div></td>
							<td><div align="right"><input type="text"  id="quantity<%=d %>" name="quantity<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	            			   border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	           				   color: #000000;" value="<%=rsPurDet.getString("Quantity") +d%>"/></div></td>    
							<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsSql.getString("EnteredonDate")))%></div></td>
				 	</tr>
			<input type="hidden" name="groupcode<%=d %>" id="groupcode<%=d %>" value="<%=groupCode%>"/>
			<input type="hidden" name="makecode<%=d %>" id="makecode<%=d %>" value="<%=makeCode%>"/>
			<input type="hidden" name="itemcode<%=d %>" id="itemcode<%=d %>" value="<%=itemCode%>"/>
			
			<input type="hidden" name="quantity<%=d %>" id=quantity<%=d %>" value="<%=rsPurDet.getString("Quantity") %> "/>
			<input type="hidden" name="landed<%=d %>" id="landed<%=d %>"  value="<%=rsSql.getString("LandedPrice") %> "/>
			<input type="hidden" name="recommended<%=d %>" id="recommended<%=d %>"  value="<%=rsPurDet.getString("RecommendedSupp") %> "/>
			<input type="hidden" name="groupname" id="groupname" value="<%=groupName %>"/>
<%
               d++;
						}
								}
			 count=i-1;
	%>
</table>
<%
}
 %>
 <br></br><br></br><br></br><br></br>

	<input type="hidden" name="rupees" value="<%=totalAmountInWords %>"/>
	<input type="hidden" name="count"  id="count" value="<%=count %>"/>
	<input type="hidden" name="PurEnqNumber" id="PurEnqNumber" value="<%=request.getParameter("transactionId") %>"/>
	<br>	
	<div align="center">
	<input type="submit" style="border: outset; background-color: #C6DEFF;width: 165px;"  name="ReviseEnquiry" value="Revise Enquiry" />
	</div>
    </br>
</form>
<%} %>

	
	<br> </br> </br> <br></br> <br> <br> <br><br> <br> <br> <br>
	<br> <br> <br> <br><br> <br> <br> <br><br> <br> <br> <br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
	</body>
	</html>
</jsp:useBean>