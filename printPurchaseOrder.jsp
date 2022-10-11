<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="conn.jsp"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.TimeZone"%>
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
	<script language="javascript">
	function gotoPrint(divName)  
	{  
		  var printContents = document.getElementById(divName).innerHTML; 
		  var originalContents = document.body.innerHTML; 
		  document.body.innerHTML = printContents;  
		  window.print();
		  document.body.innerHTML = originalContents;  
	}
</script>
	</head>
	<body>


	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
			Statement st = null, st1 = null, st2 = null, st3 = null, st4 = null;

			
			
				String todaysDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
					.format(new java.util.Date());
			String todaysTime = new SimpleDateFormat(" HH:mm:ss")
					.format(new java.util.Date());

			NumberFormat nf = new DecimalFormat("#0.00");

			try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st2 = conn.createStatement();
				st1 = conn.createStatement();
				st3 = conn.createStatement();
				st4 = conn.createStatement();
			} catch (Exception e) {
			}
			
			String ordrefno=request.getParameter("PurOrderNumber");
			System.out.println("REF NO I S      "+ordrefno);
			String SqlEnqDet = "SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder WHERE PONo='"+ordrefno+"' ";
			System.out.println(">>>>>>>>>>>      " + SqlEnqDet);
			ResultSet rsEnqDet = st4.executeQuery(SqlEnqDet);
			if (rsEnqDet.next()) {
			String suppliercode=rsEnqDet.getString("SupplierCode");	
			String podate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsEnqDet.getString("PODate")));
			String total=rsEnqDet.getString("Total");
			String grandtot=rsEnqDet.getString("GrandTotal");
			String discount=rsEnqDet.getString("DiscountPercent");
			String totalwords=rsEnqDet.getString("TotalinWords");
			String termsconditions=rsEnqDet.getString("Terms");
			
			
			String sql="select * from "+session.getAttribute("CompanyMasterID").toString()+"supplierdet where SupplierCode='"+suppliercode+"'";	
			ResultSet rssql=st.executeQuery(sql);
			rssql.next();
			String suppliername=rssql.getString("SupplierName");
			String add=rssql.getString("Address");
			String stat=rssql.getString("State");
			String count=rssql.getString("Country");
			String zip=rssql.getString("Zip");
			String contact=rssql.getString("ContactPerson");
			String phn=rssql.getString("Phone");
			String fx=rssql.getString("Fax");
	%>
	
	    
   
	
	
	<table style="font-size:small;"  width="100%"  cellspacing="0" cellpadding="0">
    <tr>
	
	<%
	String companydata="select * from "+session.getAttribute("CompanyMasterID").toString()+"ourcompanydet where OurCompanyCode='1' ";
	ResultSet rsdata=st.executeQuery(companydata);
	rsdata.next();
	String companyname=rsdata.getString("OurCompanyName");
	String address=rsdata.getString("OurCompanyAddress");
	String phone=rsdata.getString("PhoneNo");
	String mail=rsdata.getString("Puremail");
	String website=rsdata.getString("Website");
	String fax=rsdata.getString("FaxNo");
	%>
	<td style="font-size: small; " align="center" >
	<b><%=companyname %></b><br>
	<%=address %><br>
	<%=phone %>   <%=fax %><br>
	<%=mail %>    <%=website %></td>
	
	</tr>
	</table>

<br>
 <div align="center" style="font-size: small;"><b> Purchase Order No: <%=ordrefno %></b></div>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
<tr>
<td>
To,<br></br>
<%=suppliername %><br></br>
<%=add %><br></br>
Kind Attn:<%=contact %>
</td>
<td>
Our PO Details:<br></br>
PO No : <%=ordrefno %><br></br>
PO Date : <%=podate %>

</td>
</tr>
</table>


<br>
  <div align="left" style="font-size: small;">
Dear Sir,<br>
We request you to please deliver us the following:-

</div>


 <br></br>
<table style="font-size: small;">
<tr><td>
<b>Group : <input type="text" value="-" id="groupTop"  name="groupTop" style="border: none;font-size: small;" /></b></td></tr>
<tr>
<td><b>Make :</b> <input type="text" value="-" id="makeTop"  name="makeTop" style="border: none;font-size: small;" /></td>
</tr>
</table>




   	<table border="1" style="border-spacing: 0px;font-size:x-small;" class="sortable">
	<tr style="border-spacing: 0px">
	<th>Sr No</th>
	<th>Model</th>
	<th>Part No</th>													
	<th style="width: 400px;">Description</th>
	<th>Rate/Unit</th>													
	<th>Quantity</th>
	
	</tr>
<%
		System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPpppp");
		
	int i=1;
	String refMakeNameTable="",sqlDisplayDesc="";
		String sqlPurDet = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder_items WHERE PONo ='"+ ordrefno + "'  ";
	
				ResultSet rsPurDet = st.executeQuery(sqlPurDet);
				System.out.println("TTTTTTTTTTTTTTTTTTTTTTTT     "+sqlPurDet);
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
							<td><div align="left"><%=rsSql.getString("Model")%></div></td>
							<td><div align="left"><%=rsSql.getString("PartNo")%></div></td>
							<td><div align="left"><%=rsSql.getString("Description")%></div></td>
							<td><div align="right"><%=rsPurDet.getString("UnitPrice")%></div></td>
							<td><div align="right"><%=rsPurDet.getString("Quantity")%></div></td>
							
				 	</tr>
<%
						}
					}
		
	%>
	
	<tr><td colspan="6"><div align="right"><b>Total : <%=total %></b></div></td></tr>
	<tr><td colspan="6"> <div align="right"><b>Discount : <%=discount %> </b></div></td></tr>
	<tr><td colspan="6"> <div align="right"><b>Grand Total(Rs.) : <%=grandtot %></b></div></td></tr>
	</table>



<div align="left" style="font-size:small;">(<%= totalwords%>)</div>
<div align="left"   style="font-size:small;"><b> TERMS & CONDITIONS :</b><br>

	<textarea readonly="readonly" name="termsconditions"  
	id="search-text" style="border:none; width:640px; height:325px ;font-size:x-small;"><%=termsconditions %></textarea></div>
<br>
<div align="left" style="font-size:small;">
Despatch to the Following Address<br>
Transworld Compressor Technologies Ltd.<br>
Survey No. 921 Kad Vasti,Next to Raisony Collage,Wagholi Domkhel Road,Wagholi,Pune- 412207
</div>
<br>

<div align="left" style="font-size:small;">
Thank You,
</div>
<div align="right" style="font-size:small;">
For Transworld Compressor Technolgies Ltd.
<br>
<%=session.getAttribute("EmpName") %><br>
( Authorsied Signatory )

</div>


<div align="left" style="font-size: small;">
VAT TIN NO - 27530091079 V Pan No- AABCT4318G Service Category - Business Auxiliary Services<br>
CST TIN NO - 27530091079 C Service Tax No.- AABCT4318GST001
</div>
<%} %>
</body>
	</html>
</jsp:useBean>