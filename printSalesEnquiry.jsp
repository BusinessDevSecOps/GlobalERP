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
	<form>

	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
			Statement st = null, st1 = null, st2 = null, st3 = null, st4 = null;

			int groupCode = 0, makeCode = 0;
			int d = 0;

			int i = 0;
			String groupName = "", makeName = "", itemCode = "", stpercent = "";
			String refMakeNameTable = "", fromdate = "";
			String pfi = "", frieght = "", grandTotal = "";
			String frieghtType = "", grandtotal = "";
			String sqlDisplayDesc = " ", totalAmount = "", totalAmountInWords = "", termsconditions = "", salesQuoNumber = "", status = "", statusTD = "";
			String enqno="";
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
			String enqrefno=request.getParameter("senqrefno");
			String SqlEnqDet = "SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det WHERE SalesEnqRefNo='"+enqrefno+"' ";
			System.out.println(">>>>>>>>>>>      " + SqlEnqDet);
			ResultSet rsEnqDet = st4.executeQuery(SqlEnqDet);
			if (rsEnqDet.next()) {
			 enqno=rsEnqDet.getString("SalesEnqNo");	
				
	%>
	<div>&nbsp;</div>
	<div>&nbsp;</div>
		<div align="right"><a href="#" onclick="window.print();return true;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
	</div><div>&nbsp;</div>
	<table  align="center" width="100%" valign="top">
    <tr>
	
	<%
	String companydata="select * from CompanyMaster where companymid="+session.getAttribute("CompanyMasterID").toString();
	ResultSet rsdata=st.executeQuery(companydata);
	rsdata.next();
	String companyname=rsdata.getString("Companyname");
	String address=rsdata.getString("address");
	String phone=rsdata.getString("phone");
	String mail=rsdata.getString("emailid");
	String website=rsdata.getString("website");
	String fax=rsdata.getString("fax");
	%>
	<td style="font-size: small;">
	<b><%=companyname %></b><br>
	<%=address %><br>
	<%=phone %>   <%=fax %><br>
	<%=mail %>    <%=website %></td>
	
	<td align="right">
		<img src="images/UKAS BSI Logo.bmp" height="60" width="100"></img> </td>
	</tr>
    </table>
  
	<br>
    
    <div align="center"style="font-size: small;"><b>SALES ENQUIRY</b></div>
	<table style="border: thin solid;"  width="100%">
		<tr>

			<td align="left"><b>Sales Enq NO:</b>    &nbsp;&nbsp;&nbsp;&nbsp;     <%=rsEnqDet.getString("SalesEnqRefNo")%>
			<br></br><br></br><b>Enquiry Date & Time:</b><%=new SimpleDateFormat(
			"dd-MMM-yyyy")
			.format(new SimpleDateFormat( 
					"yyyy-MM-dd")
					.parse(rsEnqDet.getString("SalesEnqDate")))%>    &nbsp;&nbsp;&nbsp;&nbsp;   <%= rsEnqDet.getString("SalesEnqTime")%>
					
					
			
		<br></br><br></br>
			<b>Customer Name:</b><%=rsEnqDet.getString("CompanyName")%></td>
			
			</td>
		</tr>
		

		<%
			}
		%>
	</table>
	
	
	
	<div>&nbsp;&nbsp;</div>

	<table border="1" style="border-spacing: 0px" class="sortable">
		<tr style="border-spacing: 0px">
			<th>Sr No</th>
			<th>Make</th>
			<th>Part No</th>
			<th style="width: 400px;">Description</th>
			<th>Quantity</th>
			<th>Unit prize</th>
			
		</tr>

		<%
			double tax = 0, discount = 0.00, total = 0.00;

				String sqlEnqItems = "SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items WHERE SalesEnqNo='"+enqno+"'";
				System.out.println(sqlEnqItems);
				ResultSet rsEnqItems = st1.executeQuery(sqlEnqItems);
				i = 1;
				while (rsEnqItems.next()) {
					groupName = "";
					makeName = "";
					refMakeNameTable = "";
					groupCode = rsEnqItems.getInt("TheGroup");
					makeCode = rsEnqItems.getInt("Make");
					itemCode = rsEnqItems.getString("ItemCode");

					String sqlGroup = "SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"
							+ groupCode + "'";
					ResultSet rsGroup = st2.executeQuery(sqlGroup);
					if (rsGroup.next())
						groupName = rsGroup.getString("TheGroupName");
					if (groupCode < 5) {
						refMakeNameTable = session.getAttribute("CompanyMasterID").toString()+"tbl_" + groupName.substring(0, 5)
								+ "makemaster";
						String sqlMakename = "SELECT MakeName FROM "
								+ refMakeNameTable.toLowerCase()
								+ "  WHERE makecode='" + makeCode + "' ";
						ResultSet rsMakeName = st3.executeQuery(sqlMakename);
						if (rsMakeName.next())
							makeName = rsMakeName.getString(1);
						else
							makeName = "-";
						sqlDisplayDesc = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_"
								+ groupName.substring(0, 5).toLowerCase()
								+ "im_make" + makeCode + " where ItemCode='"
								+ itemCode + "'";
					} else {
						sqlDisplayDesc = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"
								+ groupCode + " where ItemCode='" + itemCode
								+ "' ";
						makeName = "-";
					}
                    System.out.println(sqlDisplayDesc);
					ResultSet rsDisplayDesc = st3.executeQuery(sqlDisplayDesc);

					if (rsDisplayDesc.next()) {
		%>
		<tr style="border-spacing: 0px" class="sortable">
			<td><%=i%></td>
			<td>
			<div align="left"><%=makeName%></div>
			</td>
			<td><%=rsDisplayDesc.getString("Partno")%></td>
			<td>
			<div align="left"><%=rsDisplayDesc.getString("Description")%></div>
			</td>
			<td>
			<div align="right"><%=rsEnqItems.getString("Quantity")%></div>
			</td>
			<td>
			<div align="right"><%=rsDisplayDesc.getString("SellingPrice")%></div>
			</td>
			
		
		</tr>
		<%
			i++;

					}

				}
		%>

		
	</table>

	<br>
	
	<br></br>
	<br></br>
	<br></br>
	
	

	<div>&nbsp;</div>
	
	<div align="right" style="font-size: small;"> For Sales Dept.
</div>


	<br><br><br><br>
	<br><br><br><br>
	
	</form>
	</body>

	</html>
</jsp:useBean>